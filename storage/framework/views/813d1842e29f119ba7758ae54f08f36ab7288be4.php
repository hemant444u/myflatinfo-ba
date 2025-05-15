<link rel="stylesheet" href="<?php echo e(asset('public/admin/plugins/summernote/summernote-bs4.min.css')); ?>">
<?php $__env->startSection('title'); ?>
    Event List
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
            <h1>Event List</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Events</li>
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
                <button class="btn btn-sm btn-success right" data-toggle="modal" data-target="#addModal">Add New Event</button>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>S No</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Desc</th>
                    <th>From Time</th>
                    <th>To Time</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    
                    <?php $i = 0; ?>
                  <?php $__empty_1 = true; $__currentLoopData = $building->events; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $event): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                  <?php $i++; ?>
                  <tr>
                    <td><?php echo e($i); ?></td>
                    <td><img src="<?php echo e($event->image); ?>" style="width:40px"></td>
                    <td><?php echo e($event->name); ?></td>
                    <td><?php echo e($event->desc); ?></td>
                    <td><?php echo e($event->from_time); ?></td>
                    <td><?php echo e($event->to_time); ?></td>
                    <td><?php echo e($event->status); ?></td>
                    <td>
                      <a href="<?php echo e(route('event.show',$event->id)); ?>" target="_blank"  class="btn btn-sm btn-warning"><i class="fa fa-eye"></i></a>
                      <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addModal" data-id="<?php echo e($event->id); ?>" data-name="<?php echo e($event->name); ?>" data-desc="<?php echo e($event->desc); ?>" data-image="<?php echo e($event->image); ?>"  
                      data-from_time="<?php echo e($event->from_time); ?>" data-to_time="<?php echo e($event->to_time); ?>" data-status="<?php echo e($event->status); ?>" data-building_id="<?php echo e($event->building_id); ?>"><i class="fa fa-edit"></i></button>
                      <?php if($event->deleted_at): ?>
                      <button class="btn btn-sm btn-success" data-toggle="modal" data-target="#deleteModal" data-id="<?php echo e($event->id); ?>" data-action="restore"><i class="fa fa-undo"></i></button>
                      <?php else: ?>
                      <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal" data-id="<?php echo e($event->id); ?>" data-action="delete"><i class="fa fa-trash"></i></button>
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
        <h5 class="modal-title" id="exampleModalLabel">Add Event</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="<?php echo e(route('event.store')); ?>" method="post" class="add-form" enctype="multipart/form-data">
        <?php echo csrf_field(); ?>
        <div class="modal-body">
          <div class="error"></div>
          <div class="form-group">
            <label for="name" class="col-form-label">Building:</label>
            <select name="building_id" id="building_id" class="form-control" required>
                <option value="<?php echo e($building->id); ?>"><?php echo e($building->name); ?></option>
            </select>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Name:</label>
            <input type="text" name="name" id="name" class="form-control" min="3" max="30" placeholder="Name" minlength="4" required>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Desc:</label>
            <textarea name="desc" id="desc" class="form-control" required></textarea>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Image: <img src="" id="image2" style="width:40px"></label>
            <input type="file" name="image" id="image" class="form-control" accept="image/*" required>
          </div>
          <div class="form-group">
            <label for="code" class="col-form-label">From Time:</label>
            <input type="datetime-local" name="from_time" class="form-control" id="from_time" placeholder="From Time" required>
          </div>
          <div class="form-group">
            <label for="code" class="col-form-label">To Time:</label>
            <input type="datetime-local" name="to_time" class="form-control" id="to_time" placeholder="To Time" required>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Status:</label>
            <select name="status" id="status" class="form-control" required>
                <option value="Pending">Pending</option>
                <option value="Active">Active</option>
            </select>
          </div>
          <input type="hidden" name="id" id="edit-id">
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
      var url = "<?php echo e(route('event.destroy','')); ?>";
      $.ajax({
        url : url + '/' + id,
        type: "DELETE",
        data : {'_token':token,'action':action},
        success: function(data)
        {
          window.location.reload();
        }
      });
    });

    $('#addModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);
      var edit_id = button.data('id');
      $('#edit-id').val(button.data('id'));
      $('#name').val(button.data('name'));
      $('#desc').val(button.data('desc'));
      $('#from_time').val(button.data('from_time'));
      $('#to_time').val(button.data('to_time'));
      $('#status').val(button.data('status'));
      $('#building_id').val(button.data('building_id'));
      $('#image2').attr('src',button.data('image'));
      $('.modal-title').text('Add New Event');
      $('#image').attr('required',true);
      if(edit_id){
          $('#image').attr('required',false);
          $('.modal-title').text('Update Event');
      }
    });
    
    $('.status').bootstrapSwitch('state');
        $('.status').on('switchChange.bootstrapSwitch',function () {
            var id = $(this).data('id');
            $.ajax({
                url : "<?php echo e(url('update-building-status')); ?>",
                type: "post",
                data : {'_token':token,'id':id,},
                success: function(data)
                {
                  //
                }
            });
        });

  });
</script>

<script src="<?php echo e(asset('public/admin/plugins/summernote/summernote-bs4.min.js')); ?>"></script>

<script>
  $(function () {
    // Summernote
    $('#summernote').summernote()

  })
</script>
<?php $__env->stopSection(); ?>

<?php $__env->stopSection(); ?>



<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\myflatinfo-ba\resources\views/admin/event/index.blade.php ENDPATH**/ ?>