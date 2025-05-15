<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Essential;
use App\Models\EssentialPayment;
use App\Models\Building;
use App\Models\Flat;
use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class EssentialController extends Controller
{

    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $user = Auth::user();

            if ($user && $user->building && $user->building->other_is_active === 'No') {
                return redirect()->back()->with('error', 'Essential function is Inactive');
            }

            return $next($request);
        });
    }

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.essential.index',compact('building'));
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $rules = [
            'building_id' => 'required|exists:buildings,id',
            'reason' => 'required',
            'amount' => 'required',
            'status' => 'required|in:Active,Inactive',
        ];
    
        $msg = 'Essential added Susccessfully';
        $essential = new Essential();
    
        if ($request->id) {
            $essential = Essential::withTrashed()->find($request->id);
            $msg = 'Essential udated Susccessfully';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $user = Auth::User();
        $essential->user_id = $user->id;
        $essential->building_id = $user->building_id;
        $essential->reason = $request->reason;
        $essential->amount = $request->amount;
        $essential->status = $request->status;
        $essential->save();
        
        foreach($user->building->flats as $flat)
        {
            $essential_payment = new EssentialPayment();
            $essential_payment->essential_id = $essential->id;
            $essential_payment->building_id = $essential->building_id;
            $essential_payment->flat_id = $flat->id;
            $essential_payment->user_id = $flat->tanent_id;
            $essential_payment->paid_amount = 0;
            $essential_payment->dues_amount = $essential->amount;
            $essential_payment->type = 'Created';
            $essential_payment->status = 'Unpaid';
            $essential_payment->save();
        }
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $user = Auth::User();
        $essential = Essential::where('id',$id)->where('building_id',$user->building_id)->withTrashed()->first();
        if(!$essential){
            return redirect()->route('essential.index');
        }
        return view('admin.essential.show',compact('essential'));
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
        $essential = Essential::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $essential->delete();
        }else{
            $essential->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function update_maintenance_status(Request $request)
    {
        $essential = Essential::where('id',$request->id)->withTrashed()->first();
        if($essential->status == 'Active'){
            $essential->status = 'Inactive';
        }else{
            $essential->status = 'Active';
        }
        $essential->save();
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function store_essential_payment(Request $request)
    {
        $rules = [
            'flat_id' => 'required|exists:flats,id',
            'essential_id' => 'required|exists:essentials,id',
            'amount' => 'required',
            'type' => 'required|in:Cash,Online,Created',
            'status' => 'required|in:Paid,Unpaid',
        ];
    
        $msg = 'Essential payment added Susccessfully';
        $essential_payment = new EssentialPayment();
    
        if ($request->id) {
            $essential_payment = EssentialPayment::withTrashed()->find($request->id);
            $msg = 'Essential payment udated Susccessfully';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $flat = Flat::find($request->flat_id);
        $essential_payment->user_id = $request->user_id;
        $essential_payment->building_id = $flat->building_id;
        $essential_payment->flat_id = $flat->id;
        $essential_payment->essential_id = $request->essential_id;
        $essential_payment->paid_amount = $request->amount;
        $essential_payment->dues_amount = $request->dues_amount;
        $essential_payment->status = $request->status;
        $essential_payment->save();
    
        return redirect()->back()->with('success', $msg);
    }

}
