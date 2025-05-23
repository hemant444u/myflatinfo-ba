<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Block;
use App\Models\Building;
use App\Models\Flat;
use \Auth;
use Illuminate\Support\Str;

class FlatController extends Controller
{

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.flat.index',compact('building'));
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $rules = [
            'block_id' => 'required|exists:blocks,id',
            'name' => 'required',
            'area' => 'required',
            'corpus_fund' => 'required',
            'owner_id' => 'nullable|exists:users,id',
            'tanent_id' => 'nullable|exists:users,id',
            'status' => 'required|in:Inactive,Active',
            'sold_out' => 'required|in:Yes,No',
            'living_status' => 'required|in:Vacant,Owner,Tanent',
        ];
    
        $msg = 'Block Added';
        $flat = new Flat();
    
        if ($request->id) {
            $flat = Flat::withTrashed()->find($request->id);
            $msg = 'Flat Updated';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $flat->building_id = Auth::User()->building_id;
        $flat->block_id = $request->block_id;
        $flat->name = $request->name;
        $flat->area = $request->area;
        $flat->corpus_fund = $request->corpus_fund;
        $flat->status = $request->status;
        $flat->sold_out = $request->sold_out;
        $flat->living_status = $request->living_status;
        if($request->sold_out == 'No'){
            $flat->owner_id = Null;
            $flat->tanent_id = Null;
        }
        if($request->sold_out == 'Yes' && $request->living_status == 'Owner'){
            $flat->owner_id = $request->owner_id;
            $flat->tanent_id = Null;
        }
        if($request->sold_out == 'Yes' && $request->living_status == 'Tanent'){
            $flat->owner_id = $request->owner_id;
            $flat->tanent_id = $request->tanent_id;
        }
        if($request->sold_out == 'Yes' && $request->living_status == 'Vacant'){
            $flat->owner_id = $request->owner_id;
            $flat->tanent_id = Null;
        }
        $flat->save();
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $flat = Flat::where('id',$id)->where('building_id',Auth::User()->building_id)->withTrashed()->first();
        if(!$flat){
            return redirect()->route('flat.index');
        }
        return view('admin.flat.show',compact('flat'));
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
        $flat = Flat::where('id',$request->id)->withTrashed()->first();
        if($request->action == 'delete'){
            $flat->delete();
        }else{
            $flat->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function update_flat_status(Request $request)
    {
        $flat = Flat::where('id',$request->id)->withTrashed()->first();
        if($flat->status == 'Active'){
            $flat->status = 'Inactive';
        }else{
            $flat->status = 'Active';
        }
        $flat->save();
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function getFlats($blockId)
    {
        $flats = Flat::where('block_id', $blockId)->get();
        return response()->json(['success' => true, 'flats' => $flats]);
    }

    public function update_corpus_fund(Request $request)
    {
        $rules = [
            'id' => 'required|exists:flats,id',
            'corpus_fund' => 'required',
            'is_corpus_paid' => 'required',
            'corpus_paid_on' => 'nullable',
        ];
    
        $msg = 'Corpus fund Added';
        $flat = Flat::withTrashed()->find($request->id);
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }

        $flat->corpus_fund = $request->corpus_fund;
        $flat->is_corpus_paid = $request->is_corpus_paid;
        $flat->corpus_paid_on = $request->corpus_paid_on;
        if($flat->bill_no == Null || $flat->bill_no == ''){
            $flat->bill_no = Str::random(16);
        }
        if($request->is_corpus_paid == 'No')
        {
            $flat->corpus_paid_on = NULL;
            $flat->bill_no = Null;
        }
        $flat->save();
        
        return redirect()->back()->with('success', $msg);
    }
}
