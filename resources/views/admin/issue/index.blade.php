@extends('layouts.admin')


@section('title')
    Issue List
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
            <h1>Issue</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Issue</li>
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
                <button class="btn btn-sm btn-success right" data-toggle="modal" data-target="#addModal">Add New Issue</button>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>S No</th>
                    <th>Flat</th>
                    <th>Department</th>
                    <th>Image</th>
                    <th>Desc</th>
                    <th>Periority</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    
                    <?php $i = 0; ?>
                  @forelse($building->issues as $issue)
                  <?php $i++; ?>
                  <tr>
                    <td>{{$i}}</td>
                    <td>{{$issue->flat ? $issue->flat->name : 'All'}}</td>
                    <td>{{$issue->department->name}}</td>
                    <td><img src="{{$issue->photos['0']->photo}}" style="width:40px"></td>
                    <td>{{$issue->desc}}</td>
                    <td>{{$issue->periority}}</td>
                    <td>{{$issue->status}}</td>
                    <td>
                      <a href="{{route('issue.show',$issue->id)}}" target="_blank"  class="btn btn-sm btn-warning"><i class="fa fa-eye"></i></a>
                      <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addModal" data-id="{{$issue->id}}" data-desc="{{$issue->desc}}" data-status="{{$issue->status}}" data-building_id="{{$issue->building_id}}" 
                        data-block_id="{{$issue->block_id}}" data-flat_id="{{$issue->flat_id}}" data-periority="{{$issue->periority}}" data-role_id="{{$issue->role_id}}"><i class="fa fa-edit"></i></button>
                      @if($issue->deleted_at)
                      <button class="btn btn-sm btn-success" data-toggle="modal" data-target="#deleteModal" data-id="{{$issue->id}}" data-action="restore"><i class="fa fa-undo"></i></button>
                      @else
                      <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal" data-id="{{$issue->id}}" data-action="delete"><i class="fa fa-trash"></i></button>
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
        <h5 class="modal-title" id="exampleModalLabel">Add Owner</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="{{route('issue.store')}}" method="post" class="add-form" enctype="multipart/form-data">
        @csrf
        <div class="modal-body">
          <div class="error"></div>
          <div class="form-group">
            <label for="name" class="col-form-label">Building:</label>
            <select name="building_id" id="building_id" class="form-control" required>
                <option value="{{Auth::User()->building_id}}">{{Auth::User()->building->name}}</option>
            </select>
          </div>
          <div class="form-group">
            <label for="role" class="col-form-label">Block:</label>
            <select name="block_id" class="form-control" id="block_id">
              <option value="">All</option>
              <?php $blocks = Auth::User()->building->blocks; ?>
              @forelse($blocks as $block)
              <option value="{{$block->id}}">{{$block->name}}</option>
              @empty
              @endforelse
            </select>
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Flat:</label>
            <div class="flats">
                <select name="flat_id" id="flat_id" class="form-control">
                    <option value="">All</option>
                </select>
            </div>
          </div>
          <div class="form-group">
            <label for="role" class="col-form-label">Department:</label>
            <select name="role_id" class="form-control" id="role_id" required>
              <?php $roles = Auth::User()->building->roles; ?>
              @forelse($roles as $role)
              <option value="{{$role->id}}">{{$role->name}}</option>
              @empty
              @endforelse
            </select>
          </div>
          <div class="form-group">
            <label for="role" class="col-form-label">Periority:</label>
            <select name="periority" class="form-control" id="periority" required>
              <option value="High">High</option>
              <option value="Medium">Medium</option>
              <option value="Low">Low</option>
            </select>
          </div>
          <div class="form-group">
            <label for="role" class="col-form-label">Desc:</label>
            <textarea name="desc" id="desc" class="form-control" required></textarea>
          </div>
          <div class="form-group">
            <label for="role" class="col-form-label">Status:</label>
            <select name="status" class="form-control" id="status" required>
              <option value="Pending">Pending</option>
              <option value="Ongoing">Ongoing</option>
              <option value="Solved">Solved</option>
              <option value="Rejected">Rejected</option>
            </select>
          </div>
          <div class="form-group">
            <label for="photos" class="col-form-label">Photos:</label>
            <input type="file" accept="image/*" name="photos[]" class="form-control" id="photos" multiple required>
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
    
    $('.hide-password').hide();
            
    $(document).on('click','.show-password',function(){
        $('.password').attr('type','text');
        $('.show-password').hide();
        $('.hide-password').show();
    });
    $(document).on('click','.hide-password',function(){
        $('.password').attr('type','password');
        $('.hide-password').hide();
        $('.show-password').show();
    });

    $('#deleteModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);
      id = button.data('id');
      $('.modal-title').text('Are you sure ?');
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
      var url = "{{route('issue.destroy','')}}";
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
      $('#building_id').val(button.data('building_id'));
      $('#block_id').val(button.data('block_id'));
      $('#flat_id').val(button.data('flat_id'));
      $('#role_id').val(button.data('role_id'));
      $('#periority').val(button.data('periority'));
      $('#desc').val(button.data('desc'));
      $('#status').val(button.data('status'));
      $('.modal-title').text('Add New Issue');
      $('#photos').attr('required',true);
      if(edit_id){
          $('.modal-title').text('Update Issue');
          $('#photos').attr('required',false);
      }

      var block_id = button.data('block_id');
      var flat_id = button.data('flat_id');
        $.ajax({
            url : "{{url('/get-flats')}}",
            type: "post",
            data : {'_token':token,'block_id':block_id,'flat_id':flat_id},
            success: function(data)
            {
                $('.flats').html(data);
            }
        });
    });
    
    $('.status').bootstrapSwitch('state');
        $('.status').on('switchChange.bootstrapSwitch',function () {
            var id = $(this).data('id');
            $.ajax({
                url : "{{url('update-user-status')}}",
                type: "post",
                data : {'_token':token,'id':id,},
                success: function(data)
                {
                  //
                }
            });
        });
    $(document).on('change','#block_id',function(){
        var block_id = $(this).val();
        var flat_id = '';
        $.ajax({
            url : "{{url('/get-flats')}}",
            type: "post",
            data : {'_token':token,'block_id':block_id,'flat_id':flat_id},
            success: function(data)
            {
                $('.flats').html(data);
            }
        });
    });
  });
</script>
@endsection

@endsection


