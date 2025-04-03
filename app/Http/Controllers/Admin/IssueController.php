<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Issue;
use App\Models\Building;
use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class IssueController extends Controller
{

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.issue.index',compact('building'));
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $rules = [
            'id' => 'required|exists:issues,id',
            'status' => 'required|in:Pending,Solved',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $issue = Issue::find($request->id);
        $issue->status = $request->status;
        $issue->save();
        
        return redirect()->back()->with('success','Issue updated successfully');
    }

    public function show($id)
    {
        $issue = Issue::where('id',$id)->withTrashed()->first();
        if(!$issue){
            return redirect()->route('issue.index');
        }
        return view('admin.issue.show',compact('issue'));
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
        $issue = Issue::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $issue->delete();
        }else{
            $issue->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function update_issue_status(Request $request)
    {
        $issue = Issue::where('id',$request->id)->withTrashed()->first();
        if($issue->status == 'Solved'){
            $issue->status = 'Pending';
        }else{
            $issue->status = 'Solved';
        }
        $issue->save();
        return response()->json([
            'msg' => 'success'
        ],200);
    }
}
