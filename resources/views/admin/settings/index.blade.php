@extends('layouts.admin')

@section('title')
    Setting
@endsection

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Settings</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Setting</li>
            </ol>
          </div>
        </div>
      </div>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                Business Setting
              </div>
              <div class="card-body">
                @if(session()->has('success'))
                    <div class="alert alert-success">
                        {{ session()->get('success') }}
                    </div>
                @endif
                @if(session()->has('error'))
                    <div class="alert alert-danger">
                        {{ session()->get('error') }}
                    </div>
                @endif
                <form action="{{route('setting.store')}}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Razorpay Key</label>
                                <input type="text" class="form-control" name="razorpay_key" value="{{$setting->razorpay_key}}" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Razorpay Secret</label>
                                <input type="text" class="form-control" name="razorpay_secret" value="{{$setting->razorpay_secret}}" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>GST No</label>
                                <input type="text" class="form-control" name="gst_no" value="{{$setting->gst_no}}" required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Classified Limit(Within Building)</label>
                                <input type="number" class="form-control" name="classified_limit_within_building" value="{{$setting->classified_limit_within_building}}" disabled required>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label>Classified Limit(All Building)</label>
                                <input type="number" class="form-control" name="classified_limit_all_building" value="{{$setting->classified_limit_all_building}}" disabled required>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <input type="submit" class="btn btn-block bg-gradient-primary btn-flat" value="Save">
                        </div>
                    </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    

@section('script')

<script>
$(document).ready(function(){

});
</script>

@endsection

@endsection




