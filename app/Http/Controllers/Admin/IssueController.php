<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Issue;
use App\Models\IssuePhoto;
use App\Models\Building;
use App\Models\Flat;
use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Cache;

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
            'id' => 'nullable|exists:issues,id',
            'building_id' => 'nullable|exists:buildings,id',
            'block_id' => 'nullable|exists:blocks,id',
            'flat_id' => 'nullable|exists:flats,id',
            'role_id' => 'required|exists:roles,id',
            'periority' => 'required|in:High,Medium,Low',
            'desc' => 'required',
            'photos' => 'nullable|array',
            'photos.*' => 'image|max:2048',
            'status' => 'required|in:Pending,Ongoing,Solved,Rejected',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
        $error = $validation->errors()->first();
        if ($error) {
            return response()->json([
                'error' => $error
            ], 422);
        }
        $issue = new Issue();
        $msg = 'Issue created successfully';
        if($request->id){
            $issue = Issue::find($request->id);
            $msg = 'Issue updated successfully';
        }
        $issue->building_id = $request->building_id;
        $issue->role_id = $request->role_id;
        $issue->block_id = $request->block_id;
        $issue->flat_id = $request->flat_id;
        $issue->desc = $request->desc;
        $issue->periority = $request->periority;
        $issue->status = $request->status;
        $issue->save();

        if ($request->hasFile('photos')) {
            foreach ($request->file('photos') as $file) {
                $allowedfileExtension=['jpeg','jpeg','png'];
                $extension = $file->getClientOriginalExtension();
                // Storage::disk('s3')->delete($photo->getPhotoFilenameAttribute());
                $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
                $filename = 'images/issues/' . uniqid() . '.' . $extension;
                Storage::disk('s3')->put($filename, file_get_contents($file));

                $photo = new IssuePhoto();
                $photo->issue_id = $issue->id;
                $photo->photo = $filename;
                $photo->save();
            }
        }
        
        return redirect()->back()->with('success',$msg);
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

    public function get_flats(Request $request)
    {
        $block_id = $request->block_id;
        $flat_id = $request->flat_id;
        $flats = Flat::where('block_id',$block_id)->where('status','Active')->get();
        return view('partials.flats',compact('flats','flat_id'));
        
    }
}
