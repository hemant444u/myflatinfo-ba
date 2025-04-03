<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Facility;
use App\Models\Building;
use App\Models\Vehicle;
use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class VehicleController extends Controller
{

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.vehicle.index',compact('building'));
    }
    
    public function vehicle_inouts()
    {
        $building = Auth::User()->building;
        return view('admin.vehicle.inouts',compact('building'));
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show($id)
    {
        $vehicle = Vehicle::where('id',$id)->where('building_id',Auth::User()->building_id)->withTrashed()->first();
        if(!$vehicle){
            return redirect()->route('vehicle.index');
        }
        return view('admin.vehicle.show',compact('vehicle'));
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
        $vehicle = Vehicle::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $vehicle->delete();
        }else{
            $vehicle->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
}
