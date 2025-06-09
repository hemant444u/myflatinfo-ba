<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Facility;
use App\Models\Building;
use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;

class FacilityController extends Controller
{

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.facility.index',compact('building'));
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $rules = [
            'name' => 'required',
            'max_booking' => 'required|int',
            'per_user_max_booking' => 'required|int',
            'price' => 'required|int',
            'cancellation_type' => 'required|in:Fixed,Percentage,Other',
            'cancellation_value' => 'required|int',
            'status' => 'required|in:Pending,Active',
            'icon' => 'nullable|image',
            'color' => 'required',
        ];
    
        $msg = 'Facility added successfully';
        $facility = new Facility();
    
        if ($request->id) {
            $facility = Facility::withTrashed()->find($request->id);
            $msg = 'Facility Updated';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $facility->building_id = Auth::User()->building_id;
        $facility->name = $request->name;
        $facility->max_booking = $request->max_booking;
        $facility->per_user_max_booking = $request->per_user_max_booking;
        $facility->price = $request->price;
        $facility->cancellation_type = $request->cancellation_type;
        $facility->cancellation_value = $request->cancellation_value;
        $facility->status = $request->status;
        $facility->color = $request->color;

        if($request->hasFile('icon')) {
            $file= $request->file('icon');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($ad->getIconFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/facilities/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $facility->icon = $filename;
        }
        $facility->save();
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $facility = Facility::where('id',$id)->withTrashed()->first();
        if(!$facility){
            return redirect()->route('facility.index');
        }
        return view('admin.facility.show',compact('facility'));
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
        $facility = Facility::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $facility->delete();
        }else{
            $facility->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
}
