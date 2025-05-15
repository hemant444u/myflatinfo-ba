<?php $__env->startSection('title'); ?>
    Classified List
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
            <h1>Classified List</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Classifieds</li>
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
                <!--<button class="btn btn-sm btn-success right" data-toggle="modal" data-target="#addModal">Add New Classified</button>-->
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>S No</th>
                    <th>Posted By</th>
                    <th>Building</th>
                    <th>Category</th>
                    <th>Title</th>
                    <th>Desc</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    
                    <?php $i = 0; ?>
                  <?php $__empty_1 = true; $__currentLoopData = $building->classifieds; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                  <?php $i++; ?>
                  <tr>
                    <td><?php echo e($i); ?></td>
                    <td><a href="<?php echo e(url('customer',$item->user_id)); ?>"><?php echo e($item->user->name); ?></a></td>
                    <td><a href="<?php echo e(route('buildings.show',$item->building_id)); ?>"><?php echo e($item->building->name); ?></a></td>
                    <td><?php echo e($item->category); ?></td>
                    <td><?php echo e($item->title); ?></td>
                    <td><?php echo e($item->desc); ?></td>
                    <td><?php echo e($item->status); ?></td>
                    <td>
                      <a href="<?php echo e(route('classified.show',$item->id)); ?>" target="_blank"  class="btn btn-sm btn-warning"><i class="fa fa-eye"></i></a>
                      <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addModal" data-id="<?php echo e($item->id); ?>" data-title="<?php echo e($item->title); ?>" data-desc="<?php echo e($item->desc); ?>"  
                       data-status="<?php echo e($item->status); ?>" data-building_id="<?php echo e($item->building_id); ?>" 
                      data-block_id="<?php echo e($item->block_id); ?>" data-flat_id="<?php echo e($item->flat_id); ?>" data-category="<?php echo e($item->category); ?>"><i class="fa fa-edit"></i></button>
                      <?php if($item->deleted_at): ?>
                      <button class="btn btn-sm btn-success" data-toggle="modal" data-target="#deleteModal" data-id="<?php echo e($item->id); ?>" data-action="restore"><i class="fa fa-undo"></i></button>
                      <?php else: ?>
                      <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal" data-id="<?php echo e($item->id); ?>" data-action="delete"><i class="fa fa-trash"></i></button>
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
        <h5 class="modal-title" id="exampleModalLabel">Add Classified</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="<?php echo e(route('classified.store')); ?>" method="post" class="add-form" enctype="multipart/form-data">
        <?php echo csrf_field(); ?>
        <div class="modal-body">
          <div class="error"></div>
          <div class="form-group">
            <label for="name" class="col-form-label">Building:</label>
            <select name="building_id" id="building_id" class="form-control" disabled required>
                <option value="">Select Block</option>
                <option value="<?php echo e($building->id); ?>"><?php echo e($building->name); ?></option>
            </select>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Block:</label>
            <select name="block_id" id="block_id" class="form-control" disabled required>
                <option value="">Select Block</option>
                <?php $__empty_1 = true; $__currentLoopData = $building->blocks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $block): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                <option value="<?php echo e($block->id); ?>"><?php echo e($block->name); ?></option>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                <?php endif; ?>
            </select>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Flat:</label>
            <select name="flat_id" id="flat_id" class="form-control" disabled required>
                <option value=""></option>
            </select>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Category:</label>
            <select name="category" id="category" class="form-control" disabled required>
                <option value="Within Building">Within Building</option>
                <option value="All Buildings">All Buildings</option>
            </select>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Title:</label>
            <input type="text" name="title" id="title" class="form-control" min="3" max="30" placeholder="Title" minlength="4" disabled required>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Desc:</label>
            <textarea name="desc" id="desc" class="form-control" disabled required></textarea>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Status:</label>
            <select name="status" id="status" class="form-control" required>
                <option value="Approved">Approved</option>
                <option value="Rejected">Rejected</option>
                <option value="Send For Editing">Send For Editing</option>
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
      var url = "<?php echo e(route('classified.destroy','')); ?>";
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
      $('#building_id').val(button.data('building_id'));
      $('#block_id').val(button.data('block_id'));
      $('#category').val(button.data('category'));
      $('#title').val(button.data('title'));
      $('#desc').val(button.data('desc'));

      $('#status').val(button.data('status'));
      $('#image2').attr('src',button.data('image'));
      $('.modal-title').text('Add New Classified');
      $('#image').attr('required',true);
      if(edit_id){
          $('#image').attr('required',false);
          $('.modal-title').text('Update Classified');
      }
      loadFlats($('#block_id').val(),button.data('flat_id'));
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
        
    function loadFlats(blockId,flatId) {
        let flatDropdown = $('#flat_id');
        
        // Clear previous options
        flatDropdown.empty().append('<option value="">Select Flat</option>');

        if (blockId) {
            $.ajax({
                url: '/get-flats/' + blockId, // Adjust the URL based on your route
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        $.each(response.flats, function (index, flat) {
                            flatDropdown.append('<option value="' + flat.id + '">' + flat.name + '</option>');
                        });
                        $('#flat_id').val(flatId);
                    } else {
                        alert('No flats found for this block.');
                    }
                },
                error: function () {
                    alert('Something went wrong while fetching flats.');
                }
            });
        }
    }

    // Call function when block selection changes
    $('#block_id').change(function () {
        loadFlats($(this).val());
    });


  });
  

</script>
<?php $__env->stopSection(); ?>

<?php $__env->stopSection(); ?>



<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\myflatinfo-ba\resources\views/admin/classified/index.blade.php ENDPATH**/ ?>