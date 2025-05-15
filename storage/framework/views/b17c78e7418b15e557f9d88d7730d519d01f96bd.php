<?php $__env->startSection('title'); ?>
    Guard List
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-md-12">
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
            </div>
          <div class="col-sm-6">
            <h1>Guards</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Guards</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">

            <div class="card">
              <div class="card-header">
                <button class="btn btn-sm btn-success right" data-toggle="modal" data-target="#addModal">Add New Guard</button>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>S No</th>
                    <th>Building</th>
                    <th>Block</th>
                    <th>Gate</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Shift</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    
                    <?php $i = 0; ?>
                  <?php $__empty_1 = true; $__currentLoopData = $building->guards; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $guard): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                  <?php $i++; ?>
                  <tr>
                    <td><?php echo e($i); ?></td>
                    <td><?php echo e($guard->building->name); ?></td>
                    <td><?php echo e($guard->block->name); ?></td>
                    <td><?php echo e($guard->gate->name); ?></td>
                    <td><img src="<?php echo e($guard->user->photo); ?>" style="width:40px"></td>
                    <td><?php echo e($guard->user->name); ?></td>
                    <td><?php echo e($guard->user->phone); ?></td>
                    <td><?php echo e($guard->user->email); ?></td>
                    <td><?php echo e($guard->user->gender); ?></td>
                    <td><?php echo e($guard->shift); ?></td>
                    <td><?php echo e($guard->status); ?></td>
                    <td>
                      <!--<a href="<?php echo e(route('guard.show',$guard->id)); ?>" target="_blank"  class="btn btn-sm btn-warning"><i class="fa fa-eye"></i></a>-->
                      <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addModal" data-id="<?php echo e($guard->id); ?>" data-building_id="<?php echo e($guard->building_id); ?>" 
                      data-block_id="<?php echo e($guard->block_id); ?>" data-gate_id="<?php echo e($guard->gate_id); ?>" data-shift="<?php echo e($guard->shift); ?>" data-user_email="<?php echo e($guard->user->email); ?>" 
                      data-user_id="<?php echo e($guard->user_id); ?>" data-user_name="<?php echo e($guard->user->name); ?>" ><i class="fa fa-edit"></i></button>
                      <?php if($guard->deleted_at): ?>
                      <button class="btn btn-sm btn-success" data-toggle="modal" data-target="#deleteModal" data-id="<?php echo e($guard->id); ?>" data-action="restore"><i class="fa fa-undo"></i></button>
                      <?php else: ?>
                      <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal" data-id="<?php echo e($guard->id); ?>" data-action="delete"><i class="fa fa-trash"></i></button>
                      <?php endif; ?>
                    </td>

                  </tr>
                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                  <?php endif; ?>
                  </tbody>
                </table>
                </div>
                
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->

<!-- Add Modal -->

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add New Guard</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="<?php echo e(route('guard.store')); ?>" method="post" class="add-form">
        <?php echo csrf_field(); ?>
        <div class="modal-body">
          
          <div class="form-group">
            <label for="email" class="col-form-label">User Email:</label>
            <div class="input-group">
              <input type="email" name="user_email" class="form-control" id="user_email" maxlength="40" placeholder="Email" required>
              <div class="input-group-append">
                <button type="button" class="btn btn-primary" id="getUserData">Get User Data</button>
              </div>
            </div>
          </div>
          <div class="error text-danger"></div>
          <div class="form-group">
            <label for="email" class="col-form-label">User Name:</label>
            <input type="text" name="user_name" class="form-control" id="user_name" disabled required>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Shift:</label>
            <select name="shift" class="form-control" id="shift" required>
              <option value="Day">Day</option>
              <option value="Night">Night</option>
            </select>
          </div>
          
          <div class="form-group">
            <label for="name" class="col-form-label">Building:</label>
            <select name="building_id" id="building_id" class="form-control" required>
                <option value="<?php echo e($building->id); ?>"><?php echo e($building->name); ?></option>
            </select>
          </div>
          
          <div class="form-group">
            <label for="name" class="col-form-label">Block:</label>
            <select name="block_id" id="block_id" class="form-control block" required>
                <option value="">--Select--</option>
                <?php $__empty_1 = true; $__currentLoopData = $building->blocks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $block): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <option value="<?php echo e($block->id); ?>"><?php echo e($block->name); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                <?php endif; ?>
            </select>
          </div>
          
          <div class="form-group">
            <label for="name" class="col-form-label">Gate:</label>
            <div class="gates">
                <select name="gate_id" id="gate_id" class="form-control" required>
                    <option value="">--Select--</option>
                </select>
            </div>
          </div>
          
          <div class="form-group">
            <label for="status" class="col-form-label">Status:</label>
            <select name="status" class="form-control">
              <option value="Active">Active</option>
              <option value="Inactive">Inactive</option>
            </select>
          </div>
          
          <input type="hidden" name="id" id="edit-id">
          <input type="hidden" name="user_id" id="user_id">
          <input type="hidden" name="building_id" id="building_id" value="<?php echo e($building->id); ?>">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="save-button">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Delete Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Are you sure ?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p class="text"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" id="delete-button">Confirm Delete</button>
      </div>
    </div>
  </div>
