<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Event;
use App\Models\Building;
use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Cache;

class EventController extends Controller
{

    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $user = Auth::user();

            if ($user && $user->building && $user->building->donation_is_active === 'No') {
                return redirect()->back()->with('error', 'Event or Donation function is Inactive');
            }

            return $next($request);
        });
    }

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.event.index',compact('building'));
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
            'desc' => 'required',
            'from_time' => 'required',
            'to_time' => 'required',
            'to_time' => 'required|in:Yes,No',
            'status' => 'required|in:Active,Pending',
            'image' => 'nullable|image|max:2048',
        ];
    
        $msg = 'Event added Susccessfully';
        $event = new Event();
    
        if ($request->id) {
            $event = Event::withTrashed()->find($request->id);
            $msg = 'Event updated Susccessfully';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        
        if($request->hasFile('image')) {
            $file= $request->file('image');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($event->getImageFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/events/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $event->image = $filename;
        }
        
        $event->building_id = $request->building_id;
        $event->name = $request->name;
        $event->desc = $request->desc;
        $event->from_time = $request->from_time;
        $event->to_time = $request->to_time;
        $event->is_payment_enabled = $request->is_payment_enabled;
        $event->status = $request->status;
        $event->save();
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $user = Auth::User();
        $event = Event::where('id',$id)->where('building_id',$user->building_id)->withTrashed()->first();
        if(!$event){
            return redirect()->route('event.index');
        }
        return view('admin.event.show',compact('event'));
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
        $event = Event::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $event->delete();
        }else{
            $event->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function update_event_status(Request $request)
    {
        $event = Event::where('id',$request->id)->withTrashed()->first();
        if($event->status == 'Active'){
            $event->status = 'Inactive';
        }else{
            $event->status = 'Active';
        }
        $event->save();
        return response()->json([
            'msg' => 'success'
        ],200);
    }
}
