@extends($activeTemplate.'layouts.auth')

@section('content')


<div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                        <h1 class="">Sign In</h1>
                        <p class="">@lang('If you do not have an account with us, please register to have one.')</p>
                         
                        <form method="POST" class="ext-left auth-login-form mt-2" action="{{ route('user.login')}}" onsubmit="return submitUserForm();">
                        @csrf
                            <div class="form">

                                <div id="username-field" class="field-wrapper input">
                                    <label for="username">@lang('Username or Email')</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                    <input
                                    type="text"
                                    class="form-control"
                                    id="username"
                                    name="username"
                                    placeholder="Enter Username or Email"
                                    aria-describedby="login-email"
                                    tabindex="1"
                                    autofocus
                                  />
                                </div>

                                <div id="password-field" class="field-wrapper input mb-2">
                                    <div class="d-flex justify-content-between">
                                        <label for="password">{{ __('Password') }}</label>
                                        <a href="{{route('user.password.request')}}" class="forgot-pass-link">Forgot Password?</a>
                                    </div>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                                    <input
                                    type="password"
                                    class="form-control form-control-merge"
                                    id="password"
                                    name="password"
                                    tabindex="2"
                                    placeholder="****** "
                                    aria-describedby="login-password"
                                  />
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" id="toggle-password" class="feather feather-eye"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                </div>

                                <div class="mb-1">
                                <div class="d-flex justify-content-between">
                                @php echo loadReCaptcha() @endphp
                                </div>
                                </div>
                                @include($activeTemplate.'partials.custom_captcha')


                                
                                <div class="d-sm-flex justify-content-between">
                                    <div class="field-wrapper">
                                        <button type="submit" class="btn btn--primary" value="">Log In</button>
                                    </div>
                                </div>

                                <div class="division">
                                      <span>OR</span>
                                </div>

                                 

                                <p class="signup-link">Not registered ? <a href="{{ route('user.register') }}">Create an account</a></p>

                            </div>
                        </form>

                    </div>                    
                </div>
            </div>
        </div>
    </div>

 
@endsection

@push('script')
    <script>
        "use strict";
        function submitUserForm() {
            var response = grecaptcha.getResponse();
            if (response.length == 0) {
                document.getElementById('g-recaptcha-error').innerHTML = '<span class="text-danger">@lang("Captcha field is required.")</span>';
                return false;
            }
            return true;
        }
    </script>
@endpush
