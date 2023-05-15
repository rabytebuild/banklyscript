@extends($activeTemplate.'layouts.dashboard')

@section('content')

@push('style')

@endpush

        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="row layout-top-spacing">

                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="statbox widget box box-shadow">
                                <div class="widget-header">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                        <div class="content-header">
          <h5 class="mb-0">Payment Gateway</h5>
          <small class="text-muted">Please Select A Payment Gateway</small>
        </div>
                                        </div>                      
                                    </div>
                                </div>
                                <div class="widget-content widget-content-area">

                                <form action="{{route('user.deposit.insert')}}" method="post">
@csrf
<section class="horizontal-wizard">
  <div class="bs-stepper horizontal-wizard-example">
    <div class="bs-stepper-header" role="tablist">
       


    </div>
    <div class="bs-stepper-content">
      <div id="account-details" class="content" role="tabpanel" aria-labelledby="account-details-trigger">
        
          <div class="row">
            <div class="mb-1 col-md-6">
              <label class="form-label" for="username">Method</label>
              <select id="gateway" onchange="myFunction()" name="" class="form-control">
              <option selected disabled>Select An Option</option>
              @foreach($gatewayCurrency as $data)
              <option
                               data-id="{{$data->id}}"
                               data-name="{{$data->name}}"
                               data-currency="{{$data->currency}}"
                               data-method_code="{{$data->method_code}}"
                               data-min_amount="{{showAmount($data->min_amount)}}"
                               data-max_amount="{{showAmount($data->max_amount)}}"
                               data-base_symbol="{{$data->baseSymbol()}}"
                               data-fix_charge="{{showAmount($data->fixed_charge)}}"
                               data-percent_charge="{{showAmount($data->percent_charge)}}"
              > {{__($data->name)}}</option>
              @endforeach
              </select>
              @push('script')
<script>
function myFunction() {
var name = $("#gateway option:selected").attr('data-name');
var currency = $("#gateway option:selected").attr('data-currency');
var method_code = $("#gateway option:selected").attr('data-method_code');
var min_amount = $("#gateway option:selected").attr('data-min_amount');
var max_amount = $("#gateway option:selected").attr('data-max_amount');
document.getElementById("currency").value = currency;
document.getElementById("min").innerHTML = "{{$general->cur_sym}}"+min_amount+" to ";
document.getElementById("max").innerHTML = "{{$general->cur_sym}}"+max_amount;
document.getElementById("method_code").value = method_code;
document.getElementById("name").value = name;

 };
</script>
@endpush
            </div>
            <div class="mb-1 col-md-6">
              <label class="form-label" for="email">Currency</label>
              <input
                type="text"
                name="currency"
                id="currency" readonly
                class="form-control"
                placeholder="{{$general->cur_text}}"
                aria-label="{{$general->cur_text}}"
              />
            </div>

                <input type="hidden" id="method_code" name="method_code">
          </div>
          <br><br>
         
           <div class="row">
            <div class="mb-1 col-md-12">
              <label class="form-label" for="first-name">Amount</label><br>
              <b><a id="min"></a> <a id="max"></a></B>
              <div class="input-group mb-4">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon3"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-loader spin"><line x1="12" y1="2" x2="12" y2="6"></line><line x1="12" y1="18" x2="12" y2="22"></line><line x1="4.93" y1="4.93" x2="7.76" y2="7.76"></line><line x1="16.24" y1="16.24" x2="19.07" y2="19.07"></line><line x1="2" y1="12" x2="6" y2="12"></line><line x1="18" y1="12" x2="22" y2="12"></line><line x1="4.93" y1="19.07" x2="7.76" y2="16.24"></line><line x1="16.24" y1="7.76" x2="19.07" y2="4.93"></line></svg></span>
                                        </div>
                                        <input type="number" name="amount" id="amount" class="form-control" placeholder="0.00" />
                                    </div>

              
            </div>
          </div>
          <hr>
        <div class="d-flex justify-content-between">

          <button class="btn btn--primary text-white btn-next">
            <span class="align-middle d-sm-inline-block">Proceed</span>
            
          </button>
        </div>
      </div>
    </div>
  </div>
</section>
</form>
                               
                                </div>
                            </div>



                           
                            </div>

                           
