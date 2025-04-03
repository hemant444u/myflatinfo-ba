<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Block;
use App\Models\Building;

use \Auth;

class BlockController extends Controller
{

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.block.index',compact('building'));
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
            'status' => 'required|in:Pending,Active',
        ];
    
        $msg = 'Block Added';
        $block = new Block();
    
        if ($request->id) {
            $block = Block::withTrashed()->find($request->id);
            $msg = 'Block Updated';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $block->building_id = $request->building_id;
        $block->name = $request->name;
        $block->status = $request->status;
        $block->save();
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $block = Block::where('id',$id)->withTrashed()->first();
        if(!$block){
            return redirect()->route('block.index');
        }
        return view('admin.block.show',compact('block'));
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
        $block = Block::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $block->delete();
        }else{
            $block->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
}
