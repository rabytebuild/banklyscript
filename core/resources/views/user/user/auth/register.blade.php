@extends($activeTemplate.'layouts.auth')
@section('content')
@php
    $mobile_code = @implode(',', $info['code']);
    $countries = json_decode(file_get_contents(resource_path('views/partials/country.json')));
    $policy = getContent('policy_pages.element');
@endphp
     <!-- Register v1 -->
     <div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                        <h1 class="">Register</h1>
                        <p class="">@lang('If you do not have an account with us, please register to have one.')</p>

                         
                         
                        <form method="POST" class="text-left auth-login-form mt-2" action="{{ route('user.register')}}" onsubmit="return submitUserForm();">
                        @csrf
                        @isset($reference)
                        <input type="text" hidden  name="referBy"  class="form-control" id="referenceBy" value="{{$reference}}" placeholder="@lang('Reference BY')" readonly/>
                        @endisset
                            <div class="form">

                                <div id="username-field" class="field-wrapper input">
                                    <label for="username">USERNAME</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                    <input
                                    type="text"
                                    class="form-control"
                                    id="username"
                                    name="username"
                                    placeholder="Enter Username"
                                    aria-describedby="username"
                                    tabindex="1"
                                    autofocus
                                  />
                                </div>

                                <div id="email-field" class="field-wrapper input">
                                    <label for="email">EMAIL</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-at-sign register"><circle cx="12" cy="12" r="4"></circle><path d="M16 8v5a3 3 0 0 0 6 0v-1a10 10 0 1 0-3.92 7.94"></path></svg>
                                    <input
                                    type="email"
                                    class="form-control"
                                    id="email"
                                    name="email"
                                    placeholder="example@email.com"
                                    aria-describedby="email"
                                    tabindex="2"
                                  />
                                </div>

                                <div id="phone-field" class="field-wrapper input">
                                    <label for="email">PHONE</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user register"><circle cx="12" cy="12" r="4"></circle></svg>
                                    <input
                                    name="mobile"
                                    id="mobile"
                                    class="form-control"
                                    id="mobile"
                                    value="{{ old('mobile') }}"
                                    placeholder="Phone Number"
                                    aria-describedby="mobile"
                                    tabindex="1"
                                    autofocus
                                  />
                                </div>



                                <div id="country-field" class="field-wrapper input">
                                    <label for="email">COUNTRY</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user register"><circle cx="12" cy="12" r="4"></circle></svg>
                                    <select name="country" id="currency" onchange="myFunction()" required  data-live-search="true"  class="selectpicker select-2 select2 form-control">
                                    <option selected disabled>Select Country</option>
                                    @foreach($countries as $key => $country)
                                        <option data-mobile_code="{{ $country->dial_code }}" value="{{ $country->country }}" data-code="{{ $key }}">{{ __($country->country) }}</option>
                                    @endforeach
                                    </select>
                                    @push('script')
                                    <script>
                                    function myFunction() {
                                    var mobile_code = $("#currency option:selected").attr('data-mobile_code');
                                    var code = $("#currency option:selected").attr('data-code');
                                    document.getElementById("code").value = code;
                                    document.getElementById("mobile_code").value = mobile_code;
                                    document.getElementById("22").innerHTML = "+"+mobile_code;
                                    };
                                    </script>
                                    @endpush
                                    <input type="hidden" id="mobile_code" name="mobile_codes">
                                    <input type="hidden" id="code" name="country_codes">
                                </div>

                                <div id="password-field" class="field-wrapper input mb-2">
                                <label for="email">PASSWORD</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                                    <input
                                    type="password"
                                    class="form-control form-control-merge"
                                    id="password"
                                    name="password"
                                    placeholder="Enter Password"
                                    aria-describedby="password"
                                    tabindex="3"
                                  />
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" id="toggle-password" class="feather feather-eye"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                </div>

                                <div id="password-field" class="field-wrapper input mb-2">
                                <label for="email">CONFIRM PASSOWRD</label>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                                    <input
                                    type="password"
                                    class="form-control form-control-merge"
                                    id="password_confirmation"
                                    name="password_confirmation"
                                    placeholder="Confirm Password"
                                    aria-describedby="password_confirmation"
                                    tabindex="3"
                                  />
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" id="toggle-password" class="feather feather-eye"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                                </div>

                                <div class="field-wrapper terms_condition">
                                    <div class="n-chk">
                                        <label class="new-control new-checkbox checkbox-primary">
                                          <input type="checkbox" class="new-control-input">
                                          <span class="new-control-indicator"></span><span>
                                          @lang('I agree with ')
                                          @foreach($policy as $singleData)
                                              <a href="{{ route('privacy.page', ['slug'=> slug($singleData->data_values->title), 'id'=>$singleData->id]) }}" class="text--base" target="_blank">
                                                  {{ __($singleData->data_values->title) }} {{ $loop->last == true ? '.' : ',' }}
                                              </a>
                                          @endforeach  
                                          </span>
                                        </label>
                                    </div>

                                </div>

                                <div class="d-sm-flex justify-content-between">
                                    <div class="field-wrapper">
                                        <button type="submit" class="btn btn--primary" value="">Get Started!</button>
                                    </div>
                                </div>

                                <div class="division">
                                    <span>OR</span>
                                </div>

                                <div class="social">
                                <p class="signup-link register">Already have an account? <a href="{{ route('user.login') }}">Log in</a></p>
                                </div>

                            </div>
                        </form>

                    </div>                    
                </div>
            </div>
        </div>
    </div>


 
    <!-- /Register v1 -->
@endsection

@push('script-lib')
<script src="{{ asset('assets/global/js/secure_password.js') }}"></script> 
@endpush

