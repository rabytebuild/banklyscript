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

                    <h4 class="card-title mb-1 text-center">@lang('Verify Phone') 🔒</h4>
        <p class="card-text mb-2">@lang('Please Enter The Verification Code Sent As SMS To Your Phone Number to Get Access To Your Account')
        </p>

          <form method="POST" class="auth-forgot-password-form mt-2"  action="{{route('user.verify.sms')}}">
          @csrf



          <div class="mb-1">
             <label class="col-md-4 col-form-label">@lang('Verification Code')</label>
           <input type="text" name="sms_verified_code" class="form-control" id="code">

          </div>
          <button class="btn  btn--primary text-white w-100" type="submit" tabindex="2"> @lang('Verify Code')</button>
        </form>

         <p class="text-center mt-2">
          
          <a href="{{route('user.send.verify.code')}}?type=phone">
            <span>@lang('Resend code')</span>
          </a>
        </p>

                                
 
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



