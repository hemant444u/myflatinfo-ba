<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Guard;
use \Auth;

class GuardController extends Controller
{

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.guard.index',compact('building'));
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
            'gate_id' => 'required|exists:gates,id',
            'user_id' => 'required|exists:users,id',
            'gate_id' => 'required|exists:gates,id',
            'shift' => 'required|in:Day,Night',
            'status' => 'required|in:Active,Inactive',
        ];
    
        $msg = 'Guard added successfully';
        $guard = new Guard();
    
        if ($request->id) {
            $guard = Guard::withTrashed()->find($request->id);
            $msg = 'Guard Updated';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $guard->building_id = $request->building_id;
        $guard->block_id = $request->block_id;
        $guard->gate_id = $request->gate_id;
        $guard->user_id = $request->user_id;
        $guard->shift = $request->shift;
        $guard->status = $request->status;
        $guard->save();
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $guard = Guard::where('id',$id)->where('building_id',Auth::User()->building_id)->withTrashed()->first();
        if(!$guard){
            return redirect()->route('guard.index');
        }
        return view('admin.guard.show',compact('guard'));
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
        $guard = Guard::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $guard->delete();
        }else{
            $guard->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
}
