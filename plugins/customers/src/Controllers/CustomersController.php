<?php

namespace Leo\Customers\Controllers;

use Leo\Customers\Models\Customers;
use Illuminate\Http\Request;
use Leo\Customers\Requests\CustomerRequest;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use Leo\Customers\Mail\createUser;
use Illuminate\Support\Facades\Auth;
use Leo\Bills\Models\Bills;

class CustomersController 
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function get_bills(Request $request)
    {
        $bills = Bills::with(['details.product'])
        ->where('email',Auth::user()->email)
        ->get()
        ->map(function ($bill) {
            $total = $bill->details->reduce(function ($carry, $detail) {
                $productDiscount = $detail->product->discount;
                $quantity = $detail->quantity;
                return $carry + ($productDiscount * $quantity);
            }, 0);
            $bill->total = $total;
            return $bill;
        });
        return response ()->json($bills);
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(CustomerRequest $request)
    {
        $request->validated();
        $data['name']=$request->name;
        $data['email']=$request->email;
        $data['password']=Hash::make($request->password);
        Customers::create($data);
        return response()->json(['check'=>true]);
    }

    // ==============================
    public function CheckLogin(Request $request){
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:customers,email',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }

        if (Auth::guard('customer')->attempt(['email' => $request->email, 'password' => $request->password,'status'=>1], true)) {
            $customer = Auth::guard('customer')->user();
            $customer->tokens()->delete();
            $token = $customer->createToken('CustomerToken')->plainTextToken;
            return response()->json([
                'check' => true,
                'id'=>$customer->id,
                'token' => $token,
            ]);
        }
    }
    /**
     * Display the specified resource.
     */
    public function show(Customers $customers)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Customers $customers)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Customers $customers,$id)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'email|unique:customers,email',
            'name' => 'unique:customers,name',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $customer= Customers::where('id',$id)->first();
        if(!$customer){
            return response()->json(['check'=>false,'msg'=>'Tài khoản không tồn tại']);
        }
        $data= $request->all();
        $data['updated_at']= now();
        Customers::where('id',$id)->update($data);
        return response()->json(['check'=>true]);
    }
    /**
     * Update the specified resource in storage.
     */
    public function resetPassword (Request $request,Customers $customers)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|exists:customers,email',
        ],[
            'email.required'=>'Chưa nhận được email',
            'email.email'=>'Email không hợp lệ',
            'email.exists'=>'Email không tồn tại',
        ]);
        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $customer = Customers::where('email',$request->email)->first();
        $password= random_int(1000,9999);
        $customer->update(['password'=>Hash::make($password)]);
        $data = [
            'email' => $customer->email,
            'password' => $password,
        ];
        Mail::to($customer->email)->send(new createUser($data));
        return response()->json(['check'=>true]);
    }
    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Customers $customers)
    {
        //
    }
}
