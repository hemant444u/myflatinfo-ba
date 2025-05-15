<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Setting;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use \Auth;

class SettingController extends Controller
{

    public function index()
    {
        $setting = Auth::User()->building;
        return view('admin.settings.index',compact('setting'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $building = Auth::User()->building;
        $building->razorpay_key = $request->razorpay_key;
        $building->razorpay_secret = $request->razorpay_secret;
        $building->gst_no = $request->gst_no;
        $building->save();
        return redirect()->back()->with('success','Setting saved');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }


    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
    
    
}
