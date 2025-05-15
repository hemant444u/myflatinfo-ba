@extends('layouts.admin')


@section('title')
    Facility List
@endsection

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-md-12">
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
          <div class="col-sm-6">
            <h1>Facility List</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Facilities</li>
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
                <button class="btn btn-sm btn-success right" data-toggle="modal" data-target="#addModal">Add New Facility</button>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>S No</th>
                    <th>Name</th>
                    <th>Max Booking</th>
                    <th>Per User Max Booking(Monthly)</th>
                    <th>Price</th>
                    <th>Cancellation Type</th>
                    <th>Cancellation Value</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    
                    <?php $i = 0; ?>
                  @forelse($building->facilities as $facility)
                  <?php $i++; ?>
                  <tr>
                    <td>{{$i}}</td>
                    <td>{{$facility->name}}</td>
                    <td>{{$facility->pivot->max_booking}}</td>
                    <td>{{$facility->pivot->per_user_max_booking}}</td>
                    <td>{{$facility->pivot->price}}</td>
                    <td>{{$facility->pivot->cancellation_type}}</td>
                    <td>{{$facility->pivot->cancellation_value}}</td>
                    <td>{{$facility->pivot->status}}</td>
                    <td>
                      <a href="{{route('facility.show',$facility->id)}}" target="_blank"  class="btn btn-sm btn-warning"><i class="fa fa-eye"></i></a>
                      <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addModal" data-id="{{$facility->pivot->id}}" data-name="{{$facility->name}}" data-cancellation_type="{{$facility->pivot->cancellation_type}}"
                      data-max_booking="{{$facility->pivot->max_booking}}" data-per_user_max_booking="{{$facility->pivot->per_user_max_booking}}" data-status="{{$facility->pivot->status}}" data-price="{{$facility->pivot->price}}" 
                      data-cancellation_value="{{$facility->pivot->cancellation_value}}"><i class="fa fa-edit"></i></button>
                      @if($facility->deleted_at)
                      <button class="btn btn-sm btn-success" data-toggle="modal" data-target="#deleteModal" data-id="{{$facility->id}}" data-action="restore"><i class="fa fa-undo"></i></button>
                      @else
                      <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal" data-id="{{$facility->id}}" data-action="delete"><i class="fa fa-trash"></i></button>
                      @endif
                    </td>

                  </tr>
                  @empty
                  @endforelse
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
        <h5 class="modal-title" id="exampleModalLabel">Add New Facility</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="{{route('facility.store')}}" method="post" class="add-form" enctype="multipart/form-data">
        @csrf
        <div class="modal-body">
          <div class="error"></div>
          <div class="form-group">
            <label for="name" class="col-form-label">Name:</label>
            <input type="text" name="name" id="name" class="form-control" placeholder="Name" minlength="3" disabled>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Max Booking:</label>
            <input type="number" name="max_booking" id="max_booking" class="form-control" placeholder="Max Booking" min="1" max="100" required>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Per User Max Booking (Monthly):</label>
            <input type="number" name="per_user_max_booking" id="per_user_max_booking" class="form-control" placeholder="Max Booking" min="1" required>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Price:</label>
            <input type="number" name="price" id="price" class="form-control" placeholder="Price" min="1" max="100" required>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Cancellation Type:</label>
            <select name="cancellation_type" id="cancellation_type" class="form-control" required>
                <option value="Fixed">Fixed</option>
                <option value="Percentage">Percentage</option>
                <option value="Other">Other</option>
            </select>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Cancellation Value:</label>
            <input type="number" name="cancellation_value" id="cancellation_value" class="form-control" placeholder="1" min="1" max="100" required>
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
      var url = "{{route('facility.destroy','')}}";
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
      $('#colorHex').val(button.data('color'));
      $('#max_booking').val(button.data('max_booking'));
      $('#per_user_max_booking').val(button.data('per_user_max_booking'));
      $('#cancellation_type').val(button.data('cancellation_type'));
      $('#cancellation_value').val(button.data('cancellation_value'));
      $('#price').val(button.data('price'));
      $('#status').val(button.data('status'));
      $('.modal-title').text('Add New Facility');
      $('#icon').attr('required',true);
      if(edit_id){
          $('#icon').attr('required',false);
          $('.modal-title').text('Update Facility');
      }
    });

  });
</script>
@endsection

@endsection


