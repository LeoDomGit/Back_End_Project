<?php

namespace Leo\Carts\Controllers;

use App\Http\Controllers\Controller;
use Leo\Carts\Models\Carts;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $carts = Carts::join('customers','carts.id_customer','=','customers.id')
        ->join('products','carts.id_product','=','products.id')
        ->Join('gallery','gallery.id_parent','=','products.id')
        ->where('customers.id',$id)
        ->where('gallery.status',1)
        ->select('products.*','gallery.image as image','carts.id as id_cart','carts.quantity as quantity')
        ->get();
        return response()->json($carts);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_customer' => 'required|exists:customers,id',
            'id_product' => 'required|exists:products,id',
            'quantity' => 'integer|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json(['check'=>false,'error' => $validator->errors()->first()], 200);
        }

        $cart=Carts::where('id_customer',$request->id_customer)
        ->where('id_product',$request->id_product)->first();
        if($cart){
            $data=$request->all();
            if(!$request->quantity){
                $data['quantity']=$cart->quantity+1;
            }
            $cart->update($data);
        }else{
            $data=$request->all();
            if(!$request->quantity){
                $data['quantity']=1;
            }
            Carts::create($data);
        }
        $carts = Carts::join('customers','carts.id_customer','=','customers.id')
        ->join('products','carts.id_product','=','products.id')
        ->Join('gallery','gallery.id_parent','=','products.id')
        ->where('customers.id',$request->id_customer)
        ->where('gallery.status',1)
        ->select('products.*','gallery.image as image','carts.id as id_cart','carts.quantity as quantity')
        ->get();
        return response()->json(['check'=>true,'cart'=>$carts], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $cart = Carts::with(['customer', 'product'])->find($id);

        if (!$cart) {
            return response()->json(['error' => 'Cart not found'], 404);
        }

        return response()->json($cart);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'id_customer' => 'sometimes|exists:customers,id',
            'id_product' => 'sometimes|exists:products,id',
            'quantity' => 'sometimes|integer|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $cart = Carts::find($id);

        if (!$cart) {
            return response()->json(['error' => 'Cart not found'], 404);
        }

        $cart->update($request->all());
        return response()->json($cart);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $cart = Carts::find($id);

        if (!$cart) {
            return response()->json(['error' => 'Cart not found'], 404);
        }
        $id_customer=$cart->id_customer;
        $cart->delete();
        $carts = Carts::join('customers','carts.id_customer','=','customers.id')
        ->join('products','carts.id_product','=','products.id')
        ->Join('gallery','gallery.id_parent','=','products.id')
        ->where('customers.id',$id_customer)
        ->where('gallery.status',1)
        ->select('products.*','gallery.image as image','carts.id as id_cart','carts.quantity as quantity')
        ->get();
        return response()->json(['check'=>true,'cart'=>$carts], 201);
    }
}
