@extends('layouts.admin')

@section('title')
    Classified Details
@endsection

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Classified Details</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Classified Details</li>
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
                  <img class="profile-user-img img-fluid img-circle"
                       src="{{$classified->building->image}}"
                       alt="User profile picture">
                </div>
                <h3 class="profile-username text-center">{{$classified->category}}</h3>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>From Time</b> <a class="float-right">{{$classified->from_time}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>To Time</b> <a class="float-right">{{$classified->to_time}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Status</b> <a class="float-right">{{$classified->status}}</a>
                  </li>
                </ul>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col -->
          <div class="col-md-9">
              <div class="card">
                  <div class="card-header">
                      <span class="badge badge-default">{{$classified->category}}</span>
                      <span class="badge badge-primary">{{$classified->status}}</span>
                  </div>
                  <div class="card-body">
                      <p><b>{{$classified->desc}}</b></p>
                      <p>{{$classified->desc}}</p>
                      <div class="row">
                          @forelse($classified->photos as $photo)
                          <div class="col-md-4 d-flex align-items-center justify-content-center" style="border:1px solid #ddd;">
                          <img src="{{$photo->photo}}" class="img-fluid w-100">
                          </div>
                          @empty
                          @endforelse
                      </div>
                  </div>
              </div>
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

  });
</script>
@endsection

@endsection



