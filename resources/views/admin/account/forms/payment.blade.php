@extends('layouts.admin')

@section('title')
    Expenditure Form 
@endsection

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Expenditure Form</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Create/Modify/Delete </li>
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
                  <form action="{{route('expense.store')}}" method="post" class="add-form" enctype="multipart/form-data">
                        @csrf
                        <div class="modal-body">
                        <div class="error"></div>
                        <div class="form-group">
                            <label for="name" class="col-form-label">Type:</label>
                            <select name="model" id="model" class="form-control" id="model" required>
                                <option value="Maintenance">Maintenance</option>
                                <option value="Event">Event</option>
                                <option value="Corpus">Corpus</option>
                                <option value="Booking">Booking</option>
                                <option value="Essential">Essential</option>
                            </select>
                        </div>
                        <div class="model-id"></div>

                        <div class="form-group">
                            <label for="name" class="col-form-label">Payment Type:</label>
                            <select name="payment_type" id="payment_type" class="form-control" id="payment_type" required>
                                <option value="Inhand">From Inhand</option>
                                <option value="InBank">From InBank</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-form-label">Reason:</label>
                            <textarea name="reason" id="reason" class="form-control" required></textarea>
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-form-label">Amount:</label>
                            <input type="text" name="amount" class="form-control" id="amount" placeholder="Amount" required>
                        </div>
                        <div class="form-group">
                            <label for="code" class="col-form-label">Bill Image:<image src="" id="image2" style="width:40px;"></image></label>
                            <input type="file" name="image" class="form-control" id="image" accept="image/*">
                        </div>
                        <div class="form-group">
                            <label for="code" class="col-form-label">Date:</label>
                            <input type="date" name="date" class="form-control" id="date" placeholder="Date" required>
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
            <div class="card">
              <div class="card-body">
                <div class="table-responsive">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>S No</th>
                    <th>Model Type</th>
                    <th>Model Name</th>
                    <th>Bill Number</th>
                    <th>Reason</th>
                    <th>Paid On</th>
                    <th>Payment Mode</th>
                  </tr>
                  </thead>
                  <tbody>
                    
                    <?php $i = 0; ?>
                  @forelse($expenses as $expense)
                  <?php $i++; ?>
                  <tr>
                    <td>{{$i}}</td>
                    <td>{{ $expense->model}}</td>
                    <td>{{$expense->model_id}}</td>
                    <td>{{$expense->bill_no}}</td>
                    <td>{{$expense->reason}}</td>
                    <td>{{$expense->created_at->format('d/m/Y')}}</td>
                    <td>{{$expense->payment_type}}</td>
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
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->



@section('script')


<script>
  $(document).ready(function(){
    var id = '';
    var action = '';
    var token = "{{csrf_token()}}";
    var model = "{{ request('model') }}";
    var model_id = "{{ request('model_id') }}";
    
    $(document).on('change','#model',function(){
      var model = $(this).val();
      $('.model-id').html('');
      if(model == 'Event' || model == 'Essential' || model == 'Booking'){
        $.ajax({
          url : "{{url('/get-model-data')}}",
          type: "post",
          data : {'_token':token,'model':model},
          success: function(data)
          {
            $('.model-id').html(data);
          }
        });
      }
    });

    if(model == 'Event' || model == 'Essential' || model == 'Booking'){
        $.ajax({
          url : "{{url('/get-model-data')}}",
          type: "post",
          data : {'_token':token,'model':model,'model_id':model_id},
          success: function(data)
          {
            $('.model-id').html(data);
          }
        });
      }

  });
</script>

<script src="{{asset('public/admin/plugins/summernote/summernote-bs4.min.js')}}"></script>

<script>
  $(function () {
    // Summernote
    $('#summernote').summernote()

  })
</script>

@endsection


@endsection