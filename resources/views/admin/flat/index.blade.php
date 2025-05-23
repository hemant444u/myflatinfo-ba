@extends('layouts.admin')


@section('title')
    Flat List
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
            <h1>Flat List</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Flats</li>
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
                <?php 
                  $created_counts = \App\Models\Flat::where('building_id', Auth::user()->building_id)->count();
                  $flat_limit = Auth::user()->building->no_of_flats;
                ?>
                <span>{{$created_counts}}/{{$flat_limit}}</span>
                <button class="btn btn-sm btn-success right" data-toggle="modal" data-target="#addModal" {{ $created_counts >= $flat_limit ? 'disabled' : '' }}>Add New Flat</button>
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
                    <th>Flat</th>
                    <th>Owner</th>
                    <th>Tanent</th>
                    <th>Area</th>
                    <th>Corpus Fund</th>
                    <th>Family Members</th>
                    <th>Status</th>
                    <th>SoldOut</th>
                    <th>Living</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    
                    <?php $i = 0; ?>
                  @forelse($building->flats as $flat)
                  <?php $i++; ?>
                  <tr>
                    <td>{{$i}}</td>
                    <td>{{$flat->building->name}}</td>
                    <td>{{$flat->block->name}}</td>
                    <td>{{$flat->name}}</td>
                    <td><a href="{{url('user',$flat->owner_id)}}" target="_blank">{{$flat->owner ? $flat->owner->name : ''}}</a></td>
                    <td><a href="{{url('user',$flat->tanent_id)}}" target="_blank">{{$flat->tanent ? $flat->tanent->name : ''}}</a></td>
                    <td>{{$flat->area}}</td>
                    <td>{{$flat->corpus_fund}}</td>
                    <td>{{$flat->family_members->count()}}</td>
                    <td>{{$flat->status}}</td>
                    <td>{{$flat->sold_out}}</td>
                    <td>{{$flat->living_status}}</td>
                    <td>
                      <a href="{{route('flat.show',$flat->id)}}" target="_blank"  class="btn btn-sm btn-warning"><i class="fa fa-eye"></i></a>
                      <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addModal" data-id="{{$flat->id}}" data-name="{{$flat->name}}" data-status="{{$flat->status}}" data-sold_out="{{$flat->sold_out}}" 
                            data-owner_name="{{$flat->owner ? $flat->owner->name : ''}}" data-tanent_name="{{$flat->tanent ? $flat->tanent->name : ''}}" data-owner_id="{{$flat->owner_id}}" data-tanent_id="{{$flat->tanent_id}}"
                            data-area="{{$flat->area}}" data-corpus_fund="{{$flat->corpus_fund}}" data-building_id="{{$flat->building_id}}" data-block_id="{{$flat->block_id}}" data-living_status="{{$flat->living_status}}" 
                             data-owner_email="{{$flat->owner ? $flat->owner->email : ''}}" data-tanent_email="{{$flat->tanent ? $flat->tanent->email : ''}}"><i class="fa fa-edit"></i></button>
                      @if($flat->owner_id >= 1)
                      <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#corpusModal" data-id="{{$flat->id}}" data-corpus-fund="{{$flat->corpus_fund}}" data-is_corpus_paid="{{$flat->is_corpus_paid}}" 
                      data-corpus_paid_on="{{$flat->corpus_paid_on}}" data-bill_no="{{$flat->bill_no}}"><i class="fa fa-money"></i></button>
                      @endif
                          @if($flat->deleted_at)
                          <button class="btn btn-sm btn-success" data-toggle="modal" data-target="#deleteModal" data-id="{{$flat->id}}" data-action="restore"><i class="fa fa-undo"></i></button>
                          @else
                          <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal" data-id="{{$flat->id}}" data-action="delete"><i class="fa fa-trash"></i></button>
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
        <h5 class="modal-title" id="exampleModalLabel">Add New Flat</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="{{route('flat.store')}}" method="post" class="add-form">
        @csrf
        <div class="modal-body">
          <div class="form-group">
            <label for="phone" class="col-form-label">Block:</label>
            <select name="block_id" class="form-control" id="block_id" required >
                @forelse($building->blocks as $block)
                <option value="{{$block->id}}">{{$block->name}}</option>
                @empty
                @endforelse
            </select>
          </div>
          <div class="form-group">
            <label for="phone" class="col-form-label">Flat Name or Number:</label>
            <input type="text" name="name" class="form-control" id="name" placeholder="Flat Name or No" required />
          </div>
          <div class="form-group">
            <label for="phone" class="col-form-label">Flat Area:In sqft</label>
            <input type="number" name="area" class="form-control" id="area" placeholder="Flat Area" required />
          </div>
          <div class="form-group">
            <label for="phone" class="col-form-label">Corpus Fund:</label>
            <input type="number" name="corpus_fund" class="form-control" id="corpus_fund" placeholder="Society Fund" required />
          </div>
          <div class="form-group">
            <label for="status" class="col-form-label">Status:</label>
            <select name="status" class="form-control" id="status">
              <option value="Active">Active</option>
              <option value="Inactive">Inactive</option>
            </select>
          </div>
          <div class="form-group">
            <label for="sold_out" class="col-form-label">SoldOut:</label>
            <select name="sold_out" class="form-control" id="sold_out">
              <option value="Yes">Yes</option>
              <option value="No">No</option>
            </select>
          </div>
          <div class="form-group">
            <label for="living_status" class="col-form-label">Living Status:</label>
            <select name="living_status" class="form-control living_status" id="living_status" required>
              <option value="Vacant">Vacant</option>
              <option value="Owner">Owner</option>
              <option value="Tanent">Tanent</option>
            </select>
          </div>

          <div class="form-group owner-email-group">
            <label for="email" class="col-form-label">Owner Email:</label>
            <div class="input-group">
              <input type="email" name="owner_email" class="form-control" id="owner_email" maxlength="40" placeholder="Owner Email">
              <div class="input-group-append">
                <button type="button" class="btn btn-primary" id="getOwnerData">Get Owner Data</button>
              </div>
            </div>
          </div>
          <div class="owner_error text-danger"></div>
          <div class="form-group owner-name-group">
            <label for="email" class="col-form-label">Owner Name:</label>
            <input type="text" name="owner_name" class="form-control" id="owner_name" disabled>
          </div>
          <div class="form-group tanent-email-group">
            <label for="email" class="col-form-label">Tanent Email:</label>
            <div class="input-group">
              <input type="email" name="tanent_email" class="form-control" id="tanent_email" maxlength="40" placeholder="Tanent Email">
              <div class="input-group-append">
                <button type="button" class="btn btn-primary" id="getTanentData">Get Tanent Data</button>
              </div>
            </div>
          </div>
          <div class="tanent_error text-danger"></div>
          <div class="form-group tanent-name-group">
            <label for="email" class="col-form-label">Tanent Name:</label>
            <input type="text" name="tanent_name" class="form-control" id="tanent_name" disabled>
          </div>
          
          <input type="hidden" name="id" id="edit-id">
          <input type="hidden" name="owner_id" id="owner_id" value="">
          <input type="hidden" name="tanent_id" id="tanent_id" value="">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="save-button">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- corpus Modal -->

