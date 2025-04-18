<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="csrf-token" content="Ml63mUEFyaGvIM0h52l8aZ6cEGkZ61t2Jw0t9jhv" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="Ml63mUEFyaGvIM0h52l8aZ6cEGkZ61t2Jw0t9jhv" />
    <title>Select Building | {{$setting->bussiness_name}}</title>
    <link rel="stylesheet" href="{{asset('public/admin/css/bootstrap.min.css')}}">
    <script src="{{asset('public/admin/js/jquery.min.js')}}"></script>
    <link rel="shortcut icon" href="{{asset('public/images/bussiness/'.$setting->favicon)}}">
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
        
        @media screen and (max-width: 468px) {
            video{width:100% !important;}
        }
    </style>


</head>

<body style="background-color:black;">
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-12 mt-2">
                <center>
                    <div>
                        <img src="{{$setting->logo}}" style="width:60%">
                    </div>
                    
                    <h3 class="text-white mt-5 mb-5">Select Any Building To Continue</h3>
                </center>
            </div>
            @forelse(Auth::User()->buildings as $building)
                <div class="col-lg-4 col-4">
                    <a href="{{url('select-building',$building->id)}}">
                    <div class="card">
                        <div class="card-body">
                            <center>
                                <h2>{{$building->name}}</h2>
                                <hr>
                                <p>City: {{$building->city->name}}</p>
                                <p>Address: {{$building->address}}</p>
                                <hr>
                            </center>
                            <br>
                            <p class="right">Continue....</p>
                        </div>
                    </div>
                    </a>
                </div>
                @empty
                @endforelse
        </div>
    </div>
    <script src="{{asset('public/admin/plugins/jquery/jquery.min.js')}}"></script>
    
</body>
</html>