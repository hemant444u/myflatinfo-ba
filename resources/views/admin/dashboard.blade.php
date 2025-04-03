@extends('layouts.admin')

@section('title')
    Dashboard
@endsection

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Dashboard</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-6">
                    <a href="/">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>{{Auth::User()->building->blocks->count()}}</h3>
                            <p>Total Blocks</p>
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-lg-3 col-6">
                    <a href="/">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>{{Auth::User()->building->flats->count()}}</h3>
                            <p>Total Flats</p>
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-lg-3 col-6">
                    <a href="/">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>{{Auth::User()->building->events->count()}}</h3>
                            <p>Total Events</p>
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-lg-3 col-6">
                    <a href="/">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>{{Auth::User()->building->noticeboards->count()}}</h3>
                            <p>Total Noticeboards</p>
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-lg-3 col-6">
                    <a href="/">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>{{Auth::User()->building->classifieds->count()}}</h3>
                            <p>Total Classifieds</p>
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-lg-3 col-6">
                    <a href="/">
                    <div class="small-box bg-info">
                        <div class="inner">
                            <h3>{{Auth::User()->building->roles->count()}}</h3>
                            <p>Total Roles</p>
                        </div>
                    </div>
                    </a>
                </div>
                
            </div>
        </div>
    </section>

@section('script')

<script>
    
    $(document).ready(function(){
        var token = "{{csrf_token()}}";
        
        window.history.pushState(null, "", window.location.href);
        window.onpopstate = function () {
            window.history.pushState(null, "", window.location.href);
        };

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
    });
</script>
@endsection

@endsection