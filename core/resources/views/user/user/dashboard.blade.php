@extends($activeTemplate.'layouts.dashboard')
@section('content')

<!--  BEGIN CONTENT PART  -->
<div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="row layout-top-spacing">

                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                        <div class="widget widget-chart-three">
                            <div class="widget-heading">
                                <div class="">
                                    <h5 class="">Deposit & Withdrawal</h5>
                                </div>

                                <div class="dropdown ">
                                    <a class="dropdown-toggle" href="index2.html#" role="button" id="uniqueVisitors" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>
                                    </a>

                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="uniqueVisitors">
                                        <a class="dropdown-item" href="javascript:void(0);">View</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Update</a>
                                        <a class="dropdown-item" href="javascript:void(0);">Download</a>
                                    </div>
                                </div>
                            </div>

                            <div class="widget-content">
                                <div id="uniqueVisits"></div>
                                <!--<div id="revenue-report-chart"></div>-->
                            </div>
                        </div>
                    </div>

                      

                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12 layout-spacing">

<div class="widget widget-account-invoice-three">

    <div class="widget-heading">
        <div class="wallet-usr-info">
            <div class="usr-name">
                <span><img src="{{ @getImage(imagePath()['profile']['user']['path'].'/'. $user->image,imagePath()['profile']['user']['size']) }}" alt="admin-profile" class="img-fluid"> {{$user->username}}</span>
            </div>
            <div class="add">
                <span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg></span>
            </div>
        </div>
        <div class="wallet-balance">
            <p>Balance</p>
            <h5 class=""><span class="w-currency">{{ $general->cur_sym }}</span>{{ showAmount($user->balance) }}</h5>
        </div>
    </div>

    <div class="widget-amount">

        <div class="w-a-info funds-received">
            <span>Received <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-up"><polyline points="18 15 12 9 6 15"></polyline></svg></span>
            <p>{{ $general->cur_sym }}{{number_format($totalDeposit)}}</p>
        </div>

        <div class="w-a-info funds-spent">
            <span>Spent <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg></span>
            <p>{{ $general->cur_sym }}{{number_format($totalWithdraw)}}</p>
        </div>
    </div>

    <div class="widget-content">

        <div class="bills-stats">
            <span>Pending</span>
        </div>

        <div class="invoice-list">

            <div class="inv-detail">
                <div class="info-detail-1">
                    <p>Deposit</p>
                    <p><span class="w-currency">{{ $general->cur_sym }}</span> <span class="bill-amount">{{number_format($PDeposit)}}</span></p>
                </div>
                <div class="info-detail-2">
                    <p>Withdrawal</p>
                    <p><span class="w-currency">{{ $general->cur_sym }}</span> <span class="bill-amount">{{number_format($PWithdraw)}}</span></p>
                </div>
            </div>

            <div class="inv-action">
                <a href="{{ route('user.deposit') }}" class="btn btn-outline-primary view-details">Deposit Now</a>
                <a href="{{ route('user.withdraw') }}" class="btn btn-outline-primary pay-now">Withdraw Now</a>
            </div>
        </div>
    </div>

</div>
</div>

                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12 layout-spacing">

                    <div class="widget widget-activity-four">

                        <div class="widget-heading">
                            <h5 class="">Recent Login</h5>
                        </div>

                        <div class="widget-content">

                            <div class="mt-container mx-auto">
                                <div class="timeline-line">
                                  @foreach($logins as $data)
                                    <div class="item-timeline timeline-primary">
                                        <div class="t-dot" data-original-title="" title="">
                                        </div>
                                        <div class="t-text">
                                            <p><span>{{$data->browser}}</span> {{$data->os}}</p>
                                            <span class="badge">{{$data->country}}</span>
                                            <p class="t-time"> {{showDateTime($data->created_at)}}</p>
                                        </div>
                                    </div>
                                  @endforeach

                                   

                                </div>
                            </div>

                            <div class="tm-action-btn">
                                <button class="btn"><span>View All</span> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg></button>
                            </div>
                        </div>
                    </div>
                    </div>


                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12 layout-spacing">
                    <div class="widget widget-table-one">
                        <div class="widget-heading">
                            <h5 class="">Bills Payments</h5>
                            
                        </div>

                        <div class="widget-content">
                        @foreach($bills as $data)
                            <div class="transactions-list">
                                <div class="t-item">
                                    <div class="t-company-name">
                                        <div class="t-icon">
                                            <div class="icon">
                                            @if($data->type == 1)
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-phone-call"><path d="M15.05 5A5 5 0 0 1 19 8.95M15.05 1A9 9 0 0 1 23 8.94m-1 7.98v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
                                            @elseif($data->type == 2)
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-wifi"><path d="M5 12.55a11 11 0 0 1 14.08 0"></path><path d="M1.42 9a16 16 0 0 1 21.16 0"></path><path d="M8.53 16.11a6 6 0 0 1 6.95 0"></path><line x1="12" y1="20" x2="12.01" y2="20"></line></svg>
                                            @elseif($data->type == 3)
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-tv"><rect x="2" y="7" width="20" height="15" rx="2" ry="2"></rect><polyline points="17 2 12 7 7 2"></polyline></svg>
                                            @elseif($data->type == 4)
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-zap"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>
                                            @elseif($data->type == 5)
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>                                 
                                            @elseif($data->type == 6)
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-credit-card"><rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect><line x1="1" y1="10" x2="23" y2="10"></line></svg>                                 
                                            @endif
                                            </div>
                                        </div>
                                        <div class="t-name">
                                            <h4>
                                            @if($data->type == 1)
                                            Airtime
                                            @elseif($data->type == 2)
                                            Internet
                                            @elseif($data->type == 3)
                                            Cable TV
                                            @elseif($data->type == 4)
                                            Electricity bill
                                            @elseif($data->type == 5)
                                            WAEC REG.
                                            @elseif($data->type == 6)
                                            WAEC Result
                                            @endif
                                            </h4>
                                            <p class="meta-date">{{showDateTime($data->created_at)}}</p>
                                        </div>

                                    </div>
                                    <div class="t-rate rate-dec">
                                        <p><span>-{{ $general->cur_sym }}</span>{{ showAmount($data->amount) }}</span></p>
                                    </div>
                                </div>
                            </div>
                          @endforeach
                            
                            
                            
                        </div>
</div>
</div>



</div>
</div>

 @endsection


@push('script')
 @include('partials.chart')

 <script src="{{ asset($activeTemplateTrue. 'user-assets/plugins/apex/apexcharts.min.js')}}"></script>
 
@endpush
