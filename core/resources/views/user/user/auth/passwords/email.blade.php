@extends($activeTemplate.'layouts.auth')

@section('content')


<div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                        <h1 class="">Reset Password</h1>
                        <p class="">@lang('Please enter your email or username below to reset your password.')</p>
                         
                        <form method="POST" class="auth-forgot-password-form mt-2"  action="{{ route('user.password.email') }}">
          @csrf
          <div class="mb-1">
            <label for="forgot-password-email" class="form-label">@lang('Select One')</label>
           <select class="form-control" name="type">
                                    <option value="email">@lang('E-Mail Address')</option>
                                    <option value="username">@lang('Username')</option>
            </select>
          </div>

          <div class="mb-1">
             <label class="col-md-4 col-form-label text-md-right my_value"></label>
           <input type="text" class="form-control @error('value') is-invalid @enderror" name="value" value="{{ old('value') }}" required autofocus="off">

                                @error('value')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
          </div>
          <button class="btn btn--primary text-white w-100" type="submit" tabindex="2"> @lang('Send Password Code')</button>
        </form>

                                <div class="division">
                                      <span>OR</span>
                                </div>

                                

                                <p class="signup-link"> <a href="{{ route('user.login') }}">Login to account</a></p>

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

    (function($){
        "use strict";

        myVal();
        $('select[name=type]').on('change',function(){
            myVal();
        });
        function myVal(){
            $('.my_value').text($('select[name=type] :selected').text());
        }
    })(jQuery)
</script>
@endpush

@push('script-lib')
<script src="{{ asset($activeTemplateTrue. 'app-assets/js/scripts/pages/page-auth-forgot-password.min.js') }}"></script>
@endpush
