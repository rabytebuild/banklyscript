@extends($activeTemplate.'layouts.dashboard')

@section('content')


<div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="row layout-top-spacing">

                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                    <div class="card">
            <div class="card-body">
 
   
                                <div class="buy-sell-widget">
                                     
                                    <div class="tab-content tab-content-default">
                                        <div class="tab-pane fade show active" id="buy" role="tabpanel">

                                            <form class="contact-form" class="currency_validate" action="" method="post" enctype="multipart/form-data">
                                        @csrf

                                                <div class="row">
                                                <div class="form-group col-12" >
                                                    <label class="@if(Auth::user()->darkmode != 0) text-white @endif">Select Preferred Network</label>
                                                    <div class="input-group mb-3">

                                                       <select id="s1" onChange="populate()" name="decoder" class="form-control form-control-solid ">
<option selected  disabled>Select A Decoder</option>
@foreach($network as $data)
<option value="{{$data->code}}">{{$data->name}}</option>
@endforeach
</select>
                                                    </div>
                                                </div>



                                                <div class="form-group col-12">
                                                    <label class="@if(Auth::user()->darkmode != 0) text-white @endif">Select Bundle</label>
                                                    <div class="input-group mb-3">
                                                       <select id="s2" name="plan" class="form-control form-control-solid ">
<option selected disabled>Select Subscription Plan</option>

<option value=""></option>

</select>
                                                    </div>

                                                </div>

                                                <div class="form-group col-12">
                                                    <label class="@if(Auth::user()->darkmode != 0) text-white @endif">Enter Decoder Number</label>
                                                    <div class="input-group mb-3">
                                                        <input class="form-control" name="number"  id="number" type="number" placeholder="123456789">

                                                    </div>

                                                    <button type="submit" class="btn btn-porimary text-white">Proceed</button>


                                                </div>


                                        </div>
                                        </form>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>

                </div>
 

                <!-- row opened -->
							<div class="col-xl-12">
								<div class="card">
									<div class="card-header">
										<div class="card-title">Recent Cable TV Subscription Log </div>
										<div class="card-options">
											<a href="#" class="card-options-collapse" data-toggle="card-collapse"><i class="fe fe-chevron-up"></i></a>
											<a href="#" class="card-options-fullscreen" data-toggle="card-fullscreen"><i class="fe fe-maximize"></i></a>
											<a href="#" class="card-options-remove" data-toggle="card-remove"><i class="fe fe-x"></i></a>
										</div>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table card-table table-striped text-nowrap table-bordered border-top">
												<thead>
													<tr>
														<th>ID</th>
														<th>Decoder Number</th>
														<th>Network</th>
														<th>Amount</th>
														<th>Bundle</th>
														<th>Status</th>
														<th>Date</th>
													</tr>
												</thead>
												<tbody>
												@foreach($bills as $data)
													<tr>
														<td>#{{$data->trx}}</td>
														<td class="text-success">{{$data->phone}}<br>
														{{strtoupper($data->accountname)}}
														</td>
														<td>{{strtoupper($data->network)}}<br>
														</td>

														<td>{{$general->cur_sym}}{{number_format($data->amount,2)}}</td>
														<td>{{strtoupper($data->plan)}}<br>
														</td>


                                                       @if($data->status == 0)
														<td><span class="badge bg-warning badge-pill">Pending</span></td>
														@elseif($data->status == 1)
														<td><span class="badge bg-success badge-pill">Completed</span></td>
														@else
														<td><span class="badge bg-danger badge-pill">Declined</span></td>
														@endif
														<td>{{date(' d M, Y ', strtotime($data->created_at))}} {{date('h:i A', strtotime($data->created_at))}}</td>
													</tr>
											  @endforeach


												</tbody>
											</table>
											 @if(count($bills) < 1)
											 <div class="alert alert-danger alert-dismissible fade show mb-0" role="alert">
			<span class="alert-inner--icon"><i class="fe fe-slash"></i></span>
			<span class="alert-inner--text"><strong>Hey Boss!</strong>   You dont have any transaction log at the moment</span>

		</div>

											  @endif
										</div>
									</div>
								</div>
							</div>



                </div>
            </div>
        
@push('script')
<script>
function populate(){
console.log('start populate')
var s1 = document.getElementById('s1');
var s2 = document.getElementById('s2');
s2.innerHTML = "";
console.log('start deciding');
if (s1.value == "dstv"){
  var optionArray = ["|Select",@foreach($bill as $data)@if($data['networkcode'] == "dstv" )"{{$data['plan']}}| {{$data['name']}} ",@endif @endforeach];             }
else if (s1.value == "gotv"){
var optionArray = ["|Select",@foreach($bill as $data)@if($data['networkcode'] == "gotv" )"{{$data['plan']}}| {{$data['name']}}",@endif @endforeach]; }
else if (s1.value == "startimes"){
  var optionArray = ["|select",@foreach($bill as $data)@if($data['networkcode'] == "startimes" )"{{$data['plan']}}| {{$data['name']}} ",@endif @endforeach];  }
console.log('i want to split');
      for (var option in optionArray){
        var pair = optionArray[option].split("|");
        var newOption = document.createElement("option");
        newOption.value = pair[0];
        newOption.innerHTML = pair[1];
        s2.options.add(newOption);
      }
  }
</script>
@endpush

@endsection