<div class="modal fade" id="corpusModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Corpus Fund</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="{{url('update-corpus-fund')}}" method="post" class="add-form">
        @csrf
        <div class="modal-body">
          <div class="form-group">
            <label for="phone" class="col-form-label">Corpus Amount:</label>
            <input type="text" name="corpus_fund" class="form-control" id="corpus_fund2" placeholder="Corpus Fund" required />
          </div>
          <div class="form-group">
            <label for="phone" class="col-form-label">Payment Status:</label>
            <select name="is_corpus_paid" class="form-control" id="is_corpus_paid">
              <option value="Yes">Paid</option>
              <option value="No">Unpaid</option>
            </select>
          </div>

          <div class="form-group">
            <label for="phone" class="col-form-label">Paid On:</label>
            <input type="date" name="corpus_paid_on" class="form-control" id="corpus_paid_on" placeholder="corpus_paid_on">
          </div>
          <div class="form-group">
            <label for="bill_no" class="col-form-label">Bill Number:</label>
            <input type="text" name="bill_no" class="form-control" id="bill_no" disabled>
          </div>
          <input type="hidden" name="id" id="edit-id2">
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
      var url = "{{route('flat.destroy','')}}";
      $.ajax({
        url : url + '/' + id,
        type: "DELETE",
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
      $('#owner_name').val(button.data('owner_name'));
      $('#tanent_name').val(button.data('tanent_name'));
      $('#owner_email').val(button.data('owner_email'));
      $('#tanent_email').val(button.data('tanent_email'));
      $('#owner_id').val(button.data('owner_id'));
      $('#tanent_id').val(button.data('tanent_id'));
      $('#building_id').val(button.data('building_id'));
      $('#block_id').val(button.data('block_id'));
      $('#name').val(button.data('name'));
      $('#area').val(button.data('area'));
      $('#corpus_fund').val(button.data('corpus_fund'));
      $('#status').val(button.data('status'));
      $('#sold_out').val(button.data('sold_out'));
      $('#living_status').val(button.data('living_status'));
      $('.modal-title').text('Add New Flat');
      if(edit_id){
          $('.modal-title').text('Update Flat');
      }
      var living_status = $('#living_status').val();
      var sold_out = $('#sold_out').val();
      $('.owner-email-group').hide();
      $('.owner-name-group').hide();
      $('.tanent-email-group').hide();
      $('.tanent-name-group').hide();

      $('#owner_email').attr('required',false);
      $('#owner_name').attr('required',false);
      $('#tanent_email').attr('required',false);
      $('#tanent_name').attr('required',false);

      if(sold_out == 'Yes'){
        $('.owner-email-group').show();
        $('.owner-name-group').show();

        $('#owner_email').attr('required',true);
        $('#owner_name').attr('required',true);
      }

      if(living_status == 'Owner'){
        $('.owner-email-group').show();
        $('.owner-name-group').show();

        $('#owner_email').attr('required',true);
        $('#owner_name').attr('required',true);
      }
      if(living_status == 'Tanent'){
        $('.tanent-email-group').show();
        $('.tanent-name-group').show();

        $('#tanent_email').attr('required',true);
        $('#tanent_name').attr('required',true);
      }
    });

    $(document).on('change', '#sold_out', function (event) {
      var sold_out = $(this).val();
      $('.owner-email-group').hide();
      $('.owner-name-group').hide();
      $('.tanent-email-group').hide();
      $('.tanent-name-group').hide();

      $('#owner_email').attr('required',false);
      $('#owner_name').attr('required',false);
      $('#tanent_email').attr('required',false);
      $('#tanent_name').attr('required',false);
      if(sold_out == 'Yes'){
        $('.owner-email-group').show();
        $('.owner-name-group').show();
        $('#owner_email').attr('required',true);
        $('#owner_name').attr('required',true);
      }
      if(sold_out == 'No'){
        $('.living_status').val('Vacant');
      }

    });

    $(document).on('change', '.living_status', function (event) {
      var living_status = $(this).val();
      var sold_out = $('#sold_out').val();
      $('.owner-email-group').hide();
      $('.owner-name-group').hide();
      $('.tanent-email-group').hide();
      $('.tanent-name-group').hide();

      $('#owner_email').attr('required',false);
      $('#owner_name').attr('required',false);
      $('#tanent_email').attr('required',false);
      $('#tanent_name').attr('required',false);
      if(sold_out == 'Yes'){
        $('.owner-email-group').show();
        $('.owner-name-group').show();

        $('#owner_email').attr('required',true);
        $('#owner_name').attr('required',true);
      }
      if(living_status == 'Owner'){
        $('#sold_out').val('Yes');
        $('.owner-email-group').show();
        $('.owner-name-group').show();

        $('#owner_email').attr('required',true);
        $('#owner_name').attr('required',true);
      }
      if(living_status == 'Tanent'){
        $('#sold_out').val('Yes');
        $('.owner-email-group').show();
        $('.owner-name-group').show();
        $('.tanent-email-group').show();
        $('.tanent-name-group').show();

        $('#owner_email').attr('required',true);
        $('#owner_name').attr('required',true);
        $('#tanent_email').attr('required',true);
        $('#tanent_name').attr('required',true);
      }
    });
    
    $('.status').bootstrapSwitch('state');
        $('.status').on('switchChange.bootstrapSwitch',function () {
            var id = $(this).data('id');
            $.ajax({
                url : "{{url('update-building-status')}}",
                type: "post",
                data : {'_token':token,'id':id,},
                success: function(data)
                {
                  //
                }
            });
        });
        
    $('.add-form').on('submit', function (event) {
      
      if ($('.living_status').val().trim() === 'Owner' && $('#owner_name').val().trim() === '') {
        event.preventDefault();
        $('.owner_error').text('Owner Name is required. Please fetch owner data.');
      }
      if ($('.living_status').val().trim() === 'Tanent' && $('#tanent_name').val().trim() === '') {
        event.preventDefault();
        $('.tanent_error').text('Tanent Name is required. Please fetch tanent data.');
      }
    });
    
    // Fetch owner data when clicking "Get Owner Data"
    $('#getOwnerData').on('click', function () {
      var owner_email = $('#owner_email').val().trim();
      if (owner_email === '') {
        $('.owner_error').text('Please enter an email to fetch owner data.');
        return;
      }
      
      $('.owner_error').text(''); // Clear previous errors
      
      $.ajax({
        url: '{{ url("get-user-by-email") }}', // Update with your actual route
        type: 'POST',
        data: {'_token':token, email: owner_email },
        success: function (response) {
          if (response.success) {
            $('#owner_name').val(response.data.name);
            $('#owner_id').val(response.data.id);
          } else {
            $('.owner_error').text('Owner not found.');
            $('#owner_name').val('');
          }
        },
        error: function () {
          $('.owner_error').text('Error fetching owner data.');
          $('#owner_name').val('');
        }
      });
    });
    
    // Fetch tanent data when clicking "Get Tanent Data"
    $('#getTanentData').on('click', function () {
      var tanent_email = $('#tanent_email').val().trim();
      if (tanent_email === '') {
        $('.tanent_error').text('Please enter an email to fetch tanent data.');
        return;
      }
      
      $('.tanent_error').text(''); // Clear previous errors
      
      $.ajax({
        url: '{{ url("get-user-by-email") }}', // Update with your actual route
        type: 'POST',
        data: { '_token':token, email: tanent_email },
        success: function (response) {
          if (response.success) {
            $('#tanent_name').val(response.data.name);
            $('#tanent_id').val(response.data.id);
          } else {
            $('.tanent_error').text('Owner not found.');
            $('#tanent_name').val('');
          }
        },
        error: function () {
          $('.tanent_error').text('Error fetching tanent data.');
          $('#tanent_name').val('');
        }
      });
    });

    $('#corpusModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);
      var edit_id = button.data('id');
      $('#edit-id2').val(edit_id);
      $('#corpus_fund2').val(button.data('corpus-fund'));
      $('#is_corpus_paid').val(button.data('is_corpus_paid'));
      $('#corpus_paid_on').val(button.data('corpus_paid_on'));
      $('#bill_no').val(button.data('bill_no'));
      $('.modal-title').text('Corpus Fund');

    });

  });
</script>
@endsection

@endsection

