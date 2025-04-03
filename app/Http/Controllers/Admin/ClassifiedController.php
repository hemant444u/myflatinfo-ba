<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Building;
use App\Models\User;
use App\Models\BuildingUser;
use App\Models\Classified;

use \Auth;

use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ClassifiedController extends Controller
{

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.classified.index',compact('building'));
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $rules = [
            // 'building_id' => 'required|exists:buildings,id',
            // 'block_id' => 'required|exists:blocks,id',
            // 'flat_id' => 'required|exists:flats,id',
            // 'title' => 'required',
            // 'desc' => 'required',
            // 'from_time' => 'required',
            // 'to_time' => 'required',
            // 'category' => 'required|in:',
            'status' => 'required|in:Approved,Rejected,Send For Editing',
            // 'image' => 'nullable|image|max:2048',
        ];
    
        $msg = 'Classified added Susccessfully';
        $classified = new Classified();
    
        if ($request->id) {
            $classified = Classified::withTrashed()->find($request->id);
            $msg = 'Classified updated Susccessfully';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        
        // $classified->building_id = $request->building_id;
        // $classified->block_id = $request->block_id;
        // $classified->flat_id = $request->flat_id;
        // $classified->category = $request->category;
        // $classified->user_id = Auth::User()->id;
        // $classified->title = $request->title;
        // $classified->desc = $request->desc;
        // $classified->from_time = $request->from_time;
        // $classified->to_time = $request->to_time;
        $classified->status = $request->status;
        $classified->save();
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $classified = Classified::where('id',$id)->withTrashed()->first();
        if(!$classified){
            return redirect()->route('classified.index');
        }
        return view('admin.classified.show',compact('classified'));
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
        $classified = Classified::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $classified->delete();
        }else{
            $classified->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
}
