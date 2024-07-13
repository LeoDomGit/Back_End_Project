<?php

namespace Leo\Permissions\Controllers;

use App\Http\Controllers\Controller;
use Leo\Permissions\Models\Permission;
use Leo\Permissions\Models\RoleHasPermission;
use App\Traits\HasCrud;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Leo\Roles\Models\Roles;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
class PermissionController extends Controller
{
    use HasCrud;

    public function index()
    {
        $data=Permission::all();
        $roles=Roles::all();
        return Inertia::render('Permission/Index',['permissions'=>$data,'roles'=>$roles]);
    }
  /**
     * Show the form for creating a new resource.
     */
    public function get_permissions($id){ 
        $permissions = RoleHasPermission::where('role_id', $id)->pluck('permission_id');
        return response()->json(['permissions'=>$permissions]);
    }
    /**
     * Show the form for creating a new resource.
     */
    public function role_permission(Request $request){
        $validator = Validator::make($request->all(), [
            'role' => 'required|exists:roles,id',
            'permissions'=>'required|array',
            'permissions.*'=>'exists:permissions,id'
        ], [
            'role.required' => 'Chưa có loại tài khoản',
            'role.exists' => 'Mã loại tài khoản không hợp lệ',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        DB::table('role_has_permissions')
        ->where('role_id', $request->role)
        ->delete();
        foreach ($request->permissions as $value) {
            DB::table('role_has_permissions')->insert([
                'role_id' => $request->role,
                'permission_id' => $value
            ]);
        }
        $permissions = DB::table('role_has_permissions')
            ->where('role_id', $request->role)
            ->pluck('permission_id');

        return response()->json(['check'=>true,'permissions' => $permissions]);
    }
    /**
     * Show the form for creating a new resource.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:permissions,name',
          
        ], [
            'name.required' => 'Chưa nhận được quyền tài khoản',
            'name.unique' => 'Quyền tài khoản bị trùng',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $data = $request->all();
        $result =$this->storeTraits(Permission::class, $data);
        return response()->json(['check'=>true,'data'=>$result]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'unique:permissions,name',
          
        ], [
            'name.required' => 'Chưa nhận được quyền tài khoản',
            'name.unique' => 'Quyền tài khoản bị trùng',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $data = $request->all();
        $result= $this->updateTraits(Permission::class, $id, $data);
        return response()->json(['check'=> true,'data'=> $result]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $permission= Permission::find($id);
        if(!$permission){
            return response()->json(['check'=>false,'msg'=>'Không tìm thấy mã permission']);
        }
        $result= $this->destroyTraits(Permission::class, $id);
        if(count($result)>0){
            return response()->json(['check'=>true,'data'=>$result]);
        }
        return response()->json(['check'=>true]);

    }
}
