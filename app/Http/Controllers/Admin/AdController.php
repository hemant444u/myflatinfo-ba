<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Ad;

use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class AdController extends Controller
{

    public function index()
    {
        $ads = Ad::where('status','Active')->get();
        return view('admin.ads.index',compact('ads'));
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $rules = [
            'building_id' => 'required|exists:buildings,id',
            'name' => 'required',
            'image' => 'nullable|image|max:2048',
            'link' => 'required',
            'status' => 'required|in:Active,Inactive',
        ];
    
        $msg = 'Ad added Susccessfully';
        $ad = new Ad();
    
        if ($request->id) {
            $ad = Ad::find($request->id);
            $msg = 'Ad updated Susccessfully';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        
        if($request->hasFile('image')) {
            $file= $request->file('image');
            $allowedfileExtension=['JPEG','jpg','png'];
            $extension = $file->getClientOriginalExtension();
            $check = in_array($extension,$allowedfileExtension);
            // if($check){
                $file_path = public_path('/images/ads'.$ad->image);
                if(file_exists($file_path) && $ad->image != '')
                {
                    unlink($file_path);
                }
                $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                $filename = substr(str_shuffle(str_repeat($pool, 5)), 0, 12) .'.'.$extension;
                $path = $file->move(public_path('/images/ads'), $filename);
                $ad->image = $filename;
            // }
        }
        $user = Auth::User();
        $ad->user_id = $user->id;
        $ad->name = $request->name;
        $ad->building_id = $user->building_id;
        $ad->link = $request->link;
        $ad->status = $request->status;
        $ad->save();
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $ad = Ad::where('id',$id)->withTrashed()->first();
        if(!$add){
            return redirect()->route('add.index');
        }
        return view('admin.ads.show',compact('ad'));
    }
    
    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id, Request $request)
    {
        $ad = Ad::where('id',$id)->first();
        $ad->delete();
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function update_ad_status(Request $request)
    {
        $ad = Ad::where('id',$request->id)->withTrashed()->first();
        if($ad->status == 'Active'){
            $ad->status = 'Inactive';
        }else{
            $ad->status = 'Active';
        }
        $ad->save();
        return response()->json([
            'msg' => 'success'
        ],200);
    }
}
