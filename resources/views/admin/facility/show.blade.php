@extends('layouts.admin')

@section('title')
    Facility Details
@endsection

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Facility Details</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Facility Details</li>
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
                <!--<div class="text-center">-->
                <!--  <img class="profile-user-img img-fluid img-circle"-->
                <!--       src="{{$facility->image}}"-->
                <!--       alt="User profile picture">-->
                <!--</div>-->
                <h3 class="profile-username text-center">{{$facility->name}}</h3>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Max Booking</b> <a class="float-right">{{$facility->max_booking}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Status</b> <a class="float-right">
                        <input type="checkbox" name="my-checkbox" class="status" data-id="{{$facility->id}}" data-bootstrap-switch data-on-text="Active" 
                        data-off-text="Inactive" {{$facility->status == 'Active' ? 'checked' : ''}}>
                    </a>
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
                </div>
            <div class="card">
              <div class="card-header p-2">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link active" href="#timings" data-toggle="tab">Timings</a></li>
                  <li class="nav-item"><a class="nav-link" href="#bookings" data-toggle="tab">Bookings</a></li>
                </ul>
              </div><!-- /.card-header -->
              <div class="card-body">
                <div class="tab-content">
                  <div class="active tab-pane" id="timings">
                    <button class="btn btn-sm btn-success" data-toggle="modal" data-target="#addModal">Add New Timing</button>
                    <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                      <thead>
                          <tr>
                              <th>S No</th>
                              <th>From</th>
                              <th>To</th>
                              <th>Status</th>
                              <th>Action</th>
                          </tr>
                      </thead>
                      <tbody>
                        <?php $i = 0; ?>
                        @forelse($facility->timings as $timing)
                        <?php $i++ ?>
                        <tr>
                          <td>{{$i}}</td>
                          <td>{{$timing->from}}</td>
                          <td>{{$timing->to}}</td>
                          <td>{{$timing->status}}</td>
                          <td>
                      <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addModal" data-id="{{$timing->id}}" data-from="{{$timing->from}}" data-to="{{$timing->to}}" 
                      data-status="{{$timing->status}}"><i class="fa fa-edit"></i></button>
                      @if($timing->deleted_at)
                      <button class="btn btn-sm btn-success" data-toggle="modal" data-target="#deleteModal" data-id="{{$timing->id}}" data-action="restore"><i class="fa fa-undo"></i></button>
                      @else
                      <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal" data-id="{{$timing->id}}" data-action="delete"><i class="fa fa-trash"></i></button>
                      @endif
                    </td>
                        </tr>
                        @empty
                        @endforelse
                      </tbody>
                    </table>
                    </div>
                  </div>
                  <!-- /.tab-pane -->
                  
                  <div class="tab-pane" id="bookings">
                    <!--<button class="btn btn-sm btn-success" data-toggle="modal" data-target="#addModal">Add New Booking</button>-->
                    <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                      <thead>
                          <tr>
                              <th>S No</th>
                              <th>Booked By</th>
                              <th>Date</th>
                              <th>From</th>
                              <th>To</th>
                              <th>Members</th>
                              <th>Status</th>
                              <!--<th>Action</th>-->
                          </tr>
                      </thead>
                      <tbody>
                        <?php $i = 0; ?>
                        @forelse($facility->bookings as $booking)
                        <?php $i++ ?>
                        <tr>
                          <td>{{$i}}</td>
                          <td><a href="{{url('user',$booking->user_id)}}" target="_blank">{{$booking->user->name}}</a></td>
                          <td>{{$booking->date}}</td>
                          <td>{{$booking->timing->from}}</td>
                          <td>{{$booking->timing->to}}</td>
                          <td>{{$booking->members}}</td>
                          <td>{{$booking->status}}</td>
                          <!--<td>-->
                      <!--<button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addModal" data-id="{{$booking->id}}" data-from="{{$booking->from}}" data-to="{{$booking->to}}" -->
                      <!--data-status="{{$booking->status}}"><i class="fa fa-edit"></i></button>-->
                      <!--@if($booking->deleted_at)-->
                      <!--<button class="btn btn-sm btn-success" data-toggle="modal" data-target="#deleteModal" data-id="{{$booking->id}}" data-action="restore"><i class="fa fa-undo"></i></button>-->
                      <!--@else-->
                      <!--<button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal" data-id="{{$booking->id}}" data-action="delete"><i class="fa fa-trash"></i></button>-->
                      <!--@endif-->
                    <!--</td>-->
                        </tr>
                        @empty
                        @endforelse
                      </tbody>
                    </table>
                    </div>
                  </div>
                  <!-- /.tab-pane -->
                  
                </div>
                <!-- /.tab-content -->
              </div><!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    
<!-- Add Modal -->

<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add New Timing</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="{{route('timing.store')}}" method="post" class="add-form">
        @csrf
        <div class="modal-body">
          

          <div class="error text-danger"></div>
          <div class="form-group">
            <label for="email" class="col-form-label">From:</label>
            <input type="time" name="from" class="form-control" id="from" required>
          </div>
          <div class="form-group">
            <label for="email" class="col-form-label">To:</label>
            <input type="time" name="to" class="form-control" id="to" required>
          </div>
          <div class="form-group">
            <label for="status" class="col-form-label">Status:</label>
            <select name="status" class="form-control">
              <option value="Active">Active</option>
              <option value="Inactive">Inactive</option>
            </select>
          </div>
          
          <input type="hidden" name="id" id="edit-id">
          <input type="hidden" name="facility_id" id="facility_id" value="{{$facility->id}}">
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

@section('script')


<script>
  $(document).ready(function(){
    var id = '';
    var action = '';
    var token = "{{csrf_token()}}";
    
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
      var url = "{{route('timing.destroy','')}}";
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
      $('#from').val(button.data('from'));
      $('#to').val(button.data('to'));
      $('#status').val(button.data('status'));
      $('.modal-title').text('Add New Timing');
      if(edit_id){
          $('.modal-title').text('Update Timing');
      }
    });
        
  });
</script>
@endsection

@endsection



