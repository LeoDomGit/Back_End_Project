<?php

namespace Leo\Services\Controllers;

use Leo\Services\Models\Services;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Traits\HasCrud;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Leo\ServicesCollections\Models\ServicesCollections;
class ServicesController 
{
    use HasCrud;
    protected $model;
    /**
     * Display a listing of the resource.
     */
    public function __construct()
    {
        $this->model = Services::class;
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $services=Services::all();
        $collections=ServicesCollections::active()->select('id','name')->get();
        return Inertia::render('Services/Index',['services'=>$services,'collections'=>$collections]);
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
            'name' => 'required',
            'price' => 'required|min:0',
            'compare_price' => 'required|min:0',
            'discount' => 'required|min:0',
            'id_collections' => 'required|exists:service_collections,id',
            'summary' => 'required',
            'image' => 'required',
            'content' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $data['name']=$request->name;
        $data['slug']=Str::slug($request->name);
        $data['price']=$request->price;
        $data['compare_price']=$request->compare_price;
        $data['discount']=$request->discount;
        $data['summary']=$request->summary;
        $data['summary']=$request->summary;
        $data['content']=$request->content;
        $file=$request->file('image');
        $imageName = $file->getClientOriginalName();
        $extractTo = storage_path('app/public/services/');
        $file->move($extractTo, $imageName);
        $data['image']=$imageName;
        $data['created_at']=now();
        Services::create($data);
        $services=Services::all();
        return response()->json(['check'=>true,'data'=>$services]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Services $services,$id)
    {
        $services=Services::find($id);
        $collections=ServicesCollections::active()->select('id','name')->get();
        return Inertia::render('Services/Edit',['collections'=>$collections,'service'=>$services]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Services $services,$id)
    {

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $service = Services::find($id);
        if (!$service) {
            return response()->json(['check' => false, 'msg' => 'Không tìm thấy mã dịch vụ']);
        }
    
        $data = $request->all();
    
        if ($request->has('name')) {
            $data['slug'] = Str::slug($request->name);
        }
    
        if ($request->hasFile('image')) {
            if ($service->image) {
                $oldImagePath = storage_path('app/public/services/' . $service->image);
                if (Storage::exists('public/services/' . $service->image)) {
                    Storage::delete('public/services/' . $service->image);
                }
            }
    
            // Store the new image
            $file = $request->file('image');
            $imageName = $file->getClientOriginalName();
            $file->storeAs('public/services', $imageName);
            $data['image'] = $imageName;
        }
        $data['updated_at'] = now();
    
        $service->update($data);
    
        $services = Services::all();
        return response()->json(['check' => true, 'data' => $services]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Services $services)
    {
        //
    }
}
