@extends($activeTemplate.'layouts.auth')

@section('content')
 <!-- Forgot Password v1 -->

<div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                        <h1 class="">@lang('Reset Password') 🔒</h1>
                        <p class="card-text mb-2">Enter the verification code sent to your email address<br>
                        @lang('Please also check your Junk/Spam Folder. if not found')
                        </p>
                         
                        <form method="POST" class="auth-forgot-password-form mt-2"  action="{{ route('user.password.verify.code') }}">
                        @csrf


                        <div class="mb-1">
                        <input type="hidden" name="email" value="{{ $email }}">

                          <label class="col-md-4 col-form-label">@lang('Verification Code')</label>
                        <input type="text" class="form-control" name="code" id="code" value="{{ old('code') }}" required autofocus="off">

                        </div>
                        <br>
                        <button class="btn  btn--primary text-white w-100" type="submit" tabindex="2"> @lang('Verify Code')</button>
                      </form>
                      <br>
                      <div class="division">
                                      <span>OR</span>
                                </div>

                                

                                <p class="signup-link"> <a href="{{ route('user.login') }}">Login to account</a></p>
                      
                    </div>                    
                </div>
            </div>
        </div>
    </div>
    <!-- /Forgot Password v1 -->
@endsection
@push('script')

@endpush
