@extends($activeTemplate.'layouts.auth')

@section('content')
 <!-- Forgot Password v1 -->

<div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                        <h1 class="">@lang('Reset Password') 🔒</h1>
                        <p class="card-text mb-2">Enter your new password below
                        <form method="POST" class="auth-forgot-password-form mt-2"  action="{{ route('user.password.update') }}">
          @csrf


          <div class="mb-1">
           <input type="hidden" name="email" value="{{ $email }}">
           <input type="hidden" name="token" value="{{ $token }}">

             <label class="col-md-4 col-form-label">@lang('Password')</label>
           <input id="password" type="password" Placeholder="Enter New Password" class="form-control @error('password') is-invalid @enderror" name="password" required>

          </div>
          <div class="mb-1">
             <label class="col-md-4 col-form-label">@lang('Confirm Password')</label>
           <input id="password-confirm" placeholder="Confirm New Password" type="password" class="form-control" name="password_confirmation" required>

          </div>
          <button class="btn  btn--primary text-white w-100" type="submit" tabindex="2">  @lang('Reset Password')</button>
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
