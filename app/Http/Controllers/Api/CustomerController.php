<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Setting;
use App\Models\User;
use App\Models\Flat;
use App\Models\Noticeboard;
use App\Models\Event;
use App\Models\Classified;
use App\Models\Role;
use App\Models\Issue;
use App\Models\IssuePhoto;
use App\Models\Comment;
use App\Models\Reply;
use App\Models\Facility;
use App\Models\Timing;
use App\Models\Booking;
use App\Models\Visitor;
use App\Models\VisitorInout;
use App\Models\FamilyMember;
use App\Models\Guard;
use App\Models\Vehicle;
use App\Models\VehicleInout;
use App\Models\GatePass;
use App\Models\ClassifiedPhoto;
use App\Models\BuildingUser;
use App\Models\Gate;
use App\Models\Ad;
use App\Models\Parcel;
use App\Models\MaintenancePayment;
use App\Models\EssentialPayment;
use App\Models\Payment;
use App\Models\Order;
use App\Models\Transaction;
use App\Models\Essential;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Cache;

use DB;
use \Session;
use Mail;
use \Str;
use \Log;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;
use Razorpay\Api\Api;

use Illuminate\Support\Arr;


use \Hash;
use \Auth;

class CustomerController extends Controller
{
    public function __construct()
    {
        
        $rdata = Setting::findOrFail(1);
        $this->keyId = $rdata->razorpay_key;
        $this->keySecret = $rdata->razorpay_secret;
        $this->displayCurrency = 'INR';

        $this->api = new Api($this->keyId, $this->keySecret);
    }
    
    public function get_setting()
    {
        $setting = Setting::first();
        return response()->json([
            'setting' => $setting
        ],200); 
    }
    
    public function user_status()
    {
        $user = Auth::User();
        
        return response()->json([
            'profile_status' => $user->profile_status,
            'status' => $user->status,
        ],200); 
    }
    
    public function send_otp(Request $request)
    {
        $user = User::where('email',$request->email)->first();
        if($user){
            if($user->status == 'Active'){
                return response()->json([
                    'error' => 'You are already registerd with us, Please login'
                ],422);
            }else{
                $otp = rand(1000,9999);
                $user->otp = Hash::make($otp);
                $user->save();
                //Send email with OTP
                Mail::send([], [], function ($message) use ($user, $otp) {
                    $message->to($user->email)
                        ->subject('Sign up OTP')
                        ->setBody("Your OTP for signup is: $otp", 'text/html');
                });
                return response()->json([
                    'msg' => 'OTP has been sent successfully.'
                ],200);
            }
            
            
        }else{
            $user = new User();
        }
        $rules = [
            'email' => 'required|unique:users|email',
        ];
        
        $validation = \Validator::make( $request->all(), $rules );
        $error = $validation->errors()->first();
        if ($validation->fails()) {
            return response()->json([
                'error' => $validation->errors()->first()
            ], 422);
        }
        
        $user->role = 'customer';
        $otp = rand(1000,9999);
        $user->email = $request->email;
        $user->status = 'Pending';
        $user->otp = Hash::make($otp);
        $user->otp_status = 'Sent';
        $user->referal_code = 'TRT'.rand(100000,999999);
        $user->save();
        
        //Send email with OTP
        Mail::send([], [], function ($message) use ($user, $otp) {
            $message->to($user->email)
                ->subject('Sign up OTP')
                ->setBody("Your OTP for signup in Allons-Z is: $otp", 'text/html');
        });
        
            
        return response()->json([
            'msg' => 'OTP has been sent successfully.'
        ],200);
    }
    
    public function resend_otp(Request $request)
    {
        $rules = [
            'email' => 'required|email',
        ];
        $validation = \Validator::make( $request->all(), $rules );
        $error = $validation->errors()->first();
        if($error){
            return response()->json([
                'error' => $error
            ],422);
        }
        
        $user = User::where('email',$request->email)->first();
        if(!$user){
            return response()->json([
                'error' => 'This email is not registered with us'
            ],422);
        }
        
        $otp = rand(1000,9999);
        
        $info = array(
            'user' => Auth::User(),
            'otp' => $otp
        );
        Mail::send([], [], function ($message) use ($user, $otp) {
            $message->to($user->email)
                ->subject('Sign up OTP')
                ->setBody("Your OTP for Allons-Z is: $otp", 'text/html');
        });

        $user->otp = Hash::make($otp);
        $user->otp_status = 'Sent';
        $user->save();

        return response()->json([
            'msg' => 'OTP has been sent successfully.'
        ],200);
    }
    
    public function forget_password(Request $request)
    {
        $rules = [
            'email' => 'required|email|exists:users,email',
        ];
        $validation = \Validator::make( $request->all(), $rules );
        $error = $validation->errors()->first();
        if($error){
            return response()->json([
                'error' => $error
            ],422);
        }
        
        $user = User::where('email',$request->email)->first();
        if(!$user){
            return response()->json([
                'error' => 'This email is not registered with us'
            ],422);
        }
        
        $otp = rand(1000,9999);
        $setting = Setting::first();
        $logo = $setting->logo;
        $info = array(
            'user' => $user,
            'otp' => $otp,
            'logo' => $logo
        );
        Mail::send('email.forget_password2', $info, function ($message) use ($user)
        {
            $message->to($user->email, $user->name)
            ->subject('Allons-Z Forget Password');
        });

        $user->otp = Hash::make($otp);
        $user->otp_status = 'Sent';
        $user->save();

        return response()->json([
            'msg' => 'OTP has been sent successfully.'
        ],200);
    }
    
    public function verify_otp(Request $request)
    {
        
        $rules = [
            'email' => 'required|email',
            'otp' => 'required|numeric|digits:4',
        ];
        $validation = \Validator::make( $request->all(), $rules );
        $error = $validation->errors()->first();
        if($error){
            return response()->json([
                'error' => $error
            ],422);
        }
        $user = User::where('email',$request->email)->first();
        if($user){
            if (Hash::check($request->otp, $user->otp)) {
                if($user->otp_status == 'Sent'){
                    $user->otp_status = 'Verified';
                    $token = $user->createToken('MyApp')->accessToken;
                    $user->api_token = $token;
                    $user->device_token = $request->device_token;
                    $user->save();
                    Auth::login($user, true);
                    return response()->json([
                        'token' => $token,
                        'msg' => 'OTP verified successfully.'
                    ],200);
                }
                return response()->json([
                        'error' => 'This OTP has already been used. Please request a new OTP'
                ],422);
                
            }
        }
        return response()->json([
                'error' => 'Invalid email or OTP.'
        ],422);
    }
    
    public function update_password(Request $request)
    {
        $rules = [
            'password' => [
                'required',
                'string',
                'max:16',
                'min:8',             // must be at least 8 characters in length
                'regex:/[a-z]/',      // must contain at least one lowercase letter
                'regex:/[A-Z]/',      // must contain at least one uppercase letter
                'regex:/[0-9]/',      // must contain at least one digit
                'regex:/[@$!%*#?&]/', // must contain a special character
                'regex:/^\S*$/',      // Must not contain spaces
                'confirmed',
            ],
        ];

        $validation = \Validator::make( $request->all(), $rules );
        $error = $validation->errors()->first();
        if($error){
            return response()->json([
                'error' => $error
            ],422);
        }
        
        $user = Auth::User();
        
        if($user){
            $user->password = Hash::make($request->password);
            $user->status = 'Active';
            $user->save();
            return response()->json([
                'msg' => 'Password updated.'
            ],200);
        }
        return response()->json([
                'error' => 'User not found.'
        ],422);
    }

    public function login(Request $request)
    {
        $rules = [
            
            'email' => 'required|email',
            'password' => [
                'required',
            ],
        ];

        $validation = \Validator::make( $request->all(), $rules );
        $error = $validation->errors()->first();
        if($error){
            return response()->json([
                'error' => $error
            ],422);
        }
        
        $user = User::where('email',$request->email)->where('role','user')->first();
        
        if($user){
            if (Hash::check($request->password, $user->password)) {
                $token = $user->createToken('MyApp')->accessToken;
                $user->api_token = $token;
                $user->device_token = $request->device_token;
                $user->save();
                Auth::login($user, true);
                return response()->json([
                    'token' => $token,
                    'msg' => 'Login Successfull.'
                ],200);
            }else{
                return response()->json([
                    'error' => 'Invalid Password'
                ],422);
            }
        }
        return response()->json([
            'error' => 'This email is not registered with us'
        ],422);
    }

    public function profile(Request $request)
    {
        $user = Auth::User();
        $flat = $user->flat;
        $block = $flat->block;
        $family_members = $flat->family_members;
        $vehicles = $flat->vehicles;
        return response()->json([
            'user' => $user,
        ],200);
    }
    
