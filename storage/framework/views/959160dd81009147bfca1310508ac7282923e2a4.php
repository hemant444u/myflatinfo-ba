<?php $__env->startSection('title'); ?>
    Society Funds
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Society Funds</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Society Funds</li>
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
                <h3 class="profile-username text-center"><?php echo e($building->name); ?></h3>
                </div>
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <a href="#" class="" onclick="get_expenses()">Expenses</a>
                  </li>
                  <li class="list-group-item">
                    <a href="#" class="" onclick="get_maintenance_funds()">Maintenance Funds</a>
                  </li>
                  <li class="list-group-item">
                    <a href="#" class="" onclick="get_event_funds()">Event Funds</a>
                  </li>
                  <li class="list-group-item">
                    <a href="#" class="" onclick="get_corpus_funds()">Corpus Funds</a>
                  </li>
                  <li class="list-group-item">
                    <a href="#" class="" onclick="get_reciepts()">Reciepts</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col -->
          <div class="col-md-9">
                <div class="">
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
            <div class="loaded-content">
            </div>
            <!-- /.card -->
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
        var id = '';
        var action = '';
        var token = "<?php echo e(csrf_token()); ?>";
    
        get_expenses();
    });
        function get_expenses(){
            $.ajax({
                url : "<?php echo e(url('get-expenses')); ?>",
                    type: "post",
                    data : {'_token':"<?php echo e(csrf_token()); ?>"},
                    success: function(data)
                    {
                      $('.loaded-content').html(data);
                    }
                });
        }
        function get_maintenance_funds(){
            $.ajax({
                url : "<?php echo e(url('get-maintenance-funds')); ?>",
                    type: "post",
                    data : {'_token':"<?php echo e(csrf_token()); ?>"},
                    success: function(data)
                    {
                      $('.loaded-content').html(data);
                    }
                });
        }
        function get_event_funds(){
            $.ajax({
                url : "<?php echo e(url('get-event-funds')); ?>",
                    type: "post",
                    data : {'_token':"<?php echo e(csrf_token()); ?>"},
                    success: function(data)
                    {
                      $('.loaded-content').html(data);
                    }
                });
        }
        function get_corpus_funds(){
            $.ajax({
                url : "<?php echo e(url('get-corpus-funds')); ?>",
                    type: "post",
                    data : {'_token':"<?php echo e(csrf_token()); ?>"},
                    success: function(data)
                    {
                      $('.loaded-content').html(data);
                    }
                });
        }
        function get_reciepts(){
            $.ajax({
                url : "<?php echo e(url('get-reciepts')); ?>",
                    type: "post",
                    data : {'_token':"<?php echo e(csrf_token()); ?>"},
                    success: function(data)
                    {
                      $('.loaded-content').html(data);
                    }
                });
        }
</script>
<?php $__env->stopSection(); ?>

<?php $__env->stopSection(); ?>




<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\myflatinfo-ba\resources\views/admin/fund/index.blade.php ENDPATH**/ ?>