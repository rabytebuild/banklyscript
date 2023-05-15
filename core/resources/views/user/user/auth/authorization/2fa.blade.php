@extends($activeTemplate.'layouts.auth')
@section('content')
 <!-- Email Verify v1 -->
 @extends($activeTemplate.'layouts.auth')

@section('content')


<div class="form-container outer">
        <div class="form-form">
            <div class="form-form-wrap">
                <div class="form-container">
                    <div class="form-content">

                    <h4 class="card-title mb-1 text-center">@lang('2FA Verification') 🔒</h4>
        <p class="card-text mb-2">@lang('Please Enter The Google 2FA Code To Get Access To Your Account')
        </p>

          <form method="POST" class="auth-forgot-password-form mt-2"  action="{{route('user.go2fa.verify')}}">
          @csrf

          <div class="mb-1">
             <label class="col-md-4 col-form-label">@lang('Verification Code')</label>
           <input type="text" name="code" id="code" class="form-control">

          </div>
          <button class="btn  btn--primary text-white w-100" type="submit" tabindex="2"> @lang('Verify Code')</button>
        </form>

                                
 
                            </div>
                        

                    </div>                    
                </div>
            </div>
        </div>
    </div>
 
    <!-- /Email Verify v1 -->
@endsection
@push('script')
<script>
    (function($){
        "use strict";
        $('#code').on('input change', function () {
          var xx = document.getElementById('code').value;
          $(this).val(function (index, value) {
             value = value.substr(0,7);
              return value.replace(/\W/gi, '').replace(/(.{3})/g, '$1 ');
          });
      });
    })(jQuery)
</script>
@endpush



