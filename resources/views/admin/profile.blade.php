@extends('layouts.admin')

@section('title')
    Profile Details
@endsection

@section('content')
    <style>
        .address{
            overflow-wrap: anywhere;
        }
        .password-icon{
            float: right;
            margin-top: 6px;
            margin-left:10px;
        }
    </style>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Profile Details</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Profile Details</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="{{$customer->photo}}"
                       alt="User profile picture">
                </div>
                <h3 class="profile-username text-center">{{$customer->name}}</h3>

                <p class="text-muted text-center">{{$customer->role}}</p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Email</b> 
                    <a class="float-right address">{{$customer->email}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Phone</b> <a class="float-right">{{$customer->phone}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Gender</b> <a class="float-right">{{$customer->gender}}</a>
                  </li>
                  
                  <!--<li class="list-group-item">-->
                  <!--  <b>Security Amount</b> <a class="float-right">{{$customer->security_paid == 1 ? 'Paid' : 'Pending'}}</a>-->
                  <!--</li>-->

                  <li class="list-group-item">
                    <b>Address</b> <a class="float-right address">{{$customer->address}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Status</b> <a class="float-right">{{$customer->status}}</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col -->
          <div class="col-md-9">
            @if(session()->has('error'))
                <div class="alert alert-danger">
                    {{ session()->get('error') }}
                </div>
            @endif
            @if(session()->has('success'))
                <div class="alert alert-success">
                    {{ session()->get('success') }}
                </div>
            @endif
            <div class="card">
                <div class="card-header">Basic info</div>
                <div class="card-body">
                    <form class="form-horizontal" action="{{url('update-profile')}}" method="post" enctype="multipart/form-data">
                        @csrf
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">Name</label>
                        <div class="col-sm-5">
                          <input type="text" class="form-control" name="first_name" value="{{$customer->first_name}}" minlength="4" maxlength="20"
                          onkeypress="return event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32" required>
                        </div>
                        <div class="col-sm-5">
                          <input type="text" class="form-control" name="last_name" value="{{$customer->last_name}}" minlength="4" maxlength="20"
                          onkeypress="return event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" name="email" value="{{$customer->email}}" maxlength="50" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" value="{{$customer->phone}}" minlength="10" maxlength="10"  
                                      onkeypress="return event.charCode >= 48 && event.charCode <= 57" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputExperience" class="col-sm-2 col-form-label">Gender</label>
                        <div class="col-sm-10">
                          <select name="gender" class="form-control">
                              <option value="Male" {{$customer->gender == 'Male' ? 'selected' : ''}}>Male</option>
                              <option value="Female" {{$customer->gender == 'Female' ? 'selected' : ''}}>Female</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">Address</label>
                        <div class="col-sm-10">
                          <textarea name="address" class="form-control" maxlength=100"" required>{{$customer->address}}</textarea>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-2 col-form-label">Profile Image
                            <img src="{{$customer->photo}}" style="width:40px">
                        </label>
                        <div class="col-sm-10">
                          <input type="file" class="form-control" name="photo" accept="image/*" placeholder="Profile Picture">
                        </div>
                      </div>
                      <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">
                          <button type="submit" class="btn btn-sm btn-primary">Update Profile</button>
                        </div>
                      </div>
                    </form>
                </div>
            </div>
            
            <div class="card">
                <div class="card-header">Change Password</div>
                <div class="card-body">
                    <form action="{{url('change-password')}}" method="post">
                            @csrf
                            <div class="form-group">
                                <label>Current Password</label>
                                <div class="input-group">
                                    <input type="password" name="current_password" class="form-control current-password" minlength="8" maxlength="14" id="re_pass" style="width:95%;" placeholder="Current password"/ required>
                                    <a href="javascript:void(0)" class="current-show-password password-icon"><i class="fa fa-eye-slash"></i></a>
                                    <a href="javascript:void(0)" class="current-hide-password password-icon" style="display:none;"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                </div>
                                @if($errors->has('current_password'))
                                    <p style="color:red">{{ $errors->first('current_password') }}</p>
                                @endif
                            </div>
                            <div class="form-group">
                                <label>New Password</label>
                                <div class="input-group">
                                    <input type="password" name="password" class="form-control new-password" minlength="8" maxlength="14" id="re_pass" style="width:95%;" 
                                    placeholder="New Password"/ required>
                                    <a href="javascript:void(0)" class="new-show-password password-icon"><i class="fa fa-eye-slash"></i></a>
                                    <a href="javascript:void(0)" class="new-hide-password password-icon" style="display:none;"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                </div>
                                <p style="color:grey">Enter a combination of at least eight numbers, letters and punctuation marks (such as ! and &)</p>
                                @if($errors->has('password'))
                                    <p style="color:red">{{ $errors->first('password') }}</p>
                                @endif
                            </div>
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <div class="input-group">
                                    <input type="password" name="password_confirmation" class="form-control confirm-password" minlength="8" maxlength="14" id="re_pass" style="width:95%;" 
                                    placeholder="Confirm password"/ required>
                                    <a href="javascript:void(0)" class="confirm-show-password password-icon"><i class="fa fa-eye-slash"></i></a>
                                    <a href="javascript:void(0)" class="confirm-hide-password password-icon" style="display:none;"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                </div>
                                @if($errors->has('password_confirmation'))
                                    <p style="color:red">{{ $errors->first('password_confirmation') }}</p>
                                @endif
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-sm btn-primary" value="Change Password">
                            </div>
                        </form>
                </div>
            </div>
            
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

@section('script')
    <script>
        $(document).ready(function(){
            $('.hide-password').hide();
            
            $(document).on('click','.current-show-password',function(){
                $('.current-password').attr('type','text');
                $(this).hide();
                $('.current-hide-password').show();
            });
            $(document).on('click','.current-hide-password',function(){
                $('.current-password').attr('type','password');
                $(this).hide();
                $('.current-show-password').show();
            });
            
            $(document).on('click','.new-show-password',function(){
                $('.new-password').attr('type','text');
                $(this).hide();
                $('.new-hide-password').show();
            });
            $(document).on('click','.new-hide-password',function(){
                $('.new-password').attr('type','password');
                $(this).hide();
                $('.new-show-password').show();
            });
            
            $(document).on('click','.confirm-show-password',function(){
                $('.confirm-password').attr('type','text');
                $(this).hide();
                $('.confirm-hide-password').show();
            });
            $(document).on('click','.confirm-hide-password',function(){
                $('.confirm-password').attr('type','password');
                $(this).hide();
                $('.confirm-show-password').show();
            });
        })
        
    </script>
@endsection

@endsection