    public function update_profile(Request $request)
    {
        $user = Auth::user();

        $rules = [
            'first_name' => 'required|string|max:255|regex:/^[A-Z][a-z]*$/',
            'last_name' => 'required|string|max:255|regex:/^[A-Z][a-z]*$/',
            'phone' => 'required|unique:users,phone,' . $user->id . '|regex:/^([0-9\s\-\+\(\)]*)$/|size:10',
            'gender' => 'required|in:Male,Female,Other',
            'city_id' => 'required|exists:cities,id|numeric',
            'address' => 'required|string|min:4',
            'pincode' => 'required|numeric|digits:6|',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }

        if($request->hasFile('photo')) {
            $file= $request->file('photo');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($user->getPhotoFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/profiles/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $user->photo = $filename;
        }
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->phone = $request->phone;
        $user->gender = $request->gender;
        $user->city_id = $request->city_id;
        $user->address = $request->address;
        $user->pincode = $request->pincode;
        $user->save();
    
        return response()->json([
            'msg' => 'Profile updated successfully',
            'user' => $user
        ], 200);
    }
    
    public function change_password(Request $request)
    {
        $user = Auth::user();
        $rules = [
            'old_password' => 'required',
            'password' => [
                'required',
                'string',
                'max:16',
                'min:8',             // must be at least 8 characters in length
                'regex:/[a-z]/',      // must contain at least one lowercase letter
                'regex:/[A-Z]/',      // must contain at least one uppercase letter
                'regex:/[0-9]/',      // must contain at least one digit
                'regex:/[@$!%*#?&]/', // must contain a special character
                'regex:/^\S*$/',      // Must not contain spaces
                'confirmed',
            ],
            
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        if (Hash::check($request->old_password, $user->password)) {
            $user->password = Hash::make($request->password);
            $user->save();
            return response()->json([
                'msg' => 'Password updated.'
            ],200);
        }
        
        return response()->json([
                'msg' => 'Invalid old password.'
            ],200);
    }
    
    public function get_flats(Request $request)
    {
        $user = Auth::User();
        $flats = Flat::where('tanent_id',$user->id)->orWhere('owner_id',$user->id)->with(['block','building'])->get();
        return response()->json([
            'flats' => $flats
        ], 200);
    }
    public function select_flat(Request $request)
    {
        $rules = [
            'flat_id' => 'required|exists:flats,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $user->flat_id = $request->flat_id;
        $user->save();
        
        $flat = $user->flat->with(['block','building'])->get();
        
        return response()->json([
            'flat' => $flat,
            'msg' => 'Flat selected successfully'
        ], 200);
    }
    
    public function get_noticeboards(Request $request)
    {
        $flat = Auth::user()->flat;
        $currentTime = now(); // Get current date and time
    
        $noticeboards = Noticeboard::where('building_id', $flat->building_id)
            ->where('from_time', '<=', $currentTime)
            ->where('to_time', '>=', $currentTime)
            ->get();
        return response()->json([
                'noticeboards' => $noticeboards
        ],200);
    }
    
    public function get_ads(Request $request)
    {
        $flat = Auth::user()->flat;
        $currentTime = now(); // Get current date and time
    
        $ads = Ad::where('status','Active')->get();
        return response()->json([
                'ads' => $ads
        ],200);
    }
    
    public function get_events(Request $request)
    {
        $flat = Auth::user()->flat;
        $currentTime = now(); // Get current date and time
    
        $events = Event::where('building_id', $flat->building_id)
            ->where('from_time', '<=', $currentTime)
            ->where('to_time', '>=', $currentTime)
            ->where('status','Active')
            ->with('building.user')
            ->get();
        return response()->json([
                'events' => $events
        ],200);
    }
    
    public function get_classifieds(Request $request)
    {
        $flat = Auth::user()->flat;
        $currentTime = now(); // Get current date and time
    
        $classifieds = Classified::where('status', 'Approved')
        ->where(function ($query) use ($flat) {
            $query->where('building_id', $flat->building_id)
                  ->orWhere('category', 'All Buildings');
        })
        ->with(['user','photos', 'building', 'block', 'flat'])
        ->get();
        return response()->json([
                'classifieds' => $classifieds
        ],200);
    }
    
    public function my_classifieds(Request $request)
    {
        $user = Auth::user();
        $currentTime = now(); // Get current date and time
    
        $classifieds = Classified::where('user_id', $user->id)->with(['photos','user'])->get();
        return response()->json([
                'classifieds' => $classifieds
        ],200);
    }
    
    public function create_classified(Request $request)
    {
        $rules = [
            'classified_id' => 'nullable|exists:classifieds,id',
            'title' => 'required',
            'desc' => 'required',
            'category' => 'required',
            'photos' => 'nullable|array',
            'photos.*' => 'image|max:2048',
        ];
        $validation = \Validator::make($request->all(), $rules);
    
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        
        $msg = 'Classified added Susccessfully';
        $classified = new Classified();
    
        if ($request->classified_id) {
            $classified = Classified::withTrashed()->find($request->classified_id);
            $msg = 'Classified updated Susccessfully';
        }
        
        $user = Auth::user();
        $flat = $user->flat;
        $classified->building_id = $flat->building_id;
        $classified->block_id = $flat->block_id;
        $classified->flat_id = $flat->id;
        $classified->category = $request->category;
        $classified->user_id = $user->id;
        $classified->title = $request->title;
        $classified->desc = $request->desc;
        $classified->status = 'Pending';
        $classified->save();
        
        if ($request->hasFile('photos')) {
            foreach ($request->file('photos') as $file) {
                $allowedfileExtension=['jpeg','jpeg','png'];
                $extension = $file->getClientOriginalExtension();
                // Storage::disk('s3')->delete($photo->getPhotoFilenameAttribute());
                $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                $filename = 'images/classifieds/' . uniqid() . '.' . $extension;
                Storage::disk('s3')->put($filename, file_get_contents($file));
                $photo = new ClassifiedPhoto();
                $photo->classified_id = $classified->id;
                $photo->photo = $filename;
                $photo->save();
            }
        }
        return response()->json([
                'msg' => $msg
        ],200);
    }
    
    public function delete_classified_photo(Request $request)
    {
        $rules = [
            'classified_photo_id' => 'required|exists:classified_photos,id',
        ];
        $validation = \Validator::make($request->all(), $rules);
    
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $classified_photo = ClassifiedPhoto::find($request->classified_photo_id);
        Storage::disk('s3')->delete($classified_photo->getPhotoFilenameAttribute());
        $classified_photo->delete();
        return response()->json([
                'msg' => 'Classified photo deleted successfully'
        ],200);
        
    }
    
    public function delete_classified(Request $request)
    {
        $rules = [
            'classified_id' => 'nullable|exists:classifieds,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ], 422);
        }
        $user = Auth::User();
        $classified = Classified::find($request->classified_id);
        foreach($classified->photos as $photo){
            Storage::disk('s3')->delete($photo->getPhotoFilenameAttribute());
        }
        $classified->delete();
        return response()->json([
                'msg' => 'Classified deleted successfully'
        ],200);
    }
    
    public function get_departments(Request $request)
    {
        $flat = Auth::user()->flat;

        $departments = Role::where('building_id', $flat->building_id)->get();
        return response()->json([
                'departments' => $departments
        ],200);
    }
    
    public function get_staff_directory(Request $request)
    {
        $flat = Auth::user()->flat;
        $building_users = BuildingUser::where('building_id', $flat->building_id)
        ->with([
            'role:id,name,slug',
            'user:id,first_name,last_name,email,phone,photo'
        ])
        ->get(['id', 'role_id', 'user_id']);
        return response()->json([
                'staffs' => $building_users
        ],200);
    }
    
    public function raise_an_issue(Request $request)
    {
        $rules = [
            'desc' => 'required',
            'photos' => 'required|array',
            'photos.*' => 'image|max:2048',
            'periority' => 'required',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $flat = Auth::user()->flat;
        $issue = new Issue();
        $issue->building_id = $flat->building_id;
        $issue->role_id = $request->department_id;
        $issue->block_id = $flat->block_id;
        $issue->flat_id = $flat->id;
        $issue->desc = $request->desc;
        $issue->periority = $request->periority;
        $issue->status = 'Pending';
        $issue->save();
        
        $uploadedPhotos = [];
    
        if ($request->hasFile('photos')) {
            foreach ($request->file('photos') as $file) {
                $allowedfileExtension=['jpeg','jpeg','png'];
                $extension = $file->getClientOriginalExtension();
                // Storage::disk('s3')->delete($photo->getPhotoFilenameAttribute());
                $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                $filename = 'images/issues/' . uniqid() . '.' . $extension;
                Storage::disk('s3')->put($filename, file_get_contents($file));

                $photo = new IssuePhoto();
                $photo->issue_id = $issue->id;
                $photo->photo = $filename;
                $photo->save();
            }
        }
        
        return response()->json([
                'msg' => 'Issue created successfully'
        ],200);
    }
    
    public function user_issues(Request $request)
    {
        $rules = [
            'status' => 'required|in:Pending,Ongoing,Solved,Rejected,All',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ],422);
        }
        $flat = Auth::user()->flat;
        if($request->status == 'All'){
            $issues = Issue::where('flat_id', $flat->id)->with(['department','photos','comments.replies'])->get();
        }else{
            $issues = Issue::where('flat_id', $flat->id)->where('status',$request->status)->with(['department','photos','comments.replies'])->get();
        }
        return response()->json([
                'issues' => $issues
        ],200);
    }
    
    public function get_solved_issue(Request $request)
    {
        $flat = Auth::user()->flat;

        $issues = Issue::where('flat_id', $flat->id)->where('status','Solved')->with(['department','comments.replies'])->get();
        return response()->json([
                'issues' => $issues
        ],200);
    }
    
    public function add_comment(Request $request)
    {
        $rules = [
            'issue_id' => 'required|exists:issues,id',
            'text' => 'required',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ],422);
        }
        $comment = new Comment();
        $comment->issue_id = $request->issue_id;
        $comment->user_id = Auth::id();
        $comment->text = $request->text;
        $comment->save();
        return response()->json([
                'comment' => $comment,
                'msg' => 'Comment added successfully'
        ],200);
    }
    
