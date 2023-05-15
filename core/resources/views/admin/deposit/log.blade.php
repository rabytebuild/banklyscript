@extends('admin.layouts.app')

@section('panel')
<div class="row justify-content-center">
    @if(request()->routeIs('admin.deposit.list') || request()->routeIs('admin.deposit.method') || request()->routeIs('admin.users.deposits') || request()->routeIs('admin.users.deposits.method'))

          <!-- Stats Horizontal Card -->
  <div class="row">
    <div class="col-lg-4 col-sm-6 col-12">
      <div class="card">
        <div class="card-header">
          <div>
            <h2 class="fw-bolder mb-0"> {{ __($general->cur_sym) }}{{ showAmount($successful) }}</h2>
            <p class="card-text">@lang('Successful Deposit')</p>
          </div>
          <div class="avatar bg-light-primary p-50 m-0">
            <div class="avatar-content">
              <i data-feather="dollar-sign" class="font-medium-5"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 col-12">
      <div class="card">
        <div class="card-header">
          <div>
            <h2 class="fw-bolder mb-0">{{ __($general->cur_sym) }}{{ showAmount($pending) }}</h2>
            <p class="card-text">@lang('Pending Deposit')</p>
          </div>
          <div class="avatar bg-light-warning p-50 m-0">
            <div class="avatar-content">
              <i data-feather="clock" class="font-medium-5"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-sm-6 col-12">
      <div class="card">
        <div class="card-header">
          <div>
            <h2 class="fw-bolder mb-0">{{ __($general->cur_sym) }}{{ showAmount($rejected) }}</h2>
            <p class="card-text">@lang('Rejected Deposit')</p>
          </div>
          <div class="avatar bg-light-danger p-50 m-0">
            <div class="avatar-content">
              <i data-feather="alert-octagon" class="font-medium-5"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
  <!--/ Stats Horizontal Card -->
    @endif

    <div class="col-md-12">
        <div class="card b-radius--10">
            <div class="card-body p-0">
                <div class="table-responsive--sm table-responsive">
                    <table class="table table--light style--two">
                        <thead>
                        <tr>
                            <th>@lang('Gateway | Trx')</th>
                            <th>@lang('Initiated')</th>
                            <th>@lang('User')</th>
                            <th>@lang('Amount')</th>
                            <th>@lang('Conversion')</th>
                            <th>@lang('Status')</th>
                            <th>@lang('Action')</th>
                        </tr>
                        </thead>
                        <tbody>
                        @forelse($deposits as $deposit)
                            @php
                                $details = $deposit->detail ? json_encode($deposit->detail) : null;
                            @endphp
                            <tr>
                                <td data-label="@lang('Gateway | Trx')">
                                     <span class="font-weight-bold"> <a href="{{ route('admin.deposit.method',[$deposit->gateway->alias,'all']) }}">{{ __($deposit->gateway->name) }}</a> </span>
                                     <br>
                                     <small> {{ $deposit->trx }} </small>
                                </td>

                                <td data-label="@lang('Date')">
                                    {{ showDateTime($deposit->created_at) }}<br>{{ diffForHumans($deposit->created_at) }}
                                </td>
                                <td data-label="@lang('User')">
                                    <span class="font-weight-bold">{{ $deposit->user->fullname }}</span>
                                    <br>
                                    <span class="small">
                                    <a href="{{ route('admin.users.detail', $deposit->user_id) }}"><span>@</span>{{ $deposit->user->username }}</a>
                                    </span>
                                </td>
                                <td data-label="@lang('Amount')">
                                   {{ __($general->cur_sym) }}{{ showAmount($deposit->amount ) }} + <span class="text-danger" data-toggle="tooltip" data-original-title="@lang('charge')">{{ showAmount($deposit->charge)}} </span>
                                    <br>
                                    <strong data-toggle="tooltip" data-original-title="@lang('Amount with charge')">
                                    {{ showAmount($deposit->amount+$deposit->charge) }} {{ __($general->cur_text) }}
                                    </strong>
                                </td>
                                <td data-label="@lang('Conversion')">
                                   1 {{ __($general->cur_text) }} =  {{ showAmount($deposit->rate) }} {{__($deposit->method_currency)}}
                                    <br>
                                    <strong>{{ showAmount($deposit->final_amo) }} {{__($deposit->method_currency)}}</strong>
                                </td>
                                <td data-label="@lang('Status')">
                                    @if($deposit->status == 2)
                                        <span class="badge bg-warning">@lang('Pending')</span>
                                    @elseif($deposit->status == 1)
                                        <span class="badge bg-success">@lang('Approved')</span>
                                         <br>{{ diffForHumans($deposit->updated_at) }}
                                    @elseif($deposit->status == 3)
                                        <span class="badge bg-danger">@lang('Rejected')</span>
                                        <br>{{ diffForHumans($deposit->updated_at) }}
                                    @endif
                                </td>
                                <td data-label="@lang('Action')">
                                    <a href="{{ route('admin.deposit.details', $deposit->id) }}"
                                       class="btn btn-primary btn-sm" data-toggle="tooltip" title="" data-original-title="@lang('Detail')">
                                        View
                                    </a>
                                </td>
                            </tr>
                        @empty
                            <tr>
                                <td class="text-muted text-center" colspan="100%">{{ __($emptyMessage) }}</td>
                            </tr>
                        @endforelse
                        </tbody>
                    </table><!-- table end -->
                </div>
            </div>
            <div class="card-footer py-4">
                {{ paginateLinks($deposits) }}
            </div>
        </div><!-- card end -->
    </div>
</div>


@endsection


@push('breadcrumb-plugins')
    @if(!request()->routeIs('admin.users.deposits') && !request()->routeIs('admin.users.deposits.method'))
        <form action="{{route('admin.deposit.search', $scope ?? str_replace('admin.deposit.', '', request()->route()->getName()))}}" method="GET" class="form-inline float-sm-right bg--white mb-2 ml-0 ml-xl-2 ml-lg-0">
            <div class="input-group has_append  ">
                <input type="text" name="search" class="form-control" placeholder="@lang('Trx number/Username')" value="{{ $search ?? '' }}">
                <div class="input-group-append">
                    <button class="btn btn--primary" type="submit"><i class="fa fa-search"></i></button>
                </div>
            </div>
        </form>

        <form action="{{route('admin.deposit.dateSearch',$scope ?? str_replace('admin.deposit.', '', request()->route()->getName()))}}" method="GET" class="form-inline float-sm-right bg--white">
            <div class="input-group has_append ">
                <input name="date" type="text" data-range="true" data-multiple-dates-separator=" - " data-language="en" class="datepicker-here form-control" data-position='bottom right' placeholder="@lang('Min date - Max date')" autocomplete="off" value="{{ @$dateSearch }}">
                <input type="hidden" name="method" value="{{ @$methodAlias }}">
                <div class="input-group-append">
                    <button class="btn btn--primary" type="submit"><i class="fa fa-search"></i></button>
                </div>
            </div>
        </form>

    @endif
@endpush


@push('script-lib')
  <script src="{{ asset('assets/admin/js/vendor/datepicker.min.js') }}"></script>
  <script src="{{ asset('assets/admin/js/vendor/datepicker.en.js') }}"></script>
@endpush
@push('script')
  <script>
    (function($){
        "use strict";
        if(!$('.datepicker-here').val()){
            $('.datepicker-here').datepicker();
        }
    })(jQuery)
  </script>
@endpush
