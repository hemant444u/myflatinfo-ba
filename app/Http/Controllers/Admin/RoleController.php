<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Role;
use App\Models\Permission;
use App\Models\BuildingUser;

use \Auth;
use \DB;

class RoleController extends Controller
{

    public function index()
    {
        $building = Auth::User()->building;
        $permissions = Permission::all();
        return view('admin.role.index',compact('building','permissions'));
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
            'slug' => 'required',
            'permissions' => 'nullable|array',
            'permissions.*' => 'exists:permissions,id',
        ];
        $msg = 'Role Added';
        $role = new Role();
        
        if ($request->id) {
            $role = Role::withTrashed()->find($request->id);
            $msg = 'Role Updated';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $role->building_id = $request->building_id;
        $role->name = $request->name;
        $role->slug = $request->slug;
        $role->save();
        
        // Sync permissions (detach existing and attach new ones)
        $role->permissions()->sync($request->permissions);
    
        return redirect()->back()->with('success', $msg);
    }

    public function show($id)
    {
        $role = Role::where('id',$id)->withTrashed()->first();
        if(!$role){
            return redirect()->route('role.index');
        }
        return view('admin.role.show',compact('role'));
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
        $role = Role::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $role->delete();
        }else{
            $role->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
    
    public function getRolePermissions($id)
    {
        $role = Role::findOrFail($id);
        $permissions = $role->permissions()->pluck('id'); // Get assigned permissions
    
        return response()->json(['permissions' => $permissions]);
    }
    
    public function get_deartments($role_slug)
    {
        $role = Role::where('slug',$role_slug)->first();
        // Get the authenticated user's building_id
        $user = auth()->user();
        $buildingId = $user->building_id;
    
        $building_users = BuildingUser::where('building_id',$user->building_id)->where('role_id',$role->id)->withTrashed()->with('user')->get();
        return view('admin.role.department',compact('role','building_users'));
    }
    
    public function store_user_role(Request $request)
    {
        $rules = [
            'building_id' => 'required|exists:buildings,id',
            'role_id' => 'required|exists:roles,id',
            'user_id' => 'required|exists:users,id',
        ];
        $msg = 'Department Added';
        $building_user = new BuildingUser();
        
        if ($request->id) {
            $building_user = BuildingUser::withTrashed()->find($request->id);
            $msg = 'Department Updated';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        $building_user->building_id = $request->building_id;
        $building_user->role_id = $request->role_id;
        $building_user->user_id = $request->user_id;
        $building_user->save();
    
        return redirect()->back()->with('success', $msg);
    }
    
    public function delete_user_role(Request $request)
    {
        $building_user = BuildingUser::where('id',$request->id)->withTrashed()->first();
        if($request->action == 'delete'){
            $building_user->delete();
        }else{
            $building_user->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }

}
