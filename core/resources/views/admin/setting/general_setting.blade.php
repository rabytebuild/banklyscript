@extends('admin.layouts.app')
@section('panel')
    <div class="row mb-none-30">
        <div class="col-lg-12 col-md-12 mb-30">
            <div class="card">
                <div class="card-body">
                    <form action="" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group  mb-1">
                                    <label class="form-control-label font-weight-bold"> @lang('Site Title') </label>
                                    <input class="form-control form-control-lg" type="text" name="sitename" value="{{$general->sitename}}">
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group  mb-1">
                                    <label class="form-control-label font-weight-bold">@lang('Currency')</label>
                                    <input class="form-control form-control-lg" type="text" name="cur_text" value="{{$general->cur_text}}">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group  mb-1">
                                    <label class="form-control-label font-weight-bold">@lang('Currency Symbol') </label>
                                    <input class="form-control form-control-lg" type="text" name="cur_sym" value="{{$general->cur_sym}}">
                                </div>
                            </div>

                            <div class="form-group col-md-3  mb-1">
                                <label class="form-control-label font-weight-bold"> @lang('Timezone')</label>
                                <select class="select2-basic form-control" name="timezone">
                                    @foreach($timezones as $timezone)
                                    <option value="'{{ @$timezone}}'" @if(config('app.timezone') == $timezone) selected @endif>{{ __($timezone) }}</option>
                                    @endforeach
                                </select>
                            </div>

                        </div>
                        <div class="row">
                            <div class="form-group col-md-3 mb-1">
                                <label class="form-control-label font-weight-bold"> @lang('Site Base Color')</label>
                                <div class="input-group">
                                <span class="input-group-addon ">
                                    <input type='text' class="form-control form-control-lg colorPicker" value="{{$general->base_color}}"/>
                                </span>
                                    <input type="text" class="form-control form-control-lg colorCode" name="base_color" value="{{ $general->base_color }}"/>
                                </div>
                            </div>
                            <div class="form-group col-md-3 mb-1">
                                <label class="form-control-label font-weight-bold"> @lang('Site Secondary Color')</label>
                                <div class="input-group">
                                <span class="input-group-addon">
                                    <input type='text' class="form-control form-control-lg colorPicker" value="{{$general->secondary_color}}"/>
                                </span>
                                    <input type="text" class="form-control form-control-lg colorCode" name="secondary_color" value="{{ $general->secondary_color }}"/>
                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="form-control-label font-weight-bold">@lang('Agree policy')</label>

                                 <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input"  name="agree" @if($general->agree) checked @endif id="customSwitch4" />
                <label class="form-check-label" for="customSwitch4">
                  <span class="switch-icon-left"><i data-feather="plus"></i></span>
                  <span class="switch-icon-right"><i data-feather="minus"></i></span>
                </label>
              </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-2">
                                <label class="form-control-label font-weight-bold">@lang('User Registration')</label>
                                <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input"  name="registration" @if($general->registration) checked @endif id="customSwitch5" />
                <label class="form-check-label" for="customSwitch5">
                  <span class="switch-icon-left"><i data-feather="plus"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>

                            </div>

                            <div class="form-group col-md-2">
                                <label class="form-control-label font-weight-bold">@lang('Force SSL')</label>
                                <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input"  name="force_ssl" @if($general->force_ssl) checked @endif id="customSwitch6" />
                <label class="form-check-label" for="customSwitch6">
                  <span class="switch-icon-left"><i data-feather="plus"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>

                            </div>
                            <div class="form-group col-lg-2 col-sm-6 col-md-4">
                                <label class="form-control-label font-weight-bold"> @lang('Email Verification')</label>
                                 <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input"  name="ev" @if($general->ev) checked @endif id="customSwitch7" />
                <label class="form-check-label" for="customSwitch7">
                  <span class="switch-icon-left"><i data-feather="plus"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>

                            </div>
                            <div class="form-group col-lg-2 col-sm-6 col-md-4">
                                <label class="form-control-label font-weight-bold">@lang('Email Notification')</label>
                                 <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input"  name="en" @if($general->en) checked @endif id="customSwitch8" />
                <label class="form-check-label" for="customSwitch8">
                  <span class="switch-icon-left"><i data-feather="plus"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>

                            </div>
                            <div class="form-group col-lg-2 col-sm-6 col-md-4">
                                <label class="form-control-label font-weight-bold"> @lang('SMS Verification')</label>
                                 <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input"  name="sv" @if($general->sv) checked @endif id="customSwitch9" />
                <label class="form-check-label" for="customSwitch9">
                  <span class="switch-icon-left"><i data-feather="plus"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>

                            </div>
                            <div class="form-group col-lg-2 col-sm-6 col-md-4">
                                <label class="form-control-label font-weight-bold">@lang('SMS Notification')</label>
                                <div class="form-check form-switch form-check-primary">
                <input type="checkbox" class="form-check-input"  name="sn" @if($general->sn) checked @endif id="customSwitch10" />
                <label class="form-check-label" for="customSwitch10">
                  <span class="switch-icon-left"><i data-feather="plus"></i></span>
                  <span class="switch-icon-right"><i data-feather="x"></i></span>
                </label>
              </div>

                            </div>
                        </div>

                        <div class="form-group">
                        <br>
                            <button type="submit" class="btn text-white btn--primary btn-block btn-lg">@lang('Update')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script-lib')
    <script src="{{ asset('assets/admin/js/spectrum.js') }}"></script>
@endpush

@push('style-lib')
    <link rel="stylesheet" href="{{ asset('assets/admin/css/spectrum.css') }}">
@endpush


@push('style')
    <style>
        .sp-replacer {
            padding: 0;
            border: 1px solid rgba(0, 0, 0, .125);
            border-radius: 5px 0 0 5px;
            border-right: none;
        }

        .sp-preview {
            width: 100px;
            height: 46px;
            border: 0;
        }

        .sp-preview-inner {
            width: 110px;
        }

        .sp-dd {
            display: none;
        }
        .select2-container .select2-selection--single {
            height: 44px;
        }
        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 43px;
        }
        .select2-container--default .select2-selection--single .select2-selection__arrow {
            height: 43px;
        }
    </style>
@endpush

@push('script')
    <script>
        (function ($) {
            "use strict";
            $('.colorPicker').spectrum({
                color: $(this).data('color'),
                change: function (color) {
                    $(this).parent().siblings('.colorCode').val(color.toHexString().replace(/^#?/, ''));
                }
            });

            $('.colorCode').on('input', function () {
                var clr = $(this).val();
                $(this).parents('.input-group').find('.colorPicker').spectrum({
                    color: clr,
                });
            });

            $('.select2-basic').select2({
                dropdownParent: $('.card-body')
            });

            $('select[name=timezone]').val();
        })(jQuery);

    </script>
@endpush

