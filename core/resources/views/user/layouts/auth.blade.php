<!-- BEGIN: Theme CSS--><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    @include('partials.seo') 
    <title>{{ $general->sitename(__($pageTitle)) }}</title>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="{{ asset($activeTemplateTrue. 'user-assets/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{ asset($activeTemplateTrue. 'user-assets/assets/css/plugins.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{ asset($activeTemplateTrue. 'user-assets/assets/css/authentication/form-2.css')}}" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <link rel="stylesheet" type="text/css" href="{{ asset($activeTemplateTrue. 'user-assets/assets/css/forms/theme-checkbox-radio.css')}}">
    <link rel="stylesheet" type="text/css" href="{{ asset($activeTemplateTrue. 'user-assets/assets/css/forms/switches.css')}}">
    <link rel="stylesheet" type="text/css" href="{{ asset($activeTemplateTrue. 'assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset($activeTemplateTrue. 'css/color.php?color='.$general->base_color.'&secondColor='.$general->secondary_color) }}">
    <link rel="stylesheet" type="text/css" href="{{ asset($activeTemplateTrue. 'app-assets/vendors/css/extensions/toastr.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset($activeTemplateTrue. 'app-assets/css/plugins/extensions/ext-component-toastr.min.css') }}">
</head>
<body class="form">
    
        @yield('content')
   
    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="{{ asset($activeTemplateTrue. 'user-assets/assets/js/libs/jquery-3.1.1.min.js')}}"></script>
    <script src="{{ asset($activeTemplateTrue. 'user-assets/bootstrap/js/popper.min.js')}}"></script>
    <script src="{{ asset($activeTemplateTrue. 'user-assets/bootstrap/js/bootstrap.min.js')}}"></script>
    
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="{{ asset($activeTemplateTrue. 'user-assets/assets/js/authentication/form-2.js')}}"></script>
    <script src="{{ asset($activeTemplateTrue. 'app-assets/vendors/js/extensions/toastr.min.js') }}"></script>
    <script>
      $(window).on('load',  function(){
        if (feather) {
          feather.replace({ width: 14, height: 14 });
        }
      })
    </script>

  @stack('script-lib')

  @stack('script')

  @include('partials.plugins')

  @include('partials.notify')


    <script>

        (function ($) {
            "use strict";
            $(".langSel").on("change", function() {
                window.location.href = "{{route('home')}}/change/"+$(this).val() ;
            });

        })(jQuery);

    </script>

</body>
</html>