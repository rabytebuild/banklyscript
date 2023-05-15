@extends($activeTemplate.'layouts.dashboard')

@section('content')


<div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="row layout-top-spacing">

                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                    <div class="card">
            <div class="card-body">
 
   
                                <div class="buy-sell-widget">
													<div class="col-md-10">
														<div class="d-flex justify-content-between pb-10 pb-md-20 flex-column flex-md-row">
															<h1 class="display-4 font-weight-boldest mb-10">{{$meter}}</h1>

														</div>
														<div class="border-bottom w-100"></div>
														<div class="d-flex justify-content-between pt-6">
															<div class="d-flex flex-column flex-root">
																<span class="font-weight-bolder mb-2">Meter Type</span>
																<span class="opacity-70">{{$type}}</span>
															</div>
															<div class="d-flex flex-column flex-root">
																<span class="font-weight-bolder mb-2">Meter NO.</span>
																<span class="opacity-70">{{$number}}</span>
															</div>
															<div class="d-flex flex-column flex-root">
																<span class="font-weight-bolder mb-2">Customer.</span>
																<span class="opacity-70">{{$customer}}<br>
																{{$address}}
																</span>
															</div>
														</div>
													</div>
												</div>
												<!-- end: Invoice header-->
												<hr>


												<div class="table-responsive">
															<table class="table">
																<thead>
																	<tr>
																		<th class="font-weight-bold text-muted text-uppercase">Amount</th>
																		<th class="font-weight-bold text-muted text-uppercase">Charge</th>
																		<th class="font-weight-bold text-muted text-uppercase text-right">TOTAL PAID</th>
																	</tr>
																</thead>
																<tbody>
																	<tr class="font-weight-bolder">
																		<td>{{$general->cur_sym}}{{$cost}}</td>
																		<td>{{$general->cur_sym}}{{env('POWERCHARGE')}}</td>
																		<td class="text-primary font-size-h3 font-weight-boldest text-right">{{$general->cur_sym}}{{number_format(env('POWERCHARGE') +$cost,)}}</td>
																	</tr>
																</tbody>
															</table>
														</div>
														 <form class="form" id="kt_form"  method="post" enctype="multipart/form-data">
                                                                 @csrf
                                                            <input name="customer" hidden value="{{$customer}}">
                                                            <input name="number" hidden value="{{$number}}">
                                                            <input name="plan" hidden value="{{$plancode}}">
                                                            <input name="type" hidden value="{{$type}}">
                                                            <input name="amount" hidden value="{{$cost}}">
															<button type="submit" class="btn btn--primary font-weight-bold">Make Payment</button>
															</form>

            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Product Details ends -->


@endsection


