<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="{{asset('public/vendor/css/login.css')}}"/>
    <?php $setting = \App\Models\Setting::first(); ?>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>Reset Password</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
        body{font-family:Jost;}
        .password-icon{
            float: right;
            margin-top: -22px;
        }
    </style>
</head>
<body>
    <div class="main">

        <!-- Sign up form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="{{$setting->logo}}" alt="sing up image"></figure>
                        <a href="{{url('/')}}" class="signup-image-link">Login Here</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Reset Password</h2>
                        @if(session()->has('error'))
                            <div class="alert alert-danger">
                                {{ session()->get('error') }}
                            </div>
                        @endif
                        <form method="post" action="{{url('reset-password')}}" class="register-form" id="login-form">
                            @csrf
                            <input type="hidden" name="token" value="{{$password_reset->token}}">
                            <input type="hidden" name="email" value="{{$password_reset->email}}">
                            <div class="form-group">
                                <label for="your_pass"><i class="fa fa-envelope"></i></label>
                                <input type="email" name="old_email" value="{{$password_reset->email}}" disabled required>
                            </div>
                            
                            <div class="form-group">
                                <label for="pass"><i class="fa fa-lock"></i></label>
                                <input type="password" name="password" class="password" minlength="8" maxlength="14"id="pass" style="width:95%;"
                                placeholder="Password (must have 1 upper, 1 lower, 1 letter and 1 special character having minimum length of 8)" required/>
                                <a href="javascript:void(0)" class="show-password password-icon"><i class="fa fa-eye"></i></a>
                                <a href="javascript:void(0)" class="hide-password password-icon"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                            </div>
                                @if($errors->has('password'))
                                    <p style="color:red">{{ $errors->first('password') }}</p>
                                @endif
                            <div class="form-group">
                                <label for="re-pass"><i class="fa fa-lock"></i></label>
                                <div class="input-group">
                                    <input type="password" name="password_confirmation" class="password" minlength="8" maxlength="14" id="re_pass" style="width:95%;" placeholder="Repeat your password"/>
                                    <a href="javascript:void(0)" class="show-password password-icon"><i class="fa fa-eye"></i></a>
                                    <a href="javascript:void(0)" class="hide-password password-icon" style="display:none;"><i class="fa fa-eye-slash" aria-hidden="true"></i></a>
                                </div>
                            </div>
                            
                            <div class="form-group form-button">
                            	<input type="submit" id="signin" class="form-submit" value="Change Password"/>
                            </div>
                            
                        </form>
                        
                    </div>
                </div>
            </div>
        </section>
    </div>
    
        <!-- jQuery -->
    <script src="{{asset('public/admin/plugins/jquery/jquery.min.js')}}"></script>
    
    <script>
        $(document).ready(function(){
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
        })
        
    </script>
    
</body>
</html>