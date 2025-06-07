@extends('layouts.admin')

@section('title')
    Manage Maintenance
@endsection

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Maintenance Details</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Maintenance Details</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
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
                <div class="card-body">
                  <form method="GET" action="{{ url('account/statement/income-and-expenditure') }}">
                    <div class="form-row">
                      <div class="form-group col-md-6">
                        <label for="block" class="col-form-label">Block:</label>
                        <select name="block" id="block" class="form-control" required>
                            @forelse($blocks as $block)
                            <option value="{{$block->id}}" {{ request('block') == $block->id ? 'selected' : ''}}>{{$block->name}}</option>
                            @empty
                            @endforelse
                        </select>
                      </div>
                      <div class="form-group col-md-6">
                        <div class="flat-id"></div>
                      </div>
                    </div>

                    <div class="form-row">
                      <div class="form-group col-md-6">
                        <label for="from_date">From Date</label>
                        <input type="date" id="from_date" name="from_date" class="form-control" value="{{ request('from_date') }}">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="to_date">To Date</label>
                        <input type="date" id="to_date" name="to_date" class="form-control" value="{{ request('to_date') }}">
                        </div>
                    </div>

                    <div class="form-row">
                      <div class="form-group col-md-6">
                        <label>&nbsp;</label>
                        <button type="submit" class="btn btn-primary btn-block mt-2">Filter</button>
                      </div>
                    </div>
                    </form>
                </div>
            </div>


            <div class="card">
              <div class="card-header p-2">
              </div><!-- /.card-header -->
              <div class="card-body">
                    <!--<button class="btn btn-sm btn-success" data-toggle="modal" data-target="#addModal">Add New Maintenance Payment</button>-->
                    <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                      <thead>
                          <tr>
                              <th>S No</th>
                              <th>Block</th>
                              <th>Flat</th>
                              <th>Tananet</th>
                              <th>Owner</th>
                              <th>From</th>
                              <th>To</th>
                              <th>Maintenance Fee</th>
                              <th>Due Date</th>
                              <th>Late Fine</th>
                              <th>Paid Amount</th>
                              <th>Dues Amount</th>
                              <th>Type</th>
                              <th>Status</th>
                              <th>Action</th>
                          </tr>
                      </thead>
                      <tbody>
                        <?php $i = 0;?>
                        @forelse($maintenance_payments as $payment)
                        <?php $i++; ?>
                        <tr>
                          <td>{{$i}}</td>
                          <td>{{$payment->flat->block->name}}</td>
                          <td>{{$payment->flat->name}}</td>
                          <td>{{$payment->flat->tanent ? $payment->flat->tanent->name : ''}}</td>
                          <td>{{$payment->flat->tanent ? '' : $payment->flat->owner->name}}</td>
                          <td>{{$payment->maintenance->from_date}}</td>
                          <td>{{$payment->maintenance->to_date}}</td>
                          <td>{{$payment->maintenance->amount}}</td>
                          <td>{{$payment->maintenance->due_date}}</td>
                          <td>{{$payment->late_fine}} <small>({{$payment->maintenance->late_fine_value}}-{{$payment->maintenance->late_fine_type}})</small></td>
                          <td>{{$payment->paid_amount}}</td>
                          <td>{{$payment->dues_amount}}</td>
                          <td>{{$payment->type}}</td>
                          <td>{{$payment->status}}</td>
                          <td>
                      <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#addModal" data-id="{{$payment->id}}" data-dues_amount="{{$payment->dues_amount}}" data-late_fine="{{$payment->late_fine}}" 
                      data-user_id="{{$payment->user_id}}" data-type="{{$payment->type}}" data-amount="{{$payment->paid_amount}}" data-status="{{$payment->status}}" data-building_id="{{$payment->building_id}}"
                      data-flat_id="{{$payment->flat_id}}" data-maintenance_id="{{$payment->maintenance_id}}"><i class="fa fa-edit"></i></button>
                      <!--@if($payment->deleted_at)-->
                      <!--<button class="btn btn-sm btn-success" data-toggle="modal" data-target="#deleteModal" data-id="{{$payment->id}}" data-action="restore"><i class="fa fa-undo"></i></button>-->
                      <!--@else-->
                      <!--<button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#deleteModal" data-id="{{$payment->id}}" data-action="delete"><i class="fa fa-trash"></i></button>-->
                      <!--@endif-->
                    </td>
                        </tr>
                        @empty
                        @endforelse
                      </tbody>
                    </table>
                    </div>
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
        <h5 class="modal-title" id="exampleModalLabel">Add New Payment</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="{{url('store-maintenance-payment')}}" method="post" class="add-form">
        @csrf
        <div class="modal-body">
          <div class="form-group">
            <label for="phone" class="col-form-label">Dues Amount:</label>
            <input type="text" name="dues_amount" class="form-control" id="dues_amount" placeholder="Dues Amount" required />
          </div>
          <div class="form-group">
            <label for="phone" class="col-form-label">Late Fine:</label>
            <input type="text" name="late_fine" class="form-control" id="late_fine" placeholder="Late Fine" required />
          </div>
          <div class="form-group">
            <label for="name" class="col-form-label">Payment Type:</label>
            <select name="type" class="form-control" id="type" required>
              <option value="Created">Created</option>
              <option value="Cash">Cash</option>
              <option value="Online">Online</option>
            </select>
          </div>
          <div class="form-group">
            <label for="phone" class="col-form-label">Paid Amount:</label>
            <input type="text" name="amount" class="form-control" id="amount" placeholder="Amount" required />
          </div>
          
          <div class="form-group">
            <label for="status" class="col-form-label">Status:</label>
            <select name="status" class="form-control" id="status">
              <option value="Paid">Paid</option>
              <option value="Unpaid">Unpaid</option>
            </select>
          </div>
          
          <input type="hidden" name="id" id="edit-id">
          <input type="hidden" name="user_id" id="user_id">
          <input type="hidden" name="maintenance_id" id="maintenance_id" value="">
          <input type="hidden" name="flat_id" id="flat_id" value="">
          <input type="hidden" name="building_id" id="building_id" value="">
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary" id="save-button">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

@section('script')


<script>
  $(document).ready(function(){
    var id = '';
    var action = '';
    var token = "{{csrf_token()}}";

    $('#addModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);
      var edit_id = button.data('id');
      $('#edit-id').val(edit_id);
      $('#dues_amount').val(button.data('dues_amount'));
      $('#late_fine').val(button.data('late_fine'));
      $('#amount').val(button.data('amount'));
      $('#status').val(button.data('status'));
      $('#type').val(button.data('type'));
      $('#flat_no').val(button.data('flat_no'));
      $('#user_id').val(button.data('user_id'));
      $('#building_id').val(button.data('building_id'));
      $('#flat_id').val(button.data('flat_id'));
      $('#maintenance_id').val(button.data('maintenance_id'));
      $('.modal-title').text('Add New Maintenace Payment');
      if(edit_id){
          $('.modal-title').text('Update Maintenace Payment');
      }
    });
    
    $(document).on('change','#block',function(){
      var block = $(this).val();
      $('.flat-id').html('');
        $.ajax({
          url : "{{url('get-flats')}}",
          url : url + block,
          type: "post",
          data : {'_token':token,'block':block},
          success: function(data)
          {
            $('.flat-id').html(data);
          }
        });
    });

    var block = $('#block').val();
    $.ajax({
          url : "{{url('get-flats/')}}",
          url : url + block,
          type: "post",
          data : {'_token':token,'block':block},
          success: function(data)
          {
            $('.flat-id').html(data);
          }
        });

  });
</script>
@endsection

@endsection