</div>

                        <div class="table-responsive">
                          <b> Deposit History</b><br>
        <table class="table">
          <thead>
           <tr>
                <th>@lang('Trx')</th>
                <th>@lang('Gateway')</th>
                <th>@lang('Amount')</th>
                <th>@lang('Status')</th>
                <th>@lang('Time')</th>
                <th>@lang('Details')</th>
            </tr>
          </thead>
          <tbody>
           @forelse($logs as $k=>$data)
            <tr>
                <td data-label="@lang('Trx')">{{$data->trx}}</td>
                <td data-label="@lang('Gateway')">{{ __(@$data->gateway->name)  }}</td>
                <td data-label="@lang('Amount')">
                    <strong>{{showAmount($data->amount)}} {{__($general->cur_text)}}</strong>
                </td>
                <td data-label="@lang('Status')">
                    @if($data->status == 1)
                    <span class="badge rounded-pill badge-light-primary me-1">@lang('Complete')</span>
                    @elseif($data->status == 2)
                        <span class="badge rounded-pill badge-light-warning me-1">@lang('Pending')</span>
                    @elseif($data->status == 3)
                        <span class="badge rounded-pill badge-light-danger me-1">@lang('Cancel')</span>
                    @endif

                    @if($data->admin_feedback != null)
                        <button class="btn-info btn-rounded  badge detailBtn" data-admin_feedback="{{$data->admin_feedback}}"><i class="fa fa-info"></i></button>
                    @endif

                </td>
                <td data-label="@lang('Time')">
                   {{showDateTime($data->created_at)}}
                </td>

                @php
                    $details = ($data->detail != null) ? json_encode($data->detail) : null;
                @endphp
                    <td data-label="@lang('Details')">
                        <a href="javascript:void(0)" class="text--base approveBtn"
                            data-info="{{ $details }}"
                            data-id="{{ $data->id }}"
                            data-amount="{{ showAmount($data->amount)}} {{ __($general->cur_text) }}"
                            data-charge="{{ showAmount($data->charge)}} {{ __($general->cur_text) }}"
                            data-after_charge="{{ showAmount($data->amount + $data->charge)}} {{ __($general->cur_text) }}"
                            data-rate="{{ showAmount($data->rate)}} {{ __($data->method_currency) }}"
                            data-payable="{{ showAmount($data->final_amo)}} {{ __($data->method_currency) }}">
                            View
                        </a>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="100%">{{ __($emptyMessage) }}</td>
                </tr>
            @endforelse

          </tbody>
        </table>
      </div>
       {{$logs->links()}}
       
 

<!-- /Deposit Wizard -->
</div>



{{-- APPROVE MODAL --}}
      <div id="approveModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Details')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <ul class="list-group">
                        <li class="list-group-item dark-bg">@lang('Amount') : <span class="withdraw-amount fw-bold"></span></li>
                        <li class="list-group-item dark-bg">@lang('Charge') : <span class="withdraw-charge fw-bold"></span></li>
                        <li class="list-group-item dark-bg">@lang('After Charge') : <span class="withdraw-after_charge fw-bold"></span></li>
                        <li class="list-group-item dark-bg">@lang('Conversion Rate') : <span class="withdraw-rate fw-bold"></span></li>
                        <li class="list-group-item dark-bg">@lang('Payable Amount') : <span class="withdraw-payable fw-bold"></span></li>
                    </ul>
                    <ul class="list-group withdraw-detail mt-1">
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">@lang('Close')</button>
                </div>
            </div>
        </div>
    </div>

    {{-- Detail MODAL --}}
    <div id="detailModal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">@lang('Details')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="withdraw-detail"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">@lang('Close')</button>
                </div>
            </div>
        </div>
    </div>


@endsection



@push('script')
    <script>
        (function ($) {
            "use strict";
            $('.approveBtn').on('click', function() {
                var modal = $('#approveModal');
                modal.find('.withdraw-amount').text($(this).data('amount'));
                modal.find('.withdraw-charge').text($(this).data('charge'));
                modal.find('.withdraw-after_charge').text($(this).data('after_charge'));
                modal.find('.withdraw-rate').text($(this).data('rate'));
                modal.find('.withdraw-payable').text($(this).data('payable'));
                var list = [];
                var details =  Object.entries($(this).data('info'));

                var ImgPath = "{{asset(imagePath()['verify']['deposit']['path'])}}/";
                var singleInfo = '';
                for (var i = 0; i < details.length; i++) {
                    if (details[i][1].type == 'file') {
                        singleInfo += `<li class="list-group-item">
                                            <span class="font-weight-bold "> ${details[i][0].replaceAll('_', " ")} </span> : <img src="${ImgPath}/${details[i][1].field_name}" alt="@lang('Image')" class="w-100">
                                        </li>`;
                    }else{
                        singleInfo += `<li class="list-group-item">
                                            <span class="font-weight-bold "> ${details[i][0].replaceAll('_', " ")} </span> : <span class="font-weight-bold ml-3">${details[i][1].field_name}</span>
                                        </li>`;
                    }
                }

                if (singleInfo)
                {
                    modal.find('.withdraw-detail').html(`<br><strong class="my-3">@lang('Payment Information')</strong>  ${singleInfo}`);
                }else{
                    modal.find('.withdraw-detail').html(`${singleInfo}`);
                }
                modal.modal('show');
            });

            $('.detailBtn').on('click', function() {
                var modal = $('#detailModal');
                var feedback = $(this).data('admin_feedback');
                modal.find('.withdraw-detail').html(`<p> ${feedback} </p>`);
                modal.modal('show');
            });
        })(jQuery);
    </script>
@endpush

@push('style')
<style>
    .list-group-item{
        background: transparent;
    }
</style>
@endpush


