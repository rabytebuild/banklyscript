@php
    $contact = getContent('contact_us.content', true);
    $contacts = getContent('contact_us.element');
@endphp
@php
    $footer = getContent('footer.content', true);
    $medias = getContent('footer.element');
    $policy = getContent('policy_pages.element');
@endphp
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!--====== Title ======-->

      @include('partials.seo')

    <title>{{ $general->sitename(__($pageTitle)) }}</title>
    <link rel="stylesheet" href="{{url('/')}}/assets/frontend/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="{{url('/')}}/assets/frontend/assets/css/fontawesome.min.css">
    <link rel="stylesheet" href="{{url('/')}}/assets/frontend/assets/css/jquery-ui.css">
    <link rel="stylesheet" href="{{url('/')}}/assets/frontend/assets/css/plugin/nice-select.css">
    <link rel="stylesheet" href="{{url('/')}}/assets/frontend/assets/css/plugin/slick.css">
    <link rel="stylesheet" href="{{url('/')}}/assets/frontend/assets/css/arafat-font.css">
    <link rel="stylesheet" href="{{url('/')}}/assets/frontend/assets/css/plugin/animate.css">
    <link rel="stylesheet" href="{{url('/')}}/assets/frontend/assets/css/style.css">
</head>

<body>
    <!-- start preloader -->
    <div class="preloader" id="preloader"></div>
    <!-- end preloader -->

    <!-- Scroll To Top Start-->
    <a href="javascript:void(0)" class="scrollToTop"><i class="fas fa-angle-double-up"></i></a>
    <!-- Scroll To Top End -->

    <!-- header-section start -->
    <header class="header-section">
        <div class="overlay">
          <div class="container">
            <div class="row d-flex header-area">
              <nav class="navbar navbar-expand-lg navbar-light">
                <a class="navbar-brand" href="{{url('/')}}">
                  <img src="{{getImage(imagePath()['logoIcon']['path'] .'/logo.png')}}" class="logoo" width="50" alt="logo">
                </a>
                <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse"
                  data-bs-target="#navbar-content">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbar-content">
                  <ul class="navbar-nav mr-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="{{url('/')}}">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" aria-current="page" href="{{route('pages','about')}}">About Us</a>
                    </li>
                     
                    <li class="nav-item">
                      <a class="nav-link" href="{{url('/')}}/contact">Contact Us</a>
                    </li>
                  </ul>
                  <div class="right-area header-action d-flex align-items-center">
                  @auth
                     <a  class="cmn-btn" href="{{ route('user.home') }}">Account</a> 
                   @else
                    <a  class="cmn-btn" href="{{ route('user.login') }}">Login</a>
                   @endauth
                    
                </div>
                </div>
              </nav>
            </div>
          </div>
        </div>
    </header>
    <!-- header-section end -->
    @yield('content')

 <!-- Footer Area Start -->
 <div class="footer-section">
        <div class="container pt-120">
            <br>
            <div class="row">
                <div class="col-12">
                    <div class="footer-bottom">
                        <div class="left">
                        Copyright © {{date('Y')}} {{$general->sitename}}. All rights reserved.
                        </div>
                        <div class="right">
                        @foreach($policy as $singlePolicy)
                        <a href="{{ route('privacy.page', ['slug'=> slug($singlePolicy->data_values->title), 'id'=>$singlePolicy->id]) }}" class="cus-bor">{{ __($singlePolicy->data_values->title) }}</a>
                        @endforeach
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="img-area">
            <img src="assets/images/footer-Illu-left.png" class="left" alt="Images">
            <img src="assets/images/footer-Illu-right.png" class="right" alt="Images">
        </div>
    </div>
    <!-- Footer Area End -->

    <!--==================================================================-->
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="{{url('/')}}/assets/frontend/assets/js/jquery.min.js"></script>
    <script src="{{url('/')}}/assets/frontend/assets/js/jquery-ui.js"></script>
    <script src="{{url('/')}}/assets/frontend/assets/js/bootstrap.min.js"></script>
    <script src="{{url('/')}}/assets/frontend/assets/js/fontawesome.js"></script>
    <script src="{{url('/')}}/assets/frontend/assets/js/plugin/slick.js"></script>
    <script src="{{url('/')}}/assets/frontend/assets/js/plugin/jquery.nice-select.min.js"></script>
    <script src="{{url('/')}}/assets/frontend/assets/js/plugin/wow.min.js"></script>
    <script src="{{url('/')}}/assets/frontend/assets/js/plugin/plugin.js"></script>
    <script src="{{url('/')}}/assets/frontend/assets/js/main.js"></script>
</body>

</html>
