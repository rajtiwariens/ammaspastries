<?php

namespace Webkul\Shop\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Event;
use Webkul\Customer\Models\Customer;
use Webkul\Customer\Models\CustomerOtp;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class OtpController extends Controller
{
    /**
     * Send OTP to the customer's mobile number.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendOtp(Request $request)
    {
        $request->validate([
            'mobile' => 'required',
        ]);

        $mobile = $request->input('mobile');
        $customer = Customer::where('phone', $mobile)->first();

        if (!$customer) {
            Log::warning('No customer found for mobile', ['mobile' => $mobile]);
            return response()->json([
                'success' => false,
                'message' => trans('shop::app.customers.login-form.invalid-mobile'),
            ], 422);
        }

        // Generate OTP
        $otp = $this->generateOtp();
        $expiresAt = Carbon::now()->addMinutes(5);

        // Store OTP in database
        CustomerOtp::create([
            'customer_id' => $customer->id,
            'mobile' => $mobile,
            'otp' => $otp,
            'expires_at' => $expiresAt,
            'is_used' => false,
        ]);

        // Placeholder for sending OTP via SMS
        try {
            // Replace with actual SMS gateway: $this->smsGateway->send($mobile, "Your OTP is {$otp}. Valid for 5 minutes.");
            Log::info("OTP {$otp} sent to {$mobile}");
        } catch (\Exception $e) {
            Log::error("Failed to send OTP: {$e->getMessage()}");
            return response()->json([
                'success' => false,
                'message' => trans('shop::app.customers.login-form.otp-send-failed'),
            ], 500);
        }

        // Flash success message to session
        session()->flash('success', trans('shop::app.customers.login-form.otp-sent'));

        return response()->json([
            'success' => true,
        ]);
    }

    /**
     * Verify OTP and log in the customer.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function verifyOtp(Request $request)
    {
        $request->validate([
            'mobile' => 'required',
            'otp' => 'required|digits:6',
        ]);

        $mobile = $request->input('mobile');
        $otp = $request->input('otp');

        Log::info('verifyOtp input', ['mobile' => $mobile, 'otp' => $otp]);

        $otpRecord = CustomerOtp::where('mobile', $mobile)
            ->where('otp', $otp)
            ->where('is_used', false)
            ->where('expires_at', '>=', Carbon::now())
            ->first();

        Log::info('OTP record found', ['otpRecord' => $otpRecord ? $otpRecord->toArray() : null]);

        if (!$otpRecord) {
            session()->flash('error', trans('shop::app.customers.login-form.invalid-otp'));
            return redirect()->back()->withInput();
        }

        $customer = Customer::where('phone', $mobile)->first();

        Log::info('Customer found', ['customer' => $customer ? $customer->toArray() : null]);

        if (!$customer) {
            session()->flash('error', trans('shop::app.customers.login-form.invalid-mobile'));
            return redirect()->back()->withInput();
        }

        // Check customer status
        if (!$customer->status) {
            Log::warning('Customer account not activated', ['customer_id' => $customer->id]);
            session()->flash('warning', trans('shop::app.customers.login-form.not-activated'));
            return redirect()->back()->withInput();
        }

        // Check customer verification
        if (!$customer->is_verified) {
            Log::warning('Customer not verified', ['customer_id' => $customer->id]);
            session()->flash('info', trans('shop::app.customers.login-form.verify-first'));
            return redirect()->back()->withInput();
        }

        // Mark OTP as used
        $otpRecord->update(['is_used' => true]);

        // Log the customer in
        Auth::guard('customer')->login($customer, true); // Persist login with remember

        Log::info('Customer login attempted', [
            'customer_id' => $customer->id,
            'auth_success' => Auth::guard('customer')->check(),
            'session_id' => session()->getId()
        ]);

        // Dispatch login event to prepare cart
        Event::dispatch('customer.after.login', $customer);

        // Check redirect configuration
        if (core()->getConfigData('customer.settings.login_options.redirected_to_page') == 'account') {
            Log::info('Redirecting to account page', ['customer_id' => $customer->id]);
            return redirect()->route('shop.customers.account.profile.index');
        }

        Log::info('Redirecting to home page', ['customer_id' => $customer->id]);
        return redirect()->route('shop.home.index');
    }

    /**
     * Generate a 6-digit OTP.
     *
     * @return string
     */
    protected function generateOtp(): string
    {
        return str_pad(rand(0, 999999), 6, '0', STR_PAD_LEFT);
    }
}