</div>


<?php $__env->startSection('script'); ?>


<script>
  $(document).ready(function(){
    var id = '';
    var action = '';
    var token = "<?php echo e(csrf_token()); ?>";

    $('#deleteModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);
      id = button.data('id');
      $('#delete-id').val(id);
      action= button.data('action');
      $('#delete-button').removeClass('btn-success');
      $('#delete-button').removeClass('btn-danger');
      $('.modal-title').text('Are you sure ?');
      if(action == 'delete'){
          $('#delete-button').addClass('btn-danger');
          $('#delete-button').text('Confirm Delete');
          $('.text').text('You are going to permanently delete this item..');
      }else{
          $('#delete-button').addClass('btn-success');
          $('#delete-button').text('Confirm Restore');
          $('.text').text('You are going to restore this item..');
      }
    });

    $(document).on('click','#delete-button',function(){
      var url = "<?php echo e(route('guard.destroy','')); ?>";
      $.ajax({
        url : url,
        type: "POST",
        data : {'_token':token,'id':id,'action':action},
        success: function(data)
        {
          window.location.reload();
        }
      });
    });

    $('#addModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);
      var edit_id = button.data('id');
      $('#edit-id').val(edit_id);
      $('#user_email').val(button.data('user_email'));
      $('#user_name').val(button.data('user_name'));
      $('#user_id').val(button.data('user_id'));
      $('#building_id').val(button.data('building_id'));
      $('#block_id').val(button.data('block_id'));
      $('#gate_id').val(button.data('gate_id'));
      $('#shift').val(button.data('shift'));
      $('#status').val(button.data('status'));
      $('.modal-title').text('Add New Payment');
      if(edit_id){
          $('.modal-title').text('Update Payment');
      }
      var block_id = button.data('block_id');
      var gate_id = button.data('gate_id');
        $.ajax({
            url : "<?php echo e(url('/get-gates')); ?>",
            type: "post",
            data : {'_token':token,'block_id':block_id,'gate_id':gate_id},
            success: function(data)
            {
                $('.gates').html(data);
            }
        });
        
    });
    
    $('.status').bootstrapSwitch('state');
        $('.status').on('switchChange.bootstrapSwitch',function () {
            var id = $(this).data('id');
            $.ajax({
                url : "<?php echo e(url('update-event-status')); ?>",
                type: "post",
                data : {'_token':token,'id':id,},
                success: function(data)
                {
                  //
                }
            });
        });
        
    $('.add-form').on('submit', function (event) {
      if ($('#user_name').val().trim() === '') {
        event.preventDefault();
        $('.error').text('Customer Name is required. Please fetch user data.');
      }
    });
    
    // Fetch user data when clicking "Get User Data"
    $('#getUserData').on('click', function () {
      var email = $('#user_email').val().trim();
      if (email === '') {
        $('.error').text('Please enter an email to fetch user data.');
        return;
      }
      
      $('.error').text(''); // Clear previous errors
      
      $.ajax({
        url: '<?php echo e(url("get-user-by-email")); ?>', // Update with your actual route
        type: 'POST',
        data: { _token:token,email: email },
        success: function (response) {
          if (response.success) {
            $('#user_name').val(response.data.name);
            $('#user_id').val(response.data.id);
          } else {
            $('.error').text('User not found.');
            $('#user_name').val('');
          }
        },
        error: function () {
          $('.error').text('Error fetching user data.');
          $('#user_name').val('');
        }
      });
    });
    
    $(document).on('change','.block',function(){
        var block_id = $(this).val();
        var gate_id = '';
        $.ajax({
            url : "<?php echo e(url('/get-gates')); ?>",
            type: "post",
            data : {'_token':token,'block_id':block_id,'gate_id':gate_id},
            success: function(data)
            {
                $('.gates').html(data);
            }
        });
    });

  });
</script>
<?php $__env->stopSection(); ?>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\myflatinfo-ba\resources\views/admin/guard/index.blade.php ENDPATH**/ ?>