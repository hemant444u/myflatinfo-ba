<?php $__env->startSection('title'); ?>
    Profile Details
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
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
                       src="<?php echo e($customer->photo); ?>"
                       alt="User profile picture">
                </div>
                <h3 class="profile-username text-center"><?php echo e($customer->name); ?></h3>

                <p class="text-muted text-center"><?php echo e($customer->role); ?></p>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Email</b> 
                    <a class="float-right address"><?php echo e($customer->email); ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Phone</b> <a class="float-right"><?php echo e($customer->phone); ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Gender</b> <a class="float-right"><?php echo e($customer->gender); ?></a>
                  </li>
                  
                  <!--<li class="list-group-item">-->
                  <!--  <b>Security Amount</b> <a class="float-right"><?php echo e($customer->security_paid == 1 ? 'Paid' : 'Pending'); ?></a>-->
                  <!--</li>-->

                  <li class="list-group-item">
                    <b>Address</b> <a class="float-right address"><?php echo e($customer->address); ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Status</b> <a class="float-right"><?php echo e($customer->status); ?></a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <?php if(session()->has('error')): ?>
                <div class="alert alert-danger">
                    <?php echo e(session()->get('error')); ?>

                </div>
            <?php endif; ?>
            <?php if(session()->has('success')): ?>
                <div class="alert alert-success">
                    <?php echo e(session()->get('success')); ?>

                </div>
            <?php endif; ?>
            <div class="card">
                <div class="card-header">Basic info</div>
                <div class="card-body">
                    <form class="form-horizontal" action="<?php echo e(url('update-profile')); ?>" method="post" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>
                      <div class="form-group row">
                        <label for="inputName" class="col-sm-2 col-form-label">Name</label>
                        <div class="col-sm-5">
                          <input type="text" class="form-control" name="first_name" value="<?php echo e($customer->first_name); ?>" minlength="4" maxlength="20"
                          onkeypress="return event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32" required>
                        </div>
                        <div class="col-sm-5">
                          <input type="text" class="form-control" name="last_name" value="<?php echo e($customer->last_name); ?>" minlength="4" maxlength="20"
                          onkeypress="return event.charCode >= 65 && event.charCode <= 90 || event.charCode >= 97 && event.charCode <= 122 || event.charCode == 32" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" name="email" value="<?php echo e($customer->email); ?>" maxlength="50" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">Phone</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" name="phone" value="<?php echo e($customer->phone); ?>" minlength="10" maxlength="10"  
                                      onkeypress="return event.charCode >= 48 && event.charCode <= 57" required>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputExperience" class="col-sm-2 col-form-label">Gender</label>
                        <div class="col-sm-10">
                          <select name="gender" class="form-control">
                              <option value="Male" <?php echo e($customer->gender == 'Male' ? 'selected' : ''); ?>>Male</option>
                              <option value="Female" <?php echo e($customer->gender == 'Female' ? 'selected' : ''); ?>>Female</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputName2" class="col-sm-2 col-form-label">Address</label>
                        <div class="col-sm-10">
                          <textarea name="address" class="form-control" maxlength=100"" required><?php echo e($customer->address); ?></textarea>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="inputSkills" class="col-sm-2 col-form-label">Profile Image
                            <img src="<?php echo e($customer->photo); ?>" style="width:40px">
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
                    <form action="<?php echo e(url('change-password')); ?>" method="post">
                            <?php echo csrf_field(); ?>
                            <div class="form-group">
                                <label>Current Password</label>
                                <div class="input-group">
                                    <input type="password" name="current_password" class="form-control current-password" minlength="8" maxlength="14" id="re_pass" style="width:95%;" placeholder="Current password"/ required>
                                    <a href="javascript:void(0)" class="current-show-password password-icon"><i class="fa fa-eye-slash"></i></a>
                                    <a href="javascript:void(0)" class="current-hide-password password-icon" style="display:none;"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                </div>
                                <?php if($errors->has('current_password')): ?>
                                    <p style="color:red"><?php echo e($errors->first('current_password')); ?></p>
                                <?php endif; ?>
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
                                <?php if($errors->has('password')): ?>
                                    <p style="color:red"><?php echo e($errors->first('password')); ?></p>
                                <?php endif; ?>
                            </div>
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <div class="input-group">
                                    <input type="password" name="password_confirmation" class="form-control confirm-password" minlength="8" maxlength="14" id="re_pass" style="width:95%;" 
                                    placeholder="Confirm password"/ required>
                                    <a href="javascript:void(0)" class="confirm-show-password password-icon"><i class="fa fa-eye-slash"></i></a>
                                    <a href="javascript:void(0)" class="confirm-hide-password password-icon" style="display:none;"><i class="fa fa-eye" aria-hidden="true"></i></a>
                                </div>
                                <?php if($errors->has('password_confirmation')): ?>
                                    <p style="color:red"><?php echo e($errors->first('password_confirmation')); ?></p>
                                <?php endif; ?>
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

<?php $__env->startSection('script'); ?>
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
<?php $__env->stopSection(); ?>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\myflatinfo-ba\resources\views/admin/profile.blade.php ENDPATH**/ ?>