    public function add_reply(Request $request)
    {
        $rules = [
            'comment_id' => 'required|exists:comments,id',
            'text' => 'required',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ],422);
        }
        
        $reply = new Reply();
        $reply->comment_id = $request->comment_id;
        $reply->user_id = Auth::id();
        $reply->text = $request->text;
        $reply->save();
        return response()->json([
                'reply' => $reply,
                'msg' => 'Reply addedd successfully'
        ],200);
    }
    
    public function get_facilities(Request $request)
    {
        $flat = Auth::user()->flat;

        $facilities = Facility::where('building_id', $flat->building_id)->where('status','Active')->get();
        return response()->json([
                'facilities' => $facilities
        ],200);
    }
    
    public function get_facility_timings(Request $request)
{
    $rules = [
        'date' => 'required|date',
        'facility_id' => 'required|exists:facilities,id',
    ];
    $validation = \Validator::make($request->all(), $rules);

    if ($validation->fails()) {
        return response()->json([
            'status' => 'error',
            'error' => $validation->errors()->first()
        ], 422);
    }

    $date = Carbon::parse($request->date);
    $facility_id = $request->facility_id;
    $today = Carbon::today(); // Get today's date

    // Get facility details
    $facility = Facility::find($facility_id);
    if (!$facility) {
        return response()->json(['status' => 'error', 'error' => 'Facility not found'], 404);
    }
    $max_members = $facility->max_booking;

    // Get all active timings
    $allTimings = Timing::where('facility_id', $facility_id)
                        ->where('status', 'Active')
                        ->get();

    if ($allTimings->isEmpty()) {
        Log::info('No active timings found for facility ID: ' . $facility_id);
        return response()->json([], 200);
    }

    // Get first and last date of the month
    $startDate = max($date->startOfMonth(), $today); // Ensure the start date is not in the past
    $endDate = $date->endOfMonth();

    // Fetch bookings for the month
    $bookedMembersPerTiming = Booking::where('facility_id', $facility_id)
        ->whereBetween('date', [$startDate->toDateString(), $endDate->toDateString()])
        ->groupBy('date', 'timing_id')
        ->selectRaw('date, timing_id, SUM(members) as total_members')
        ->get()
        ->groupBy('date');

    Log::info('Booked Members:', $bookedMembersPerTiming->toArray());

    // Generate slot data for each date in the month
    $availableData = [];
    for ($day = 1; $day <= $date->daysInMonth; $day++) {
        $currentDate = $date->copy()->startOfMonth()->addDays($day - 1);

        // Skip past dates
        if ($currentDate->lt($today)) {
            continue;
        }

        $formattedDate = $currentDate->format('d-m-Y');
        
        Log::info('Processing Date:', ['date' => $formattedDate]);

        $dailyBookings = $bookedMembersPerTiming[$currentDate->toDateString()] ?? collect();

        $slotTimeArray = $allTimings->map(function ($timing) use ($dailyBookings, $max_members) {
            $bookedMembers = $dailyBookings->firstWhere('timing_id', $timing->id)['total_members'] ?? 0;
            $availableSlots = max($max_members - $bookedMembers, 0);

            if ($availableSlots > 0) {
                return [
                    'id' => $timing->id,
                    'slotTimeStartToEnd' => Carbon::parse($timing->from)->format('h:i A') . ' to ' . Carbon::parse($timing->to)->format('h:i A'),
                ];
            }
            return null;
        })->filter()->values();

        if ($slotTimeArray->isNotEmpty()) {
            $availableData[] = [
                'id' => Str::uuid()->toString(),
                'slotDate' => $formattedDate,
                'slotTimeArray' => $slotTimeArray,
            ];
        }
    }

    return response()->json($availableData, 200);
}


    public function book_facility(Request $request)
    {
        $rules = [
            'date' => 'required|date',
            'facility_id' => 'required|exists:facilities,id',
            'timing_ids' => 'required|array',
            'timing_ids.*' => 'exists:timings,id',
            'members' => 'required|integer|min:1',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ], 422);
        }
    
        $date = $request->date;
        $facility_id = $request->facility_id;
        $timing_ids = $request->timing_ids; // Array of timing IDs
        $members = $request->members;
        $user_id = Auth::id();
    
        // Get facility's max_booking limit
        $facility = Facility::find($facility_id);
        $max_members = $facility->max_booking;
    
        // Get total booked members per timing
        $bookedMembersPerTiming = Booking::where('facility_id', $facility_id)
            ->where('date', $date)
            ->groupBy('timing_id')
            ->selectRaw('timing_id, SUM(members) as total_members')
            ->pluck('total_members', 'timing_id')
            ->toArray();
    
        // Check if there are enough available slots for each requested timing
        $unavailableTimings = [];
        foreach ($timing_ids as $timing_id) {
            $bookedMembers = $bookedMembersPerTiming[$timing_id] ?? 0;
            $availableSlots = $max_members - $bookedMembers;
    
            if ($members > $availableSlots) {
                $unavailableTimings[] = $timing_id;
            }
        }
    
        if (!empty($unavailableTimings)) {
            return response()->json([
                'status' => 'error',
                'error' => 'Not enough available slots for timings: ' . implode(', ', $unavailableTimings)
            ], 409); // Conflict status code
        }
    
        // Create bookings for all available timings
        foreach ($timing_ids as $timing_id) {
            $booking = new Booking();
            $booking->facility_id = $facility_id;
            $booking->timing_id = $timing_id;
            $booking->date = $date;
            $booking->user_id = $user_id;
            $booking->members = $members;
            $booking->building_id = Auth::User()->flat->building_id;
            $booking->status = 'Success';
            $booking->save();
        }
    
        return response()->json([
            'status' => 'success',
            'msg' => 'All selected timings booked successfully'
        ], 200);
    }

    
    public function my_bookings(Request $request)
    {
        $user = Auth::User();
        $flat = $user->flat;
        $bookings = Booking::where('user_id',$user->id)->where('building_id',$flat->building_id)->with(['facility','timing'])->get();
        return response()->json([
                'bookings' => $bookings
        ],200);
    }
    
    public function create_visitor(Request $request)
    {
        $rules = [
            'total_members' => 'required|integer|min:1',
            'head_name' => 'required',
            'head_phone' => 'required',
            'head_photo' => 'required|image',
            'stay_from' => 'required',
            'stay_to' => 'required',
            'visiting_purpose' => 'required',
            'type' => 'required|in:Planned,Unplanned',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ], 422);
        }
        
        $user = Auth::User();
        $flat = $user->flat;
        if($request->flat_id){
            $flat = Flat::find($request->flat_id);
        }
        if($request->visitor_id){
            $visitor = Visitor::find($request->visitor_id);
        }else{
            $visitor = new Visitor();
            do {
                $code = Str::random(10);
            } while (\App\Models\GatePass::where('code', $code)->exists());
            $visitor->code = $code;
        }
        
        if($request->hasFile('head_photo')) {
            $file= $request->file('head_photo');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($visitor->getHeadPhotoFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/visitors/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $visitor->head_photo = $filename;

        }
        
        $visitor->user_id = $user->id;
        $visitor->building_id = $flat->building_id;
        $visitor->flat_id = $flat->id;
        $visitor->block_id = $flat->block_id;
        $visitor->total_members = $request->total_members;
        $visitor->head_name = $request->head_name;
        $visitor->head_phone = $request->head_phone;
        $visitor->stay_from = $request->stay_from;
        $visitor->stay_to = $request->stay_to;
        $visitor->visiting_purpose = $request->visiting_purpose;
        $visitor->type = $request->type;
        if($request->type == 'Planned'){
            $visitor->status = 'AllowIn';
        }
        $visitor->save();
        
        return response()->json([
                'visitor' => $visitor,
                'msg' => 'Visitor added successfully'
        ],200);
    }
    
    public function resend_visitor_request(Request $request)
    {
        $rules = [
            'visitor_id' => 'required|exists:visitors,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ], 422);
        }
        $visitor = Visitor::find($request->visitor_id);
        return response()->json([
                'visitor' => $visitor,
                'msg' => 'Visitor request sent successfully'
        ],200);
        
    }
    
    public function create_gate_pass(Request $request)
    {
        $rules = [
            'visitor_id' => 'required|exists:visitors,id',
            'desc' => 'required',
            'image' => 'required|image|max:2048',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ], 422);
        }
        
        $visitor = Visitor::find($request->visitor_id);
        $gate_pass = new GatePass();
        if($request->hasFile('image')) {
            $file= $request->file('image');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($gate_pass->getImageFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/gate_pass/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $gate_pass->image = $filename;
        }
        $gate_pass->user_id = Auth::User()->id;
        $gate_pass->visitor_id = $visitor->id;
        $gate_pass->flat_id = $visitor->flat_id;
        $gate_pass->building_id = $visitor->building_id;
        $gate_pass->desc = $request->desc;
        do {
            $code = Str::random(10);
        } while (\App\Models\GatePass::where('code', $code)->exists());
        $gate_pass->code = $code;
        $gate_pass->save();
        
        return response()->json([
                'gate_pass' => $gate_pass,
                'msg' => 'Gate pass created successfully'
        ],200);
    }
    
    public function get_gate_passes(Request $request)
    {
        $rules = [
            'status' => 'required|in:Approved,Rejected,Recheck,Completed',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ], 422);
        }
        $gate_passes = GatePass::where('user_id',Auth::User()->id)->where('status',$request->status)->with(['user','visitor','building','flat.block'])->get();
        return response()->json([
                'gate_passes' => $gate_passes,
        ],200);
    }
    
    public function take_gate_pass_action(Request $request)
    {
        $rules = [
            'gate_pass_id' => 'required|exists:gate_passes,id',
            'status' => 'required|in:Approved,Rejected,Completed',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ], 422);
        }
        $gate_pass = GatePass::find($request->gate_pass_id);
        $gate_pass->status = $request->status;
        $gate_pass->save();
        return response()->json([
            'msg' => 'Gate pass status updated'
        ], 200);
    }
    
    public function my_visitor_in_out_history(Request $request)
    {
        $visitor_inouts = Auth::User()->flat->visitor_inouts()->with('visitor')->get();
        return response()->json([
            'visitor_inouts' => $visitor_inouts
        ], 200);
    }
    
    public function create_family_member(Request $request)
    {
        $rules = [
            'name' => 'required',
            'phone' => 'required',
            'photo' => 'nullable|image|max:2048',
            'relationship' => 'required',
            'family_member_id' => 'nullable|exists:family_members,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ], 422);
        }
        
        $user = Auth::User();
        $flat = $user->flat;
        $family_member = new FamilyMember();
        $msg = 'Family member added successfully';
        if($request->family_member_id){
            $family_member = FamilyMember::find($request->family_member_id);
            $msg = 'Family member updated successfully';
        }
        if($request->hasFile('photo')) {
            $file= $request->file('photo');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($family_member->getPhotoFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/family_members/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $family_member->photo = $filename;
        }
        $family_member->user_id = $user->id;
        $family_member->building_id = $flat->building_id;
        $family_member->flat_id = $flat->id;
        $family_member->name = $request->name;
        $family_member->phone = $request->phone;
        $family_member->relationship = $request->relationship;
        $family_member->save();
        
        return response()->json([
                'family_member' => $family_member,
                'msg' => $msg
        ],200);
    }
    
    public function delete_family_member(Request $request)
    {
        $rules = [
            'family_member_id' => 'nullable|exists:family_members,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ], 422);
        }
        $user = Auth::User();
        $flat = $user->flat;
        $family_member = FamilyMember::where('flat_id',$flat->id)->where('id',$request->family_member_id)->first();
        $family_member->delete();
        return response()->json([
                'msg' => 'Family member deleted successfully'
        ],200);
    }
    
    public function my_family_members(Request $request)
    {
        $user = Auth::User();
        $flat = $user->flat;
        $family_members = FamilyMember::where('flat_id',$flat->id)->get();
        return response()->json([
                'family_members' => $family_members
        ],200);
    }
    
    public function maintenance_payments(Request $request)
    {
        $user = Auth::User();
        $maintenance_payments = MaintenancePayment::where('user_id',$user->id)->with(['maintenance','flat.owner','flat.tanent','flat.block','flat.building','reciept'])->orderBy('id','desc')->get();
        return response()->json([
                'maintenance_payments' => $maintenance_payments
        ],200);
    }
    
    public function create_maintenance_payment_order(Request $request)
    {
        $rules = [
            'maintenance_payment_id' => 'required|exists:maintenance_payments,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $flat = $user->flat;
        $maintenance_payment = MaintenancePayment::find($request->maintenance_payment_id);
        $item_name = 'Maintenance Payment';
        $item_number = $maintenance_payment->id;
        $item_amount = $maintenance_payment->dues_amount;

        $orderData = [
            'receipt'         => $item_number,
            'amount'          => $item_amount * 100, // 2000 rupees in paise
            'currency'        => 'INR',
            'payment_capture' => 1 // auto capture
        ];
        
        $razorpayOrder = $this->api->order->create($orderData);
        $razorpayOrderId = $razorpayOrder['id'];
        $displayAmount = $amount = $orderData['amount'];
                    
        if ($this->displayCurrency !== 'INR')
        {
            $url = "https://api.fixer.io/latest?symbols=$this->displayCurrency&base=INR";
            $exchange = json_decode(file_get_contents($url), true);
                    
            $displayAmount = $exchange['rates'][$this->displayCurrency] * $amount / 100;
        }
                    
        $data = [
            "key"               => $this->keyId,
            "amount"            => $amount,
            "name"              => $item_name,
            "description"       => $item_name,
            "prefill"           => [
    			"name"              => $user->name,
    			"email"             => $user->email,
    			"contact"           => $user->phone,
            ],
            "notes"             => [
				"address"           => $user->address,
				"merchant_order_id" => $item_number,
            ],
            "theme"             => [
				"color"             => "#3399cc"
            ],
            "order_id"          => $razorpayOrderId,
        ];
                    
        if ($this->displayCurrency !== 'INR')
        {
            $data['display_currency']  = $this->displayCurrency;
            $data['display_amount']    = $displayAmount;
        }
                    
        $displayCurrency = $this->displayCurrency;
        
        $order = new Order();
        $order->user_id = $user->id;
        $order->order_id = $razorpayOrderId;
        $order->model = 'MaintenancePayment';
        $order->model_id = $maintenance_payment->id;
        $order->flat_id = $maintenance_payment->flat_id;
        $order->desc = 'Creating order for maintenance payment from '.$maintenance_payment->from_date. ' to '.$maintenance_payment->to_date;
        $order->amount = $maintenance_payment->dues_amount;
        $order->status = 'Created';
        $order->save();
        
        return response()->json([
                'data' => $data,
                'displayCurrency' => $displayCurrency
        ],200);
    }
    
    public function verify_maintenance_payment_signature(Request $request)
    {
        $rules = [
            'razorpay_order_id' => 'required',
            'razorpay_payment_id' => 'required',
            'razorpay_signature' => 'required',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $order = Order::where('order_id',$request->razorpay_order_id)->where('status','Created')->first();
        if(!$order){
            return response()->json([
                    'error' => 'Order id not found',
            ],422);
        }
        $success = true;
        $error = "Payment Failed";
        
        $razorpay_order_id = $request->razorpay_order_id;
        $razorpay_payment_id = $request->razorpay_payment_id;
        $razorpay_signature = $request->razorpay_signature;
        
        try{
            $attributes = array(
                'razorpay_order_id' => $razorpay_order_id,
                'razorpay_payment_id' => $razorpay_payment_id,
                'razorpay_signature' => $razorpay_signature
            );
        
            $this->api->utility->verifyPaymentSignature($attributes);
            
        }
        catch(SignatureVerificationError $e){
            $success = false;
            $error = 'Razorpay Error : ' . $e->getMessage();
            return response()->json([
                    'error' => $error
            ],400);
        }

        if ($success === true)
        {
            $razorpayOrder = $this->api->order->fetch($razorpay_order_id);
            $reciept = $razorpayOrder['receipt'];
            $transaction_id = $razorpay_payment_id;
            
            $order->payment_id = $razorpay_payment_id;
            $order->signature = $razorpay_signature;
            $order->status = 'Verified';
            $order->save();
            
            $transaction = new Transaction();
            $transaction->user_id = $user->id;
            $transaction->order_id = $order->order_id;
            $transaction->model = $order->model;
            $transaction->model_id = $order->model_id;
            $transaction->type = 'Credit';
            $transaction->payment_type = 'Razorpay';
            $transaction->amount = $order->amount;
            $transaction->reciept_no = 'RCP'.rand(10000000,99999999);
            $transaction->desc = 'Maintenance Payment Order Verified '.$order->order_id;
            $transaction->status = 'Success';
            $transaction->save();
            
            $maintenance_payment = MaintenancePayment::find($order->model_id);
            $maintenance_payment->paid_amount = $order->amount;
            $maintenance_payment->dues_amount = $maintenance_payment->maintenance->amount - $order->amount;
            $maintenance_payment->type = 'Razorpay';
            $maintenance_payment->status = 'Paid';
            $maintenance_payment->save();
            
            
            return response()->json([
                    'message' => 'Payment completed! You can now download or view your reciept'
            ],200);

        }
        else
        {
            return response()->json([
                    'error' => $error
            ],422);
        }
    }
    
    public function essential_payments(Request $request)
    {
        $user = Auth::User();
        $essential_payments = EssentialPayment::where('user_id',$user->id)->with(['essential','flat.owner','flat.tanent','flat.block','flat.building','reciept'])->orderBy('id','desc')->get();
        return response()->json([
                'essential_payments' => $essential_payments
        ],200);
    }
    
    public function create_essential_payment_order(Request $request)
    {
        $rules = [
            'essential_payment_id' => 'required|exists:essential_payments,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $flat = $user->flat;
        $essential_payment = EssentialPayment::find($request->essential_payment_id);
        $item_name = 'Essential Payment';
        $item_number = $essential_payment->id;
        $item_amount = $essential_payment->dues_amount;

        $orderData = [
            'receipt'         => $item_number,
            'amount'          => $item_amount * 100, // 2000 rupees in paise
            'currency'        => 'INR',
            'payment_capture' => 1 // auto capture
        ];
        
        $razorpayOrder = $this->api->order->create($orderData);
        $razorpayOrderId = $razorpayOrder['id'];
        $displayAmount = $amount = $orderData['amount'];
                    
        if ($this->displayCurrency !== 'INR')
        {
            $url = "https://api.fixer.io/latest?symbols=$this->displayCurrency&base=INR";
            $exchange = json_decode(file_get_contents($url), true);
                    
            $displayAmount = $exchange['rates'][$this->displayCurrency] * $amount / 100;
        }
                    
        $data = [
            "key"               => $this->keyId,
            "amount"            => $amount,
            "name"              => $item_name,
            "description"       => $item_name,
            "prefill"           => [
    			"name"              => $user->name,
    			"email"             => $user->email,
    			"contact"           => $user->phone,
            ],
            "notes"             => [
				"address"           => $user->address,
				"merchant_order_id" => $item_number,
            ],
            "theme"             => [
				"color"             => "#3399cc"
            ],
            "order_id"          => $razorpayOrderId,
        ];
                    
        if ($this->displayCurrency !== 'INR')
        {
            $data['display_currency']  = $this->displayCurrency;
            $data['display_amount']    = $displayAmount;
        }
                    
        $displayCurrency = $this->displayCurrency;
        
        $order = new Order();
        $order->user_id = $user->id;
        $order->order_id = $razorpayOrderId;
        $order->model = 'EssentialPayment';
        $order->model_id = $essential_payment->id;
        $order->flat_id = $essential_payment->flat_id;
        $order->desc = 'Creating order for essential payment from '.$essential_payment->from_date. ' to '.$essential_payment->to_date;
        $order->amount = $essential_payment->dues_amount;
        $order->status = 'Created';
        $order->save();
        
        return response()->json([
                'data' => $data,
                'displayCurrency' => $displayCurrency
        ],200);
    }
    
    public function verify_essential_payment_signature(Request $request)
    {
        $rules = [
            'razorpay_order_id' => 'required',
            'razorpay_payment_id' => 'required',
            'razorpay_signature' => 'required',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $order = Order::where('order_id',$request->razorpay_order_id)->where('status','Created')->first();
        if(!$order){
            return response()->json([
                    'error' => 'Order id not found',
            ],422);
        }
        $success = true;
        $error = "Payment Failed";
        
        $razorpay_order_id = $request->razorpay_order_id;
        $razorpay_payment_id = $request->razorpay_payment_id;
        $razorpay_signature = $request->razorpay_signature;
        
        try{
            $attributes = array(
                'razorpay_order_id' => $razorpay_order_id,
                'razorpay_payment_id' => $razorpay_payment_id,
                'razorpay_signature' => $razorpay_signature
            );
        
            $this->api->utility->verifyPaymentSignature($attributes);
            
        }
        catch(SignatureVerificationError $e){
            $success = false;
            $error = 'Razorpay Error : ' . $e->getMessage();
            return response()->json([
                    'error' => $error
            ],400);
        }

        if ($success === true)
        {
            $razorpayOrder = $this->api->order->fetch($razorpay_order_id);
            $reciept = $razorpayOrder['receipt'];
            $transaction_id = $razorpay_payment_id;
            
            $order->payment_id = $razorpay_payment_id;
            $order->signature = $razorpay_signature;
            $order->status = 'Verified';
            $order->save();
            
            $transaction = new Transaction();
            $transaction->user_id = $user->id;
            $transaction->order_id = $order->order_id;
            $transaction->model = $order->model;
            $transaction->model_id = $order->model_id;
            $transaction->type = 'Credit';
            $transaction->payment_type = 'Razorpay';
            $transaction->amount = $order->amount;
            $transaction->reciept_no = 'RCP'.rand(10000000,99999999);
            $transaction->desc = 'Essential Payment Order Verified '.$order->order_id;
            $transaction->status = 'Success';
            $transaction->save();
            
            $essential_payment = EssentialPayment::find($order->model_id);
            $essential_payment->paid_amount = $order->amount;
            $essential_payment->dues_amount = $essential_payment->maintenance->amount - $order->amount;
            $essential_payment->type = 'Razorpay';
            $essential_payment->status = 'Paid';
            $essential_payment->save();
            
            
            return response()->json([
                    'message' => 'Payment completed! You can now download or view your reciept'
            ],200);

        }
        else
        {
            return response()->json([
                    'error' => $error
            ],422);
        }
    }
    
    public function create_event_payment_order(Request $request)
    {
        $rules = [
            'event_id' => 'required|exists:events,id',
            'amount' => 'required|integer'
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $flat = $user->flat;
        $event = Event::find($request->event_id);
        $item_name = 'Event Payment';
        $item_number = $event->id;
        $item_amount = $request->amount;

        $orderData = [
            'receipt'         => $item_number,
            'amount'          => $item_amount * 100, // 2000 rupees in paise
            'currency'        => 'INR',
            'payment_capture' => 1 // auto capture
        ];
        
        $razorpayOrder = $this->api->order->create($orderData);
        $razorpayOrderId = $razorpayOrder['id'];
        $displayAmount = $amount = $orderData['amount'];
                    
        if ($this->displayCurrency !== 'INR')
        {
            $url = "https://api.fixer.io/latest?symbols=$this->displayCurrency&base=INR";
            $exchange = json_decode(file_get_contents($url), true);
                    
            $displayAmount = $exchange['rates'][$this->displayCurrency] * $amount / 100;
        }
                    
        $data = [
            "key"               => $this->keyId,
            "amount"            => $amount,
            "name"              => $item_name,
            "description"       => $item_name,
            "prefill"           => [
    			"name"              => $user->name,
    			"email"             => $user->email,
    			"contact"           => $user->phone,
            ],
            "notes"             => [
				"address"           => $user->address,
				"merchant_order_id" => $item_number,
            ],
            "theme"             => [
				"color"             => "#3399cc"
            ],
            "order_id"          => $razorpayOrderId,
        ];
                    
        if ($this->displayCurrency !== 'INR')
        {
            $data['display_currency']  = $this->displayCurrency;
            $data['display_amount']    = $displayAmount;
        }
                    
        $displayCurrency = $this->displayCurrency;
        $event = Event::find($request->event_id);
        $payment = new Payment();
        $payment->building_id = $event->building_id;
        $payment->user_id = Auth::User()->id;
        $payment->event_id = $event->id;
        $payment->type = 'Razorpay';
        $payment->amount = $request->amount;
        $payment->status = 'Created';
        $payment->save();
        
        $order = new Order();
        $order->user_id = $user->id;
        $order->order_id = $razorpayOrderId;
        $order->model = 'Payment';
        $order->model_id = $payment->id;
        $order->flat_id = $event->id;
        $order->desc = 'Creating order for event '.$event->name;
        $order->amount = $request->amount;
        $order->status = 'Created';
        $order->save();
        
        return response()->json([
                'data' => $data,
                'displayCurrency' => $displayCurrency
        ],200);
    }
    
    public function verify_event_payment_signature(Request $request)
    {
        $rules = [
            'razorpay_order_id' => 'required',
            'razorpay_payment_id' => 'required',
            'razorpay_signature' => 'required',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $order = Order::where('order_id',$request->razorpay_order_id)->where('status','Created')->first();
        if(!$order){
            return response()->json([
                    'error' => 'Order id not found',
            ],422);
        }
        $success = true;
        $error = "Payment Failed";
        
        $razorpay_order_id = $request->razorpay_order_id;
        $razorpay_payment_id = $request->razorpay_payment_id;
        $razorpay_signature = $request->razorpay_signature;
        
        try{
            $attributes = array(
                'razorpay_order_id' => $razorpay_order_id,
                'razorpay_payment_id' => $razorpay_payment_id,
                'razorpay_signature' => $razorpay_signature
            );
        
            $this->api->utility->verifyPaymentSignature($attributes);
            
        }
        catch(SignatureVerificationError $e){
            $success = false;
            $error = 'Razorpay Error : ' . $e->getMessage();
            return response()->json([
                    'error' => $error
            ],400);
        }

        if ($success === true)
        {
            $razorpayOrder = $this->api->order->fetch($razorpay_order_id);
            $reciept = $razorpayOrder['receipt'];
            $transaction_id = $razorpay_payment_id;
            
            $order->payment_id = $razorpay_payment_id;
            $order->signature = $razorpay_signature;
            $order->status = 'Verified';
            $order->save();
            
            $transaction = new Transaction();
            $transaction->user_id = $user->id;
            $transaction->order_id = $order->order_id;
            $transaction->model = $order->model;
            $transaction->model_id = $order->model_id;
            $transaction->type = 'Credit';
            $transaction->payment_type = 'Razorpay';
            $transaction->amount = $order->amount;
            $transaction->reciept_no = 'RCP'.rand(10000000,99999999);
            $transaction->desc = 'Essential Payment Order Verified '.$order->order_id;
            $transaction->status = 'Success';
            $transaction->save();
            
            $payment = Payment::find($order->model_id);
            $payment->status = 'Paid';
            $payment->save();
            
            
            return response()->json([
                    'message' => 'Payment completed! You can now download or view your reciept'
            ],200);

        }
        else
        {
            return response()->json([
                    'error' => $error
            ],422);
        }
    }
    
    public function get_logo(Request $request)
    {
        $setting = Setting::first();
        $logo = $setting->logo;
        return response()->json([
                'logo' => $logo
        ],200);
    }
    
    public function corpus_fund(Request $request)
    {
        $user = Auth::User();
        $flat = $user->flat;
        return response()->json([
                'flat' => [$flat]
        ],200);
    }
    
    public function even_history(Request $request)
    {
        $user = Auth::User();
        $events = Event::with(['payments' => function($query) use ($user) {
            $query->where('user_id', $user->id);
        }])->get();
        return response()->json([
                'events' => $events
        ],200);
    }
    
    public function essential_history(Request $request)
    {
        $user = Auth::User();
        $essentials = Essential::with(['payments' => function($query) use ($user) {
            $query->where('user_id', $user->id);
        }])->get();
        $flat = Flat::where('owner_id',$user->id)->orWhere('tanent_id',$user->id)->with(['owner','tanent','block','building'])->first();
        $essentials->map(function ($essential) use ($flat) {
            $essential->flat = $flat;
            return $essential;
        });
        return response()->json([
                'essentials' => $essentials,
        ],200);
    }
    
    public function onboarding(Request $request)
    {
        $setting = Setting::first();
        return response()->json([
                'logo' => $setting->logo,
                'title' => 'Title',
                'text' => 'Lorem Ipsum'
        ],200);
    }
    
    public function create_razorpay_order(Request $request)
    {
        $rules = [
            'package_id' => 'required|numeric',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $package = Package::find($request->package_id);
        
        if(!$package){
            return response()->json([
                'error' => 'Package not found'
            ], 422);
        }
        $subscription = Subscription::where('user_id',$user->id)->where('package_id',$package->id)->where('status','Active')->first();
        if($subscription){
            return response()->json([
                'error' => 'You already have purchased this package'
            ], 422);
        }
        $item_name = $package->name;
        $item_number = $package->id;
        $item_amount = $package->price;

        $orderData = [
            'receipt'         => $item_number,
            'amount'          => $item_amount * 100, // 2000 rupees in paise
            'currency'        => 'INR',
            'payment_capture' => 1 // auto capture
        ];
        
        $razorpayOrder = $this->api->order->create($orderData);
        $razorpayOrderId = $razorpayOrder['id'];
        $displayAmount = $amount = $orderData['amount'];
                    
        if ($this->displayCurrency !== 'INR')
        {
            $url = "https://api.fixer.io/latest?symbols=$this->displayCurrency&base=INR";
            $exchange = json_decode(file_get_contents($url), true);
                    
            $displayAmount = $exchange['rates'][$this->displayCurrency] * $amount / 100;
        }
                    
        $data = [
            "key"               => $this->keyId,
            "amount"            => $amount,
            "name"              => $item_name,
            "description"       => $item_name,
            "prefill"           => [
    			"name"              => $user->name,
    			"email"             => $user->email,
    			"contact"           => $user->phone,
            ],
            "notes"             => [
				"address"           => $user->address,
				"merchant_order_id" => $item_number,
            ],
            "theme"             => [
				"color"             => "#3399cc"
            ],
            "order_id"          => $razorpayOrderId,
        ];
                    
        if ($this->displayCurrency !== 'INR')
        {
            $data['display_currency']  = $this->displayCurrency;
            $data['display_amount']    = $displayAmount;
        }
                    
        $displayCurrency = $this->displayCurrency;
        
        $order = new Order();
        $order->user_id = $user->id;
        $order->package_id = $package->id;
        $order->order_id = $razorpayOrderId;
        $order->status = 'Created';
        $order->save();
        
        return response()->json([
                'data' => $data,
                'displayCurrency' => $displayCurrency
        ],200);
    }
    public function verify_razorpay_signature(Request $request)
    {
        $rules = [
            'razorpay_order_id' => 'required',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $order = Order::where('order_id',$request->razorpay_order_id)->where('status','Created')->first();
        if(!$order){
            return response()->json([
                    'error' => 'Order id not found',
            ],422);
        }
        $success = true;
        $error = "Payment Failed";
        
        $razorpay_order_id = $request->razorpay_order_id;
        $razorpay_payment_id = $request->razorpay_payment_id;
        $razorpay_signature = $request->razorpay_signature;
        
        // try{
        //     $attributes = array(
        //         'razorpay_order_id' => $razorpay_order_id,
        //         'razorpay_payment_id' => $razorpay_payment_id,
        //         'razorpay_signature' => $razorpay_signature
        //     );
        
        //     $this->api->utility->verifyPaymentSignature($attributes);
            
        // }
        // catch(SignatureVerificationError $e){
        //     $success = false;
        //     $error = 'Razorpay Error : ' . $e->getMessage();
        //     return response()->json([
        //             'error' => $error
        //     ],400);
        // }

        // if ($success === true)
        // {
            $razorpayOrder = $this->api->order->fetch($razorpay_order_id);
            $reciept = $razorpayOrder['receipt'];
            $transaction_id = $razorpay_payment_id;
            
            $order->payment_id = $razorpay_payment_id;
            $order->signature = $razorpay_signature;
            $order->status = 'Verified';
            $order->save();
            
            $subscription = new Subscription();
            $subscription->user_id = $user->id;
            $subscription->package_id = $order->package_id;
            $subscription->status = 'Active';
            $subscription->save();
            
            $package = Package::find($order->package_id);
            
            $info = array(
                'package' => $package
            );
                
            Mail::send('email.package_purchased', ['info' => $info], function ($message) use ($user)
            {
                $message->to($user->email, $user->name)
                ->subject('Package purchased');
            });
            
            $user->create_circle($package->id);
            $user->update_circle_member($package->id);
            
            // $user->wallet = $user->wallet + $package->price;
            // $user->save();
            
            $transaction = new Transaction();
            $transaction->user_id = $user->id;
            $transaction->type = 'Credit';
            $transaction->reason = $package->name;
            $transaction->amount = $package->price;
            $transaction->balance = $user->wallet;
            $transaction->save();
            
            return response()->json([
                    'message' => 'Package purchased successfully'
            ],200);

        // }
        // else
        // {
        //     return response()->json([
        //             'error' => $error
        //     ],422);
        // }
    }
    
    public function get_security_flats(Request $request)
    {
        $user = Auth::User();
        $flats = $user->building->flats;
        return response()->json([
            'flats' => $flats
        ], 200);
    }
    
    public function get_buildings(Request $request)
    {
        $user = Auth::User();
        $guards = Guard::where('user_id',$user->id)->with('building')->get();
        return response()->json([
            'guards' => $guards
        ], 200);
    }
    
    public function select_building(Request $request)
    {
        $rules = [
            'building_id' => 'required|exists:buildings,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $user->building_id = $request->building_id;
        $user->save();
        
        $building = $user->building;
        
        return response()->json([
            'building' => $building,
            'msg' => 'Building selected successfully'
        ], 200);
    }
    
    public function get_gates(Request $request)
    {
        $user = Auth::User();
        $guards = Guard::where('user_id',$user->id)->with(['building','block','gate'])->get();
        return response()->json([
            'guards' => $guards
        ], 200);
    }
    
    public function select_gate(Request $request)
    {
        $rules = [
            'gate_id' => 'required|exists:gates,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $user->gate_id = $request->gate_id;
        $user->save();
        
        $gate = $user->gate->with(['building','block'])->get();
        
        return response()->json([
            'gate' => $gate,
            'msg' => 'Gate selected successfully'
        ], 200);
    }
    
    
    public function get_building_flats(Request $request)
    {
        $user = Auth::User();
        $building = $user->gate->building;
        $flats = Flat::where('building_id',$building->id)->with(['owner','tanent','building','block'])->withCount([
            'vehicles as two_wheeler_count' => function ($query) {
                $query->where('vehicle_type', 'two-wheeler');
            },
            'vehicles as four_wheeler_count' => function ($query) {
                $query->where('vehicle_type', 'four-wheeler');
            }
        ])->get();
        return response()->json([
            'flats' => $flats
        ], 200);
    }
    
    public function get_visitors(Request $request)
    {
        $rules = [
            'type' => 'required|in:Planned,Unplanned,Completed,All',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        if($request->type == 'All'){
            $visitors = $user->flat->visitors()->where('status','!=','Completed')->with(['vehicles','inouts'])->get();
        }else if($request->type == 'Completed'){
            $visitors = $user->flat->visitors()->where('status',$request->type)->with(['vehicles','inouts'])->get();
        }else{
            $visitors = $user->flat->visitors()->where('type',$request->type)->where('status','!=','Completed')->with(['vehicles','inouts'])->get();
        }
        return response()->json([
            'visitors' => $visitors
        ], 200);
    }
    
    
    public function get_building_visitors(Request $request)
    {
        $rules = [
            'type' => 'required|in:Planned,Unplanned,Completed,All',
        ];
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $building = $user->gate->building;
        
        if($request->type == 'All'){
            $visitors = Visitor::where('building_id',$building->id)->with(['building','block','flat','vehicles','inouts'])->get();
        }else if($request->type == 'Completed'){
            $visitors = Visitor::where('building_id',$building->id)->with(['building','block','flat','vehicles','inouts'])->get();
        }
        else{
            $visitors = Visitor::where('building_id',$building->id)->where('type',$request->type)->with(['building','block','flat','vehicles','inouts'])->get();
        }
        return response()->json([
            'visitors' => $visitors
        ], 200);
    }
    
    public function visitor_details(Request $request)
    {
        $rules = [
            'visitor_id' => 'required|exists:visitors,id',
        ];
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $building = $user->gate->building;
        $visitor = Visitor::where('id',$request->visitor_id)->where('building_id',$building->id)->with(['building','block','flat','vehicles','inouts'])->first();
        
        return response()->json([
            'visitor' => $visitor
        ], 200);
    }
    
    public function get_vehicles(Request $request)
    {
        $rules = [
            'ownership' => 'required|in:Own,Guest,All',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        if($request->ownership == 'All'){
            $vehicles = $user->flat->vehicles;
        }else{
            $vehicles = $user->flat->vehicles()->where('ownership',$request->ownership)->get();
        }
        return response()->json([
            'vehicles' => $vehicles
        ], 200);
    }
    
    public function get_building_vehicles(Request $request)
    {
        $rules = [
            'ownership' => 'required|in:Own,Guest,Outsider,All',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $building = $user->gate->building;
        if($request->ownership == 'All'){
            $vehicles = Vehicle::where('building_id',$building->id)->with(['user', 'flat.owner', 'flat.tanent', 'flat.block', 'building'])->get();
            $count = $vehicles->count();
        }else{
            $vehicles = Vehicle::where('building_id',$building->id)->where('ownership',$request->ownership)->with(['user','flat.owner', 'flat.block', 'flat.tanent','building'])->get();
            $count = $vehicles->count();
        }
        return response()->json([
            'vehicles' => $vehicles,
            'count' => $count
        ], 200);
        
    }
    
    public function get_flat_vehicles(Request $request)
    {
        $rules = [
            'flat_id' => 'required|exists:flats,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $building = $user->gate->building;
        $vehicles = Vehicle::where('flat_id',$request->flat_id)->with(['user', 'flat.owner', 'flat.tanent', 'building'])->get();
        $count = $vehicles->count();
        return response()->json([
            'vehicles' => $vehicles,
            'count' => $count
        ], 200);
        
    }
    
    public function create_vehicle(Request $request)
    {
        $rules = [
            'flat_id' => 'nullable|exists:flats,id',
            'visito_id' => 'nullable|exists:visitors,id',
            'vehicle_type' => 'required|in:two-wheeler,four-wheeler,auto,other',
            'vehicle_no' => [
                'required',
                'regex:/^[A-Z]{2}\s?[0-9]{1,2}\s?[A-Z]{1,3}\s?[0-9]{4}$/'
            ],
            'ownership' => 'required|in:Own,Guest,Outsider',
            'driver_name' => 'nullable',
            'phone' => 'nullable',
            'photo' => 'nullable|image',
            'purpose' => 'nullable',
            'vehicle_id' => 'nullable|exists:vehicles,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        if($request->flat_id){
            $flat = Flat::find($request->flat_id);
        }else{
            $flat = Auth::User()->flat;
        }
        $msg = 'Vehicle created successfully';
        $vehicle = new Vehicle();
        if($request->vehicle_id){
            $vehicle = Vehicle::find($request->vehicle_id);
            $msg = 'Vehicle updated successfully';
        }
        if($request->visitor_id){
            $vehicle->visitor_id = $request->visitor_id;
        }
        if($request->ownership == 'Own'){
            $vehicle->flat_id = $flat->id;
            $vehicle->user_id = $flat->tanent_id;
            $vehicle->building_id = $flat->building_id;
        }
        if($request->ownership == 'Guest' || $request->ownership == 'Outsider'){
            $user = Auth::User();
            $building_id = $user->gate->building->id;
            $vehicle->building_id = $building_id;
        }
        $vehicle->vehicle_type = $request->vehicle_type;
        $vehicle->vehicle_no = $request->vehicle_no;
        $vehicle->ownership = $request->ownership;
        $vehicle->driver_name = $request->driver_name;
        $vehicle->phone = $request->phone;
        $vehicle->purpose = $request->purpose;
        if($request->hasFile('photo')) {
            $file= $request->file('photo');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($vehicle->getPhotoFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/vehicles/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $vehicle->photo = $filename;
        }
        $vehicle->save();
    
        return response()->json([
            'vehicle' => $vehicle,
            'msg' => $msg
        ], 200);
    }
    
    public function delete_vehicle(Request $request)
    {
        $rules = [
            'vehicle_id' => 'nullable|exists:vehicles,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ], 422);
        }
        $user = Auth::User();
        $vehicle = Vehicle::where('user_id',$user->id)->where('id',$request->vehicle_id)->withTrashed()->first();
        if(!$vehicle){
            return response()->json([
                'msg' => 'Tou dont have proper permission to delete this vehicle'
            ],422);
        }
        if($request->type == 'delete'){
            $msg = 'Vehicle deleted successfully';
            $vehicle->delete();
        }else{
            $msg = 'Vehicle restored successfully';
            $vehicle->restore();
        }
        
        return response()->json([
                'msg' => $msg
        ],200);
    }
    
    public function create_unplanned_visitor(Request $request)
    {
        $rules = [
            'total_members' => 'required|integer|min:1',
            'head_name' => 'required',
            'head_phone' => 'required',
            'head_photo' => 'required|image',
            'stay_from' => 'required',
            'stay_to' => 'required',
            'visiting_purpose' => 'required',
            'type' => 'required|in:Unplanned',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ], 422);
        }
        
        $user = Auth::User();
        $flat = Flat::find($request->flat_id);
        if($request->flat_id){
            $flat = Flat::find($request->flat_id);
        }
        $visitor = new Visitor();
        if($request->hasFile('head_photo')) {
            $file= $request->file('head_photo');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($visitor->getHeadPhotoFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/visitors/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $visitor->head_photo = $filename;
        }
        do {
            $code = Str::random(10);
        } while (\App\Models\GatePass::where('code', $code)->exists());
        $visitor->user_id = $user->id;
        $visitor->building_id = $flat->building_id;
        $visitor->flat_id = $flat->id;
        $visitor->total_members = $request->total_members;
        $visitor->head_name = $request->head_name;
        $visitor->head_phone = $request->head_phone;
        $visitor->stay_from = $request->stay_from;
        $visitor->stay_to = $request->stay_to;
        $visitor->visiting_purpose = $request->visiting_purpose;
        $visitor->type = $request->type;
        $visitor->code = $code;
        $visitor->save();
        
        return response()->json([
                'visitor' => $visitor,
                'msg' => 'Visitor added successfully'
        ],200);
    }
    
    public function visitor_in_out(Request $request)
    {
        $rules = [
            'visitor_id' => 'required|exists:visitors,id',
            'type' => 'required|in:In,Out',
            'purpose' => 'required',
            'code' => 'required'
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        
        $visitor = Visitor::where('id',$request->visitor_id)->whereIn('status',['Living','AllowIn'])->first();
        if(!$visitor){
            return response()->json([
                'error' => 'Living Visitor not found'
            ], 422);
        }
        $visitor_in_out = new VisitorInout();
        $visitor_in_out->flat_id = $visitor->flat_id;
        $visitor_in_out->building_id = $visitor->building_id;
        $visitor_in_out->user_id = $visitor->user_id;
        $visitor_in_out->visitor_id = $request->visitor_id;
        $visitor_in_out->type = $request->type;
        $visitor_in_out->purpose = $request->purpose;
        $visitor_in_out->code = $request->code;
        $visitor_in_out->save();

        $visitor->status = 'Living';
        $visitor->save();
        
        return response()->json([
            'visitor_in_out' => $visitor_in_out,
            'msg' => 'Visitor status updated successfully'
        ], 200);
    }
    
    public function complete_visitor_journey(Request $request)
    {
        $rules = [
            'visitor_id' => 'required|exists:visitors,id',
            'code' => 'required',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $visitor = Visitor::find($request->visitor_id);
        $visitor->status = 'Completed';
        $visitor->save();
        
        $visitor_in_out = new VisitorInout();
        $visitor_in_out->flat_id = $visitor->flat_id;
        $visitor_in_out->building_id = $visitor->building_id;
        $visitor_in_out->user_id = $visitor->user_id;
        $visitor_in_out->visitor_id = $request->visitor_id;
        $visitor_in_out->type = 'Out';
        $visitor_in_out->purpose = 'Mission Completed';
        $visitor_in_out->code = $request->code;
        $visitor_in_out->save();
        
        return response()->json([
            'msg' => 'Visitor status updated successfully'
        ], 200);
    }
    
    public function get_todays_completed_visitors(Request $request)
    {
        $startOfToday = Carbon::today();
        $endOfToday = Carbon::today()->endOfDay();
    
        $visitor_inouts = Auth::user()->gate->building
            ->visitor_inouts()
            ->whereHas('visitor', function ($query) use ($startOfToday, $endOfToday) {
                $query->where('status', 'Completed')
                      ->whereBetween('updated_at', [$startOfToday, $endOfToday]);
            })
            ->with(['visitor', 'building', 'flat.block'])
            ->get();
    
        return response()->json([
            'visitor_inouts' => $visitor_inouts
        ], 200);
    }
        
    public function vehicle_in_out(Request $request)
    {
        $rules = [
            'vehicle_id' => 'required|exists:vehicles,id',
            'type' => 'required|in:In,Out',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }

        $vehicle = Vehicle::find($request->vehicle_id);
        $vehicle->status = $request->type;
        $vehicle->save();
        $vehicle_in_out = new VehicleInout();
        $vehicle_in_out->vehicle_id = $request->vehicle_id;
        $vehicle_in_out->type = $request->type;
        $vehicle_in_out->save();
    
        return response()->json([
            'vehicle_in_out' => $vehicle_in_out,
            'msg' => 'Vehicle status updated successfully'
        ], 200);
    }
    
    public function visitor_in_out_history(Request $request)
    {
        $visitor_inouts = Auth::User()->gate->building->visitor_inouts()->with(['visitor','building','flat.block'])->get();
        return response()->json([
            'visitor_inouts' => $visitor_inouts
        ], 200);
    }
    
    public function vehicle_in_out_history(Request $request)
    {
        $rules = [
            'vehicle_id' => 'required|exists:vehicles,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $building = Auth::User()->gate->building;
        $vehicle = Vehicle::find($request->vehicle_id);
        $vehicle_inouts = VehicleInout::where('vehicle_id',$request->vehicle_id)->get();
        return response()->json([
            'vehicle' => $vehicle,
            'vehicle_inouts' => $vehicle_inouts,
        ], 200);
    }
    
    public function search_flat(Request $request)
    {
        $user = Auth::User();
        $building = $user->gate->building;
        $flat = Flat::where('building_id',$building->id)->where('name',$request->flat_no)->first();
        return response()->json([
                'flat' => $flat
        ],200);
    }
    
    public function create_parcel(Request $request)
    {
        $rules = [
            'name' => 'required',
            'photo' => 'nullable|image',
            'delivery_guy_name' => 'required',
            'delivery_guy_phone' => 'required',
            'purpose_of_visit' => 'required',
            'stay_time' => 'required',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        
        $user = Auth::User();
        $gate = $user->gate;
        $guard = Guard::where('user_id',$user->id)->where('gate_id',$user->gate_id)->first();
        if(!$guard){
            return response()->json([
                'error' => 'Guard not found'
            ], 422);
        }
        if($request->flat_id){
            $flat = Flat::find($request->flat_id);
        }
        $parcel = new Parcel();
        if($request->hasFile('photo')) {
            $file= $request->file('photo');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($parcel->getPhotoFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/parcels/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $parcel->photo = $filename;
        }
        do {
            $code = Str::random(10);
        } while (\App\Models\Parcel::where('code', $code)->exists());
        $parcel->user_id = $user->id;
        $parcel->building_id = $flat->building_id;
        $parcel->flat_id = $flat->id;
        $parcel->guard_id = $guard->id;
        $parcel->name = $request->name;
        $parcel->delivery_guy_name = $request->delivery_guy_name;
        $parcel->delivery_guy_phone = $request->delivery_guy_phone;
        $parcel->purpose_of_visit = $request->purpose_of_visit;
        $parcel->stay_time = $request->stay_time;
        $parcel->code = $code;
        $parcel->status = 'OnGoing';
        $parcel->save();
        
        return response()->json([
                'parcel' => $parcel,
                'msg' => 'Parcel added successfully'
        ],200);
    }
    
    public function parcel_handover_to_owner(Request $request)
    {
        $rules = [
            'parcel_id' => 'required|exists:parcels,id',
            'code' => 'required|exists:parcels,code',
        ];
        
        $parcel = Parcel::find($request->parcel_id);
        if($parcel->code != $request->code){
            return response()->json([
                'msg' => 'Invalid parcel code'
            ],200);
        }
        $parcel->status = 'Delivered';
        $parcel->save();
        return response()->json([
                'parcel' => $parcel,
                'msg' => 'Parcel delivered successfully'
        ],200);
    }
    
    
    public function resend_recieve_request(Request $request)
    {
        $rules = [
            'parcel_id' => 'required|exists:parcels,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
    
        return response()->json([
                'msg' => 'Recieve request resent successfully'
        ],200);
    
    }
    
    public function get_building_parcels(Request $request)
    {
        $user = Auth::User();
        $parcels = Parcel::where('building_id',$user->gate->building_id)->with(['flat.block.building','flat.owner'])->get();
        return response()->json([
                'parcels' => $parcels
        ],200);
    }
    
    public function get_flat_parcels(Request $request)
    {
        $parcels = Parcel::where('flat_id',$request->flat_id)->with(['flat.block.building'])->get();
        return response()->json([
                'parcels' => $parcels
        ],200);
    }
    
    public function get_my_parcels(Request $request)
    {
        $user = Auth::User();
        $flat = $user->flat;
        $parcels = $flat->parcels;
        return response()->json([
                'parcels' => $parcels
        ],200);
    }
    
    public function take_parcel_action(Request $request)
    {
        $rules = [
            'parcel_id' => 'required|exists:parcels,id',
            'action' => 'required|in:AllowIn,LeaveInGate,Deny'
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        
        $parcel = Parcel::find($request->parcel_id);
        $parcel->status = $request->action;
        $parcel->save();
        return response()->json([
                'parcel' => $parcel,
                'msg' => 'Parcel status updated successfully'
        ],200);
        
    }
    
    public function take_visitor_action(Request $request)
    {
        $rules = [
            'visitor_id' => 'required|exists:visitors,id',
            'action' => 'required|in:AllowIn,LeaveInGate,Deny'
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        
        $visitor = Visitor::find($request->visitor_id);
        $visitor->status = $request->action;
        $visitor->save();
        return response()->json([
                'visitor' => $visitor,
                'msg' => 'Visitor status updated successfully'
        ],200);
        
    }
    
    
    // department routes
    
    public function my_departments(Request $request)
    {
        $user = Auth::User();
        $departments = $user->departments;
        return response()->json([
                'departments' => $departments
        ],200);
    }
    
    public function select_department(Request $request)
    {
        $rules = [
            'department_id' => 'required|exists:roles,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        
        $user = Auth::User();
        $user->department_id = $request->department_id;
        $user->save();
        return response()->json([
                'msg' => 'Department selected successfully'
        ],200);
    }
    
    public function get_issues(Request $request)
    {
        $rules = [
            'status' => 'required|in:Pending,Ongoing,Completed',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        
        $user = Auth::User();
        $department = $user->department;
        $issues = Issue::where('building_id',$department->building_id)->where('role_id',$department->role_id)->where('status',$request->status)->with(['department','comments.replies'])->get();
        return response()->json([
                'issues' => $issues
        ],200);
    }
    
    public function update_issue_status(Request $request)
    {
        $rules = [
            'status' => 'required|in:Pending,Ongoing,Completed',
            'issue_id' => 'required|exists:issues,id',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $issue = Issue::find($request->issue_id);
        $issue->status = $request->status;
        $issue->save();
        return response()->json([
                'issue' => $issue,
                'msg' => 'Issue status updated'
        ],200);
    }
    
    public function get_building_gate_passes(Request $request)
    {
        $rules = [
            'status' => 'required|in:Approved,Rejected,Recheck,Completed,All',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $user = Auth::User();
        $building = $user->gate->building;
        if($request->status == 'All'){
            $gate_passes = GatePass::where('building_id',$building->id)->with(['user','visitor','building','flat.block'])->get();
        }else{
            $gate_passes = GatePass::where('building_id',$building->id)->where('status',$request->status)->with(['user','visitor','building','flat.block'])->get();
        }
        return response()->json([
            'gate_passes' => $gate_passes,
        ],200);
    }
    
    public function resend_gate_pass_request(Request $request)
    {
        $rules = [
            'status' => 'required|in:Recheck',
            'gate_pass_id' => 'required|exists:gate_passes,id',
            'image' => 'required|image'
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $gate_pass = GatePass::find($request->gate_pass_id);
        if($request->hasFile('image')) {
            $file= $request->file('image');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($gate_pass->getImageFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/gate_pass/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $gate_pass->image = $filename;
        }
        $gate_pass->status = $request->status;
        $gate_pass->save();
        return response()->json([
            'msg' => 'Recheck gate pass request send',
        ],200);
    }
    
    public function get_homepage_count(Request $request)
    {
        // visitors, gate-pass,parcels,vehicles
        $visitors_count = Visitor::count();
        $gate_pass_count = GatePass::count();
        $parcel_count = Parcel::count();
        $vehicle_count = Vehicle::count();
        return response()->json([
            'visitors_count' => $visitors_count,
            'gate_pass_count' => $gate_pass_count,
            'parcel_count' => $parcel_count,
            'vehicle_count' => $vehicle_count,
        ],200);
    }
    
    
}
