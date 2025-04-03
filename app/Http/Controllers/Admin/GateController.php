<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Gate;
use \Auth;

class GateController extends Controller
{

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.gate.index',compact('building'));
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
    
        $msg = 'Gate added successfully';
        $gate = new Gate();
    
        if ($request->id) {
            $gate = Gate::withTrashed()->find($request->id);
            $msg = 'Gate Updated';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $gate->building_id = $request->building_id;
        $gate->block_id = $request->block_id;
        $gate->name = $request->name;
        $gate->status = $request->status;
        $gate->save();
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $gate = Gate::where('id',$id)->where('building_id',Auth::User()->building_id)->withTrashed()->first();
        if(!$gate){
            return redirect()->route('gate.index');
        }
        return view('admin.gate.show',compact('gate'));
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
        $gate = Gate::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $gate->delete();
        }else{
            $gate->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function get_gates(Request $request)
    {
        $block_id = $request->block_id;
        $gate_id = $request->gate_id;
        $gates = Gate::where('block_id',$block_id)->where('status','Active')->get();
        return view('partials.gates',compact('gates','gate_id'));
        
    }
}
