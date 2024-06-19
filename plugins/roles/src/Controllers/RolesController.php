<?php

namespace Leo\Roles\Controllers;

use App\Http\Controllers\Controller;
use Leo\Roles\Models\Roles;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Validator;
class RolesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    protected $guard_name='web';
     public function index()
    {
        $roles= Roles::all();
        return Inertia::render("Roles/Index",['roles'=>$roles]);
    }

    public function getAll(){
        $roles= Roles::all();
        return response()->json(['check'=> true,'data'=> $roles]);
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|unique:roles,name',
          
        ], [
            'name.required' => 'Chưa nhận được loại tài khoản',
            'name.unique' => 'Loại tài khoản bị trùng',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        Roles::create($request->all());
        $roles= Roles::all();
        return response()->json(['check'=> true,'data'=> $roles]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Roles $roles)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Roles $roles)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Roles $roles,$id)
    {
        $validator = Validator::make($request->all(), [
            'role' => 'unique:roles,name',
          
        ], [
            'role.unique' => 'Loại tài khoản bị trùng',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $data = $request->all();
        Roles::where('id',$id)->update($data);
        $roles= Roles::all();
        return response()->json(['check'=> true,'data'=> $roles]);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Roles $roles)
    {
        //
    }
}
