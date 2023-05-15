@extends($activeTemplate.'layouts.dashboard')
@section('content')
 <!-- change password -->
 <div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="row layout-top-spacing">

                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="statbox widget box box-shadow">
                                  
									<div class="card">

                <div class="card-body">
               <div
              class=""
              id="account-vertical-password"
              role="tabpanel"
              aria-labelledby="account-pill-password"
              aria-expanded="false"
            >
              <!-- form -->
              <form action="" method="post" class="register">
                @csrf
                <div class="row">
                  <div class="col-12 col-sm-12">
                    <div class="mb-1">
                      <label class="form-label" for="account-old-password">Old Password</label>
                      <div class="input-group form-password-toggle input-group-merge">
                        <input id="password" type="password" placeholder="Old Password" class="form-control" name="current_password" required autocomplete="current-password">
                        <div class="input-group-text cursor-pointer bg-info">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                                    
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <br>
                <div class="row">
                  <div class="col-12 col-sm-12">
                    <div class="mb-1">
                      <label class="form-label" for="account-new-password">New Password</label>
                      <div class="input-group form-password-toggle input-group-merge">
                        <input id="new_password" type="password" placeholder="New Password" class="form-control" name="password" required autocomplete="current-password">
                        <div class="input-group-text cursor-pointer bg-info">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                                    
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="col-12 col-sm-12">
                    <div class="mb-1">
                      <label class="form-label" for="account-retype-new-password"><br>Retype New Password</label>
                      <div class="input-group form-password-toggle input-group-merge">
                         <input id="password_confirmation" type="password" placeholder="Confirm Password" class="form-control" name="password_confirmation" required autocomplete="current-password">

                        <div class="input-group-text cursor-pointer bg-info">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
                                    
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <br>
                    <button type="submit" class="btn text-white btn--primary me-1 mt-1">Save changes</button>
                  </div>
                </div>
              </form>
              <!--/ form -->
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
            </div>
            <!--/ change password -->
@endsection


