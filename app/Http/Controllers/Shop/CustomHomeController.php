<?php

namespace App\Http\Controllers\Shop;

use Webkul\Shop\Http\Controllers\Controller;
use Illuminate\Support\Facades\Mail;
use Webkul\Shop\Http\Requests\ContactRequest;
use Webkul\Shop\Mail\ContactUs;
use Webkul\Theme\Repositories\ThemeCustomizationRepository;
use App\Models\Contact;

class CustomHomeController extends Controller
{
    /**
     * Using const variable for status
     */
    const STATUS = 1;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(protected ThemeCustomizationRepository $themeCustomizationRepository) {}

    /**
     * Loads the home page for the storefront.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        visitor()->visit();

        $customizations = $this->themeCustomizationRepository->orderBy('sort_order')->findWhere([
            'status'     => self::STATUS,
            'channel_id' => core()->getCurrentChannel()->id,
            'theme_code' => core()->getCurrentChannel()->theme,
        ]);

        return view('shop::home.index', compact('customizations'));
    }

    /**
     * Loads the home page for the storefront if something wrong.
     *
     * @return \Exception
     */
    public function notFound()
    {
        abort(404);
    }

    /**
     * Summary of contact.
     *
     * @return \Illuminate\View\View
     */
    public function contactUs2()
    {  dd('custom controller');
        return view('shop::home.contact-us');
    }

    /**
     * Summary of store.
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function storeContactUsSendMail(ContactRequest $contactRequest)
    {
        try {
            // Store in DB
            Contact::create($contactRequest->only([
                'name',
                'email',
                'contact',
                'message',
            ]));

            // Send mail
            // Mail::queue(new ContactUs($contactRequest->only([
            //     'name',
            //     'email',
            //     'contact',
            //     'message',
            // ])));

            session()->flash('success', trans('shop::app.home.thanks-for-contact'));
        } catch (\Exception $e) {
            session()->flash('error', $e->getMessage());
            report($e);
        }

        return back();
    }

}
