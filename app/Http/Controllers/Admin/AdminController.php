<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Setting;
use App\Models\City;
use App\Models\Building;

use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Cache;
use \Hash;
use \Auth;
use \Response;
use \Mail;

class AdminController extends Controller
{
    
    public function index()
    {
        $setting = Setting::first();
        return view('admin.login',compact('setting'));
    }
    
    public function save_token(Request $request)
    {
        $user = Auth::User();
        $user->device_token = $request->device_token;
        $user->save();
        return response()->json([
            'msg' => 'success'
        ],200);
    }

    public function login(Request $request)
    {
        
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required|min:6',
        ]);

        $user = User::where('role','BA')->where('email', $request->email)->where('status','Active')->first();
        if($user){
            // $user->password = Hash::make($request->password);
            // $user->save();
            if(Hash::check($request->password,$user->password)){
                Auth::login($user, true);
                $user->device_token = $request->device_token;
                $user->save();
                return redirect('/building-option');
            }
        }
        return redirect()->back()->with('error','Invalid Email or Password');
    }

    public function verifyotp(Request $request)
    {
        $this->validate($request, [
            'mobile' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10',
            'otp' => 'required|digits:4|numeric',
        ]);
        $user = User::where('phone', $request->mobile)->where('role','BA')->first();
        if(!$user){
            return response()->json(['status' => 2, 'error' => 'This number is not registered with us']);
        }
        if(Hash::check($request->otp,$user->otp)){
            Auth::login($user, true);
            $user->device_token = $request->device_token;
            $user->save();
            return response()->json(['status' => 1, 'success' => 'You have Logged in Successfully']);
        }
        return response()->json(['status' => 2, 'error' => 'Invalid Otp']);
    }

    public function building_option()
    {
        $setting = Setting::first();
        return view('admin.building_option',compact('setting'));
    }
    
    public function select_building($building_id)
    {
        $user = Auth::User();
        $building = Building::where('user_id',$user->id)->where('id',$building_id)->first();
        if($building){
            $user->building_id = $building_id;
            $user->save();
        }
        return redirect('/dashboard');
    }
    
    public function dashboard()
    {
        return view('admin.dashboard');
    }
    
    public function profile()
    {
        $customer = Auth::User();
        return view('admin.profile',compact('customer'));
    }
    
    public function update_profile(Request $request)
    {
        $rules = [
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => [
                'required',
                'email',
                'max:255',
                'unique:users,email,' . Auth::id(),
                'regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',
            ],
            'phone' => [
                'required',
                'regex:/^[6-9]\d{9}$/', // Exactly 10 digits and starts with 6, 7, 8, or 9
            ],
            'gender' => 'required|in:Male,Female,Other',
            'address' => 'required|string|max:500',
            'photo' => 'nullable|image|max:2048',
        ];
    
        $validation = \Validator::make( $request->all(), $rules );
        if( $validation->fails() ) {
            return redirect()->back()->with('error',$validation->errors()->first());
        }
        $customer = Auth::User();
        
        if($request->hasFile('photo')) {
            $file= $request->file('photo');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($customer->getPhotoFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/profiles/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $customer->photo = $filename;
        }
        $customer->first_name = $request->first_name;
        $customer->last_name = $request->last_name;
        $customer->email = $request->email;
        $customer->phone = $request->phone;
        $customer->gender = $request->gender;
        $customer->address = $request->address;
        $customer->save();
        return redirect()->back()->with('success','Profile Updated');
    }
    
    public function change_password(Request $request)
    {
        $request->validate([
                'current_password' => 'required',
                'password' =>[
                'required',
                'string',
                'min:8',             // must be at least 10 characters in length
                'regex:/[a-z]/',      // must contain at least one lowercase letter
                'regex:/[A-Z]/',      // must contain at least one uppercase letter
                'regex:/[0-9]/',      // must contain at least one digit
                'regex:/[@$!%*#?&]/', // must contain a special character
                'confirmed',
                function ($attribute, $value, $fail) {
                    if (Hash::check($value, Auth::user()->password)) {
                        $fail('The new password must not be the same as the current password.');
                    }
                },
            ],
                'password_confirmation' => 'required',
            ]);
            
        $user = Auth::User();
        if (Hash::check($request->current_password, $user->password)) {
            $user->password = Hash::make($request->password);
            $user->save();
            // Auth::logout();
            return redirect()->back()->with('success','Password updated successfully');
        }
        return redirect()->back()->with('error','Invalid current password');
    }
    
    public function update_user_status(Request $request)
    {
        $user = User::where('id',$request->id)->withTrashed()->first();
        if($user->status == 'Active'){
            $user->status = 'Inactive';
        }else{
            $user->status = 'Active';
        }
        $user->save();
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function update_document_status(Request $request)
    {
        $user = User::where('id',$request->id)->withTrashed()->first();
        if($user->email_sent_document_status == 'Verified'){
            $user->email_sent_document_status = 'Pending';
        }else{
            $user->email_sent_document_status = 'Verified';
        }
        $user->save();
        return response()->json([
            'msg' => 'success'
        ],200);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        return redirect('/');
    }
    

    public function users()
    {
        // $setting = Setting::first();
        // $users = User::where('role','customer')->orderBy('id','desc')->withTrashed()->paginate($setting->pagination);
        $users = User::where('created_by',Auth::User()->building_id)->orderBy('id','desc')->withTrashed()->get();
        $cities = City::all();
        return view('admin.user.index',compact('users','cities'));
    }

    public function show_user($id)
    {
        $customer = User::where('id',$id)->where('created_by',Auth::User()->building_id)->withTrashed()->first();
        if(!$customer){
            return redirect('/user');
        }
        return view('admin.user.show',compact('customer'));
    }

    public function store_user(Request $request)
    {
        // If $request->id exists, fetch the user for update; otherwise, create a new instance.
        $user = $request->id ? User::find($request->id) : new User();
        $msg = $request->id ? 'User Updated' : 'User Added';
    
        // Define the validation rules
        $rules = [
            'first_name' => 'required|min:4|max:30',
            'last_name' => 'required|min:4|max:30',
            'email' => [
                'required',
                'email',
                'max:255',
                'regex:/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/',
                Rule::unique('users', 'email')->ignore($user->id), 
            ],
            'phone' => [
                'required',
                'regex:/^([0-9\s\-\+\(\)]*)$/',
                'min:10',
                Rule::unique('users', 'phone')->ignore($user->id),
            ],
            'gender' => 'required|in:Male,Female',
            'city_id' => 'required|exists:cities,id',
            'address' => 'required|min:4',
            'password' => 'nullable|min:8',
            'role' => 'required|in:owner,tanent,user',
        ];

    
        // Validate the request
        $validation = Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
    
        // Assign user data
        $user->role = $request->role;
        $user->first_name = $request->first_name;
        $user->last_name = $request->last_name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->gender = $request->gender;
        $user->city_id = $request->city_id;
        $user->address = $request->address;
    
        // Only set a password if provided
        if ($request->password) {
            $user->password = Hash::make($request->password);
        }
    
        $user->created_by = Auth::User()->building_id;
        $user->save();
    
        return redirect()->back()->with('success', $msg);
    }

    public function delete_user(Request $request)
    {
        $user = User::where('id',$request->id)->withTrashed()->first();
        if($request->action == 'delete'){
            $user->status = 'Inactive';
            $user->save();
            $user->delete();
        }else{
            $user->status = 'Active';
            $user->save();
            $user->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function get_user_by_email(Request $request) {
        $user = User::where('email', $request->email)->orWhere('phone', $request->email)->where('status','Active')->first();
        if ($user) {
            return response()->json(['success' => true, 'data' => ['id' => $user->id,'name' => $user->name]]);
        }
        return response()->json(['success' => false, 'message' => 'User not found']);
    }

    public function withdraws()
    {
        $withdraws = Withdraw::all();
        return view('admin.withdraws',compact('withdraws'));
    }
    
    public function update_withdraw(Request $request)
    {
        $rules = [
            'withdraw_id' => 'required|exists:withdraws,id',
            'transfer_details' => 'required',
            'status' => 'required|in:Pending,Rejected,Success',
        ];
        
        $validation = \Validator::make( $request->all(), $rules );
        if( $validation->fails() ) {
            return redirect()->back()->with('error',$validation->errors()->first());
        }
        
        $withdraw = Withdraw::find($request->withdraw_id);
        $withdraw->transfer_details = $request->transfer_details;
        $withdraw->status = $request->status;
        $withdraw->save();
        return redirect()->back()->with('success','Withdraw request updated');
        
    }


}
