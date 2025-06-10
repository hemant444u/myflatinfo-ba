<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="csrf-token" content="Ml63mUEFyaGvIM0h52l8aZ6cEGkZ61t2Jw0t9jhv" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="Ml63mUEFyaGvIM0h52l8aZ6cEGkZ61t2Jw0t9jhv" />
    <title>Permission Denied | {{$setting->bussiness_name}}</title>
    <link rel="stylesheet" href="{{asset('admin/css/bootstrap.min.css')}}">
    <script src="{{asset('admin/js/jquery.min.js')}}"></script>
    <link rel="shortcut icon" href="{{asset('images/bussiness/'.$setting->favicon)}}">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style>
        @import  url('https://fonts.googleapis.com/css2?family=Questrial&display=swap');
        *{font-family:Jost;}
        .btn-custom{background-color:black;color:white;}
        .btn-custom:hover{background-color:black;color:white;}
        .btn-custom:after{background-color:black;color:white;}
        a{color:black;}
        a:hover{text-decoration:none;}
        .card{box-shadow: 0px 2px red;}
        .right{float:right;}
        @media screen and (max-width: 468px) {
            video{width:100% !important;}
        }
    </style>


</head>

<body style="background-color:grey;">
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-4 offset-md-4 mt-2">
                <center>
                    <div>
                        <img src="{{$setting->logo}}" style="width:60%">
                    </div>
                    @if(session()->has('error'))
                        <div class="alert alert-danger">
                            {{ session()->get('error') }}
                        </div>
                    @endif
                </center>
            </div>
            <div class="col-md-4 offset-md-4">
                <center>
                    <div class="card">
                        <div class="card-body">
                            <div class="box bg-red">
                                <h3>Permission Denied !</h3>
                                <p>You dont have permission to access this page</p>
                            </div>
                            <br>
                            <p><a href="{{url('/dashboard')}}">Back To Home</a></p>
                        </div>
                    </div>
                    </a>
                </center>
            </div>
        </div>
    </div>
    <script src="{{asset('admin/plugins/jquery/jquery.min.js')}}"></script>
    
</body>
</html>