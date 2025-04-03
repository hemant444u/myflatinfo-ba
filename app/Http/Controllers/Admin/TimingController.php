<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Timing;

class TimingController extends Controller
{

    public function index()
    {
        $timings = Timing::where('building_id',Auth::User()->building_id)->orderBy('id','asc')->withTrashed()->get();
        return view('admin.timing.index',compact('timings'));
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $rules = [
            'facility_id' => 'required|exists:facilities,id',
            'from' => 'required',
            'to' => 'required',
            'status' => 'required|in:Active,Inactive',
        ];
    
        $msg = 'Timing added successfully';
        $timing = new Timing();
    
        if ($request->id) {
            $timing = Timing::withTrashed()->find($request->id);
            $msg = 'Timing Updated';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $timing->facility_id = $request->facility_id;
        $timing->from = $request->from;
        $timing->to = $request->to;
        $timing->status = $request->status;
        $timing->save();
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $timing = Timing::where('id',$id)->withTrashed()->first();
        if(!$timing){
            return redirect()->route('timing.index');
        }
        return view('admin.timing.show',compact('timing'));
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
        $timing = Timing::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $timing->delete();
        }else{
            $timing->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
}
