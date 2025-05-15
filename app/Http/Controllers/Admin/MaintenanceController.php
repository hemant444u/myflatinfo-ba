<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Maintenance;
use App\Models\MaintenancePayment;
use App\Models\Building;
use App\Models\Flat;
use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class MaintenanceController extends Controller
{

    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $user = Auth::user();

            if ($user && $user->building && $user->building->maintenance_is_active === 'No') {
                return redirect()->back()->with('error', 'Maintenance function is Inactive');
            }

            return $next($request);
        });
    }

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.maintenance.index',compact('building'));
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $rules = [
            'building_id' => 'required|exists:buildings,id',
            'from_date' => 'required',
            'to_date' => 'required',
            'to_date' => 'required',
            'amount' => 'required',
            'vacant_amount' => 'required',
            'maintenance_type' => 'required',
            'due_date' => 'required',
            'late_fine_type' => 'required',
            'late_fine_value' => 'required',
            'status' => 'required|in:Active,Inactive',
        ];
    
        $msg = 'Maintenance added Susccessfully';
        $maintenance = new Maintenance();
    
        if ($request->id) {
            $maintenance = Maintenance::withTrashed()->find($request->id);
            $msg = 'Maintenance udated Susccessfully';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $user = Auth::User();
        $maintenance->user_id = $user->id;
        $maintenance->building_id = $user->building_id;
        $maintenance->from_date = $request->from_date;
        $maintenance->to_date = $request->to_date;
        $maintenance->amount = $request->amount;
        $maintenance->vacant_amount = $request->vacant_amount;
        $maintenance->maintenance_type = $request->maintenance_type;
        $maintenance->due_date = $request->due_date;
        $maintenance->late_fine_type = $request->late_fine_type;
        $maintenance->late_fine_value = $request->late_fine_value;
        $maintenance->status = $request->status;
        $maintenance->save();
        
        foreach($user->building->flats as $flat)
        {
            if($flat->sold_out == 'Yes'){

                $maintenance_payment = new MaintenancePayment();
                $maintenance_payment->maintenance_id = $maintenance->id;
                $maintenance_payment->building_id = $maintenance->building_id;
                $maintenance_payment->flat_id = $flat->id;
                $maintenance_payment->user_id = $user->id;
                $maintenance_payment->paid_amount = 0;
                $maintenance_payment->dues_amount = $maintenance->amount;
                if($maintenance->maintenance_type == 'Areawise'){
                    if($flat->living_status == 'Vacant'){
                        $maintenance_payment->dues_amount = $flat->area * $request->vacant_amount;
                    }else{
                        $maintenance_payment->dues_amount = $flat->area * $request->amount;
                    }
                }else{
                    if($flat->living_status == 'Vacant'){
                        $maintenance_payment->dues_amount = $request->vacant_amount;
                    }else{
                        $maintenance_payment->dues_amount = $request->amount;
                    }
                }
                $maintenance_payment->late_fine = 0;
                $maintenance_payment->type = 'Created';
                $maintenance_payment->status = 'Unpaid';
                $maintenance_payment->save();
            }
        }
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $user = Auth::User();
        $maintenance = Maintenance::where('id',$id)->where('building_id',$user->building_id)->withTrashed()->first();
        if(!$maintenance){
            return redirect()->route('maintenance.index');
        }
        return view('admin.maintenance.show',compact('maintenance'));
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
        $maintenance = Maintenance::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $maintenance->delete();
        }else{
            $maintenance->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function update_maintenance_status(Request $request)
    {
        $maintenance = Maintenance::where('id',$request->id)->withTrashed()->first();
        if($maintenance->status == 'Active'){
            $maintenance->status = 'Inactive';
        }else{
            $maintenance->status = 'Active';
        }
        $maintenance->save();
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function store_maintenance_payment(Request $request)
    {
        $rules = [
            'flat_id' => 'required|exists:flats,id',
            'maintenance_id' => 'required|exists:maintenances,id',
            'amount' => 'required',
            'type' => 'required|in:Cash,Online,Created',
            'status' => 'required|in:Paid,Unpaid',
        ];
    
        $msg = 'Maintenance payment added Susccessfully';
        $maintenance_payment = new MaintenancePayment();
    
        if ($request->id) {
            $maintenance_payment = MaintenancePayment::withTrashed()->find($request->id);
            $msg = 'Maintenance payment udated Susccessfully';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $user = Auth::User();
        $flat = Flat::find($request->flat_id);
        $maintenance_payment->user_id = $user->id;
        $maintenance_payment->building_id = $flat->building_id;
        $maintenance_payment->flat_id = $flat->id;
        $maintenance_payment->maintenance_id = $request->maintenance_id;
        $maintenance_payment->paid_amount = $request->amount;
        $maintenance_payment->dues_amount = $request->dues_amount - $request->amount;
        $maintenance_payment->late_fine = $request->late_fine;
        $maintenance_payment->status = $request->status;
        $maintenance_payment->save();
    
        return redirect()->back()->with('success', $msg);
    }

}
