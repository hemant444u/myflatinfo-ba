@extends('layouts.admin')

@section('title')
    Miscellaneous Receivables Form
@endsection

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Miscellaneous Receivables Form</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Miscellaneous Receivables Form</li>
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
                        <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="name" class="col-form-label">Type:</label>
                            <select name="model" id="model" class="form-control" id="model" required>
                                <option value="Maintenance">Maintenance</option>
                                <option value="Event">Event</option>
                                <option value="Corpus">Corpus</option>
                                <option value="Booking">Booking</option>
                                <option value="Essential">Essential</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                        <div class="model-id"></div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="name" class="col-form-label">Payment Type:</label>
                            <select name="payment_type" id="payment_type" class="form-control" id="payment_type" required>
                                <option value="InHand">InHand</option>
                                <option value="InBank">InBank</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="name" class="col-form-label">Reason:</label>
                            <textarea name="reason" id="reason" class="form-control" required></textarea>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="name" class="col-form-label">Amount:</label>
                            <input type="text" name="amount" class="form-control" id="amount" placeholder="Amount" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="code" class="col-form-label">Date:</label>
                            <input type="date" name="date" class="form-control" id="date" value="{{ old('date', now()->toDateString()) }}" placeholder="Date" required>
                        </div>
                        <input type="hidden" name="type" id="type" value="Credit">
                        <input type="hidden" name="id" id="edit-id">
                        </div>
                        <div>
                        <div class="form-row">
                          <div class="form-group col-md-6">
                            <button type="submit" class="btn btn-primary btn-block" id="save-button">Save</button>
                          </div>
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
                    <!-- <th>S No</th> -->
                    <th>Model Type</th>
                    <th>Model Name</th>
                    <th>Bill Number</th>
                    <th>Reason</th>
                    <th>Paid Amount</th>
                    <th>Paid On</th>
                    <th>Payment Mode</th>
                  </tr>
                  </thead>
                  <tbody>
                    
                    <?php $i = 0; ?>
                  @forelse($expenses as $expense)
                  <?php $i++; ?>
                  <tr>
                    <!-- <td>{{$i}}</td> -->
                    <td>{{ $expense->model}}</td>
                    <td>{{$expense->model_name}}</td>
                    <td>{{$expense->reciept_name}}</td>
                    <td>{{$expense->reason}}</td>
                    <td>{{$expense->amount}}</td>
                    <td>{{$expense->date}}</td>
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

      $(document).on('submit', '.add-form', function(e) {
        if (!confirm('Are you sure you want to submit this expense?')) {
          e.preventDefault(); // This will now correctly prevent form submission
        }
      });

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