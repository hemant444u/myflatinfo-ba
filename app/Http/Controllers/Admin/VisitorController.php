<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Facility;
use App\Models\Building;
use App\Models\Visitor;
use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class VisitorController extends Controller
{

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.visitor.index',compact('building'));
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
        $visitor = Visitor::where('id',$id)->where('building_id',Auth::User()->building_id)->withTrashed()->first();
        if(!$visitor){
            return redirect()->route('visitor.index');
        }
        return view('admin.visitor.show',compact('visitor'));
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
        $visitor = Visitor::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $visitor->delete();
        }else{
            $visitor->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
}
