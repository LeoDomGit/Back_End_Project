<?php

namespace Leo\ServicesCollections\Controllers;

use App\Http\Controllers\Controller;
use Leo\ServicesCollections\Models\ServicesCollections;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class ServicesCollectionsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data= ServicesCollections::all();
        return Inertia::render("ServiceCollections/Index",['collections'=>$data]);
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
            'name' => 'required|unique:service_collections,name',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $data = $request->all();
        $data['slug']= Str::slug($request->name);
        ServicesCollections::create($data);
        $data= ServicesCollections::all();
        return response()->json(['check'=> true,'data'=> $data]);
    }

    /**
     * Display the specified resource.
     */
    public function api_index(ServicesCollections $servicescollections)
    {
        return response()->json(ServicesCollections::active()->orderBy('id','asc')->get());
    }
    public function api_show(ServicesCollections $servicescollections, $id)
    {
        return response()->json(ServicesCollections::active()->where('slug',$id)->with('products.gallery')->get());
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(ServicesCollections $servicescollections)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, ServicesCollections $servicescollections,$id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'nullable|unique:service_collections,name',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $data = $request->all();
        if($request->has('name')){
            $data['slug']= Str::slug($request->name);
        }
        ServicesCollections::where('id',$id)->update($data);
        $services_collections=ServicesCollections::all();
        return response()->json(['check'=> true,'data'=> $services_collections]);

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(ServicesCollections $ServicesCollections, $id)
    {
        $brand = ServicesCollections::find($id);
        if(!$brand){
            return response()->json(['check'=> true,'msg'=>'Không tìm được thương hiệu']);
        }
        $brand->delete();
        $brands=ServicesCollections::all();
        return response()->json(['check'=> true,'data'=> $brands]);
    }
}
