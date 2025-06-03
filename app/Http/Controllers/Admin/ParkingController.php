<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Parking;
use \Auth;
use \DB;

class ParkingController extends Controller
{

    public function index()
    {
        // DB::table('parkings')->truncate();
        $building = Auth::User()->building;
        return view('admin.parking.index',compact('building'));
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $rules = [
            'building_id' => 'required|exists:buildings,id',
            'block_id' => 'required|exists:blocks,id',
            'name' => 'required',
            'status' => 'required|in:Active,Inactive',
        ];
    
        $msg = 'Parking added successfully';
        $parking = new Parking();
    
        if ($request->id) {
            $parking = Parking::withTrashed()->find($request->id);
            $msg = 'Parking Updated';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $parking->building_id = $request->building_id;
        $parking->block_id = $request->block_id;
        $parking->name = $request->name;
        $parking->status = $request->status;
        $parking->save();
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $parking = Parking::where('id',$id)->where('building_id',Auth::User()->building_id)->withTrashed()->first();
        if(!$parking){
            return redirect()->route('parking.index');
        }
        return view('admin.parking.show',compact('parking'));
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
        $parking = Parking::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $parking->delete();
        }else{
            $parking->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function get_parkings(Request $request)
    {
        $block_id = $request->block_id;
        $parking_id = $request->parking_id;
        $parkings = Parking::where('block_id',$block_id)->where('status','Active')->get();
        return view('partials.parkings',compact('parkings','parking_id'));
        
    }
}
