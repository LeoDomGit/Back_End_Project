<?php

namespace Leo\Bills\Controllers;

use Leo\Bills\Models\Bills;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Leo\Carts\Models\Carts;
use Inertia\Inertia;
use Leo\Bills\Models\Bill_Detail;
use Illuminate\Support\Facades\Validator;

class BillsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $bills = Bills::with(['details.product'])
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
        return Inertia::render("Bills/Index",['bills'=>$bills]);

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
            'name' => 'required|max:255',
            'email' => 'required|email',
            'phone' => 'required',
            'address' => 'required',
            'cart'=>'required|array',
        ]);
        if ($validator->fails()) {
            return response()->json(['check'=>false , 'msg' => $validator->errors()->first()], 200);
        }
        $data=[];
        $data['name']=$request->name;
        $data['email']=$request->email;
        $data['phone']=$request->phone;
        $data['address']=$request->address;
        $id_hoa_don = Bills::insertGetId($data);
        foreach ($request->cart as $key => $item) {
            Bill_Detail::create(['id_hoa_don'=>$id_hoa_don,'id_product'=>$item[0],'quantity'=>$item[1]]);
        }
        return response()->json(['check'=>true]);
    }

    public function store2(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:255',
            'email' => 'required|email',
            'phone' => 'required',
            'address' => 'required',
            'id_customer'=>'required|exists:customers,id',
        ]);
        if ($validator->fails()) {
            return response()->json(['check'=>false , 'msg' => $validator->errors()->first()], 200);
        }
        $data= [];
        $data['name']=$request->name;
        $data['email']=$request->email;
        $data['phone']=$request->phone;
        $data['address']=$request->address;
        $id_hoa_don = Bills::insertGetId($data);
        $cart= Carts::where('id_customer',$request->id_customer)
        ->select('id_product','quantity')
        ->get();
        foreach ($cart as $key => $value) {
            Bill_Detail::create(['id_hoa_don'=>$id_hoa_don,'id_product'=>$value->id_product,'quantity'=>$value->quantity,'created_at'=>now()]);
        }
        Carts::where('id_customer',$request->id_customer)->delete();
        return response()->json(['check'=>true]);
    }
    /**
     * Display the specified resource.
     */
    public function show(Bills $bills,$id)
    {
        $bill = Bills::with('details.product')->find($id);
        $total = $bill->details->sum(function($detail) {
            return $detail->quantity * $detail->product->price;
        });
       $billList = Bill_Detail::with(['product','product.gallery'])->where('hoa_don_chi_tiet.id_hoa_don',$id)->select()->get();
       return Inertia::render("Bills/Detail",['total'=>$total,'bill'=>$bill,'billList'=>$billList]); 
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Bills $bills)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Bills $bills,$id)
    {
        $bill= Bills::where('id',$id)->first();
        if(!$bill){
            return response()->json(['check'=>false,'msg'=>'Không tìm thấy mã hóa đơn']);
        }
        $data=$request->all();
        $data['updated_at']=now();
        Bills::where('id',$id)->update($data);
        $bill = Bills::with('details.product')->find($id);
        $total = $bill->details->sum(function($detail) {
            return $detail->quantity * $detail->product->price;
        });
        $billList = Bill_Detail::with(['product','product.gallery'])->where('hoa_don_chi_tiet.id_hoa_don',$id)->select()->get();
        return response()->json(['check'=>true,'bill'=>$bill,'total'=>$total,'billList'=>$billList]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Bills $bills)
    {
        //
    }
}
