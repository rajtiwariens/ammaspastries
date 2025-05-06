<!-- SEO Meta Content -->
@push('meta')
    <meta name="description" content="@lang('shop::app.customers.login-form.page-title')"/>
    <meta name="keywords" content="@lang('shop::app.customers.login-form.page-title')"/>
@endPush

<x-shop::layouts
    :has-header="false"
    :has-feature="false"
    :has-footer="false"
>
    <!-- Page Title -->
    <x-slot:title>
        @lang('shop::app.customers.login-form.page-title')
    </x-slot>

    <div class="container mt-20 max-1180:px-5 max-md:mt-12">
        {!! view_render_event('bagisto.shop.customers.login.logo.before') !!}

        <!-- Company Logo -->
        <div class="flex items-center gap-x-14 max-[1180px]:gap-x-9">
            <a
                href="{{ route('shop.home.index') }}"
                class="m-[0_auto_20px_auto]"
                aria-label="@lang('shop::app.customers.login-form.bagisto')"
            >
                <img
                    src="{{ core()->getCurrentChannel()->logo_url ?? bagisto_asset('images/logo.svg') }}"
                    alt="{{ config('app.name') }}"
                    width="131"
                    height="29"
                >
            </a>
        </div>

        {!! view_render_event('bagisto.shop.customers.login.logo.after') !!}

        <!-- Form Container -->
        <div class="m-auto w-full max-w-[870px] rounded-xl border border-zinc-200 p-16 px-[90px] max-md:px-8 max-md:py-8 max-sm:border-none max-sm:p-0">
            <h1 class="font-dmserif text-4xl max-md:text-3xl max-sm:text-xl">
                @lang('shop::app.customers.login-form.page-title')
            </h1>

            <p class="mt-4 text-xl text-zinc-500 max-sm:mt-0 max-sm:text-sm">
                @lang('shop::app.customers.login-form.form-login-text')
            </p>

            <!-- Login Type Toggle -->
            <div class="mt-6 flex gap-4">
                <button
                    id="email-login-btn"
                    class="primary-button rounded-lg px-6 py-2 text-base font-medium {{ request()->has('otp') ? 'bg-gray-200 text-navyBlue' : 'bg-navyBlue text-white' }}"
                    onclick="toggleLoginForm('email')"
                >
                    @lang('shop::app.customers.login-form.email-login')
                </button>
                <button
                    id="otp-login-btn"
                    class="primary-button rounded-lg px-6 py-2 text-base font-medium {{ request()->has('otp') ? 'bg-navyBlue text-white' : 'bg-gray-200 text-navyBlue' }}"
                    onclick="toggleLoginForm('otp')"
                >
                    @lang('shop::app.customers.login-form.otp-login')
                </button>
            </div>

            {!! view_render_event('bagisto.shop.customers.login.before') !!}

            <div class="mt-14 rounded max-sm:mt-8">
                <!-- Email/Password Form -->
                <div id="email-login-form" class="login-form {{ request()->has('otp') ? 'hidden' : '' }}">
                    <x-shop::form :action="route('shop.customer.session.create')">
                        {!! view_render_event('bagisto.shop.customers.login_form_controls.before') !!}

                        <!-- Email -->
                        <x-shop::form.control-group>
                            <x-shop::form.control-group.label class="required">
                                @lang('shop::app.customers.login-form.email')
                            </x-shop::form.control-group.label>

                            <x-shop::form.control-group.control
                                type="email"
                                class="px-6 py-4 max-md:py-3 max-sm:py-2"
                                name="email"
                                rules="required|email"
                                value=""
                                :label="trans('shop::app.customers.login-form.email')"
                                placeholder="email@example.com"
                                :aria-label="trans('shop::app.customers.login-form.email')"
                                aria-required="true"
                            />

                            <x-shop::form.control-group.error control-name="email" />
                        </x-shop::form.control-group>

                        <!-- Password -->
                        <x-shop::form.control-group>
                            <x-shop::form.control-group.label class="required">
                                @lang('shop::app.customers.login-form.password')
                            </x-shop::form.control-group.label>

                            <x-shop::form.control-group.control
                                type="password"
                                class="px-6 py-4 max-md:py-3 max-sm:py-2"
                                id="password"
                                name="password"
                                rules="required|min:6"
                                value=""
                                :label="trans('shop::app.customers.login-form.password')"
                                :placeholder="trans('shop::app.customers.login-form.password')"
                                :aria-label="trans('shop::app.customers.login-form.password')"
                                aria-required="true"
                            />

                            <x-shop::form.control-group.error control-name="password" />
                        </x-shop::form.control-group>

                        <div class="flex justify-between">
                            <div class="flex select-none items-center gap-1.5">
                                <input
                                    type="checkbox"
                                    id="show-password"
                                    class="peer hidden"
                                    onchange="switchVisibility()"
                                />

                                <label
                                    class="icon-uncheck peer-checked:icon-check-box cursor-pointer text-2xl text-navyBlue peer-checked:text-navyBlue max-sm:text-xl"
                                    for="show-password"
                                ></label>

                                <label
                                    class="cursor-pointer select-none text-base text-zinc-500 max-sm:text-sm ltr:pl-0 rtl:pr-0"
                                    for="show-password"
                                >
                                    @lang('shop::app.customers.login-form.show-password')
                                </label>
                            </div>

                            <div class="block">
                                <a
                                    href="{{ route('shop.customers.forgot_password.create') }}"
                                    class="cursor-pointer text-base text-black max-sm:text-sm"
                                >
                                    <span>
                                        @lang('shop::app.customers.login-form.forgot-pass')
                                    </span>
                                </a>
                            </div>
                        </div>

                        <!-- Captcha -->
                        @if (core()->getConfigData('customer.captcha.credentials.status'))
                            <div class="mt-5 flex">
                                {!! Captcha::render() !!}
                            </div>
                        @endif

                        <!-- Submit Button -->
                        <div class="mt-8 flex flex-wrap items-center gap-9 max-sm:justify-center max-sm:gap-5 max-sm:text-center">
                            <button
                                class="primary-button m-0 mx-auto block w-full max-w-[374px] rounded-2xl px-11 py-4 text-center text-base max-md:max-w-full max-md:rounded-lg max-md:py-3 max-sm:py-1.5 ltr:ml-0 rtl:mr-0"
                                type="submit"
                            >
                                @lang('shop::app.customers.login-form.button-title')
                            </button>

                            {!! view_render_event('bagisto.shop.customers.login_form_controls.after') !!}
                        </div>
                    </x-shop::form>
                </div>

                <!-- OTP Login Form -->
                <div id="otp-login-form" class="login-form {{ request()->has('otp') ? '' : 'hidden' }}">
                    <x-shop::form id="otp-form" :action="route('shop.customer.otp.verify')" method="POST">
                        <!-- Mobile Number -->
                        <x-shop::form.control-group>
                            <x-shop::form.control-group.label class="required">
                                @lang('shop::app.customers.login-form.mobile')
                            </x-shop::form.control-group.label>

                            <x-shop::form.control-group.control
                                type="text"
                                class="px-6 py-4 max-md:py-3 max-sm:py-2"
                                name="mobile"
                                rules="required"
                                :value="request()->input('mobile', old('mobile'))"
                                :disabled="request()->has('otpw')"
                                :label="trans('shop::app.customers.login-form.mobile')"
                                placeholder="1234567890"
                                :aria-label="trans('shop::app.customers.login-form.mobile')"
                                aria-required="true"
                            />

                            <x-shop::form.control-group.error control-name="mobile" />
                        </x-shop::form.control-group>

                        <!-- Send OTP Button -->
                        <div class="mt-8 {{ request()->has('otp') ? 'hidden' : '' }}">
                            <button
                                id="send-otp-btn"
                                class="primary-button m-0 mx-auto block w-full max-w-[374px] rounded-2xl px-11 py-4 text-center text-base max-md:max-w-full max-md:rounded-lg max-md:py-3 max-sm:py-1.5 ltr:ml-0 rtl:mr-0"
                                type="button"
                                onclick="sendOTP()"
                            >
                                @lang('shop::app.customers.login-form.send-otp')
                            </button>
                        </div>

                        <!-- OTP Input -->
                        <div id="otp-input-group" class="mt-8 {{ request()->has('otp') ? '' : 'hidden' }}">
                            <x-shop::form.control-group>
                                <x-shop::form.control-group.label class="required">
                                    @lang('shop::app.customers.login-form.otp')
                                </x-shop::form.control-group.label>

                                <x-shop::form.control-group.control
                                    type="text"
                                    class="px-6 py-4 max-md:py-3 max-sm:py-2"
                                    name="otp"
                                    rules="required|digits:6"
                                    value=""
                                    :label="trans('shop::app.customers.login-form.otp')"
                                    placeholder="123456"
                                    :aria-label="trans('shop::app.customers.login-form.otp')"
                                    aria-required="true"
                                />

                                <x-shop::form.control-group.error control-name="otp" />
                            </x-shop::form.control-group>

                            <!-- Verify OTP Button -->
                            <div class="mt-8">
                                <button
                                    class="primary-button m-0 mx-auto block w-full max-w-[374px] rounded-2xl px-11 py-4 text-center text-base max-md:max-w-full max-md:rounded-lg max-md:py-3 max-sm:py-1.5 ltr:ml-0 rtl:mr-0"
                                    type="submit"
                                    onclick="debugFormSubmission()"
                                >
                                    @lang('shop::app.customers.login-form.verify-otp')
                                </button>
                            </div>
                        </div>
                    </x-shop::form>
                </div>
            </div>

            {!! view_render_event('bagisto.shop.customers.login.after') !!}

            <p class="mt-5 font-medium text-zinc-500 max-sm:text-center max-sm:text-sm">
                @lang('shop::app.customers.login-form.new-customer')

                <a
                    class="text-navyBlue"
                    href="{{ route('shop.customers.register.index') }}"
                >
                    @lang('shop::app.customers.login-form.create-your-account')
                </a>
            </p>
        </div>

        <p class="mb-4 mt-8 text-center text-xs text-zinc-500">
            @lang('shop::app.customers.login-form.footer', ['current_year' => date('Y') ])
        </p>
    </div>

    @push('scripts')
        {!! Captcha::renderJS() !!}

        <script>
            function switchVisibility() {
                let passwordField = document.getElementById("password");
                passwordField.type = passwordField.type === "password" ? "text" : "password";
            }

            function toggleLoginForm(type) {
                const emailForm = document.getElementById('email-login-form');
                const otpForm = document.getElementById('otp-login-form');
                const emailBtn = document.getElementById('email-login-btn');
                const otpBtn = document.getElementById('otp-login-btn');

                if (type === 'email') {
                    emailForm.classList.remove('hidden');
                    otpForm.classList.add('hidden');
                    emailBtn.classList.add('bg-navyBlue', 'text-white');
                    emailBtn.classList.remove('bg-gray-200', 'text-navyBlue');
                    otpBtn.classList.add('bg-gray-200', 'text-navyBlue');
                    otpBtn.classList.remove('bg-navyBlue', 'text-white');
                } else {
                    emailForm.classList.add('hidden');
                    otpForm.classList.remove('hidden');
                    otpBtn.classList.add('bg-navyBlue', 'text-white');
                    otpBtn.classList.remove('bg-gray-200', 'text-navyBlue');
                    emailBtn.classList.add('bg-gray-200', 'text-navyBlue');
                    emailBtn.classList.remove('bg-navyBlue', 'text-white');
                }
            }

            async function sendOTP() {
                const mobileInput = document.querySelector('input[name="mobile"]');

                try {
                    const response = await fetch("{{ route('shop.customer.otp.send') }}", {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': '{{ csrf_token() }}',
                        },
                        body: JSON.stringify({ mobile: mobileInput.value }),
                    });

                    const data = await response.json();

                    if (data.success) {
                        // Redirect with query parameters to maintain state
                        window.location.href = "{{ route('shop.customer.session.index') }}?otp=true&mobile=" + encodeURIComponent(mobileInput.value);
                    } else {
                        toastr.error(data.message);
                    }
                } catch (error) {
                    console.error('Error sending OTP:', error);
                    toastr.error('Failed to send OTP. Please try again.');
                }
            }

            function debugFormSubmission() {
                const form = document.getElementById('otp-form');
                const formData = new FormData(form);
                console.log('OTP Form Submission:', Object.fromEntries(formData));
            }

            // Initialize form state based on query parameters
            document.addEventListener('DOMContentLoaded', function () {
                const urlParams = new URLSearchParams(window.location.search);
                if (urlParams.get('otp') === 'true') {
                    toggleLoginForm('otp');
                }
            });
        </script>
    @endpush
</x-shop::layouts>