<?php

namespace Leo\Permissions\Controllers;

use App\Http\Controllers\Controller;
use Leo\Permissions\Models\Permission;
use App\Traits\HasCrud;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Validator;

class PermissionController extends Controller
{
    use HasCrud;

    public function index()
    {
        $data=Permission::all();
        return Inertia::render('Permission/Index',['permissions'=>$data]);
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
