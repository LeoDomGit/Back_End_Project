<?php

namespace Leo\Brands\Controllers;

use App\Http\Controllers\Controller;
use Leo\Brands\Models\Brands;
use Leo\Categories\Models\Categories;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class BrandsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $brands= Brands::all();
        return Inertia::render("Brands/Index",['brands'=>$brands]);
    }

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
            'name' => 'required|unique:brands,name',
          
        ], [
            'name.required' => 'Chưa nhận được thương hiệu',
            'name.unique' => 'Thương hiệu bị trùng',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $data = $request->all();
        $data['slug']= Str::slug($request->name);
        Brands::create($data);
        $brands= Brands::all();
        return response()->json(['check'=> true,'data'=> $brands]);
    }

    /**
     * Display the specified resource.
     */
    public function api_index(Brands $categories)
    {
        return response()->json(Brands::active()->orderBy('id','asc')->get());
    }
    public function api_show(Brands $categories, $id)
    {
        return response()->json(Brands::active()->where('slug',$id)->with('products.gallery')->get());
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Categories $categories)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Categories $categories,$id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'unique:brands,name',
          
        ], [
            'name.required' => 'Chưa nhận được loại tài khoản',
            'name.unique' => 'Loại tài khoản bị trùng',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $data = $request->all();
        if($request->has('name')){
            $data['slug']= Str::slug($request->name);
        }
        Brands::where('id',$id)->update($data);
        $brands=Brands::all();
        return response()->json(['check'=> true,'data'=> $brands]);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Brands $brands, $id)
    {
        $brand = Brands::find($id);
        if(!$brand){
            return response()->json(['check'=> true,'msg'=>'Không tìm được thương hiệu']);
        }
        $brand->delete();
        $brands=Brands::all();
        return response()->json(['check'=> true,'data'=> $brands]);
    }
}
