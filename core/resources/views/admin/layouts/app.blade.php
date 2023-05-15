@extends('admin.layouts.master')

@section('content')
        @include('admin.partials.sidenav')
        @include('admin.partials.topnav')


    <!-- BEGIN: Content-->
    <!-- BEGIN: Content-->
    <div class="app-content content ecommerce-application">
      <div class="content-overlay"></div>
      <div class="header-navbar-shadow"></div>
      <div class="content-wrapper container-xxl p-0">
        <div class="content-header row">
          <div class="content-header-left col-md-9 col-12 mb-2">
            <div class="row breadcrumbs-top">
              <div class="col-12">
                <h2 class="content-header-title float-start mb-0">{{ __($pageTitle) }}</h2>
                <div class="breadcrumb-wrapper">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">@lang('Dashboard')</a>
                    </li>

                    <li class="breadcrumb-item active">{{ __($pageTitle) }}
                    </li>
                  </ol>
                </div>
              </div>
            </div>
          </div>

        </div>
                @yield('panel')


@endsection
