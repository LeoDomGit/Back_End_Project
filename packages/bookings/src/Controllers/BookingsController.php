<?php

namespace KhanhDuy\Bookings\Controllers;

use Inertia\Inertia;
use Illuminate\Http\Request;
use Leo\Services\Models\Services;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use KhanhDuy\Bookings\Models\Booking;
use Illuminate\Support\Facades\Validator;
use Leo\Customers\Models\Customers;

class BookingsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Booking::with('customer', 'service', 'user')->get();
        $services = Services::active()->select('id', 'name')->get();
        $customer = Customers::where('status', 1)->select('id', 'name')->get();
        return Inertia::render('Bookings/Index', ['bookings' => $data, 'services' => $services, 'customer' => $customer]);
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
            'customer' => 'required|integer|min:1',
            'service' => 'required|integer|min:1',
            'date' => 'required',
            'time' => 'required',
            'end_time' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors()->first());
        }

        $created = Booking::create([
            'id_user' => Auth::user()->id,
            'id_customer' => $request->customer,
            'id_service' => $request->service,
            'time' => $request->date . ' ' . $request->time,
            'end_time' => $request->date . ' ' . $request->end_time,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        if ($created) {
            $booking = Booking::with('customer', 'service', 'user')->get();
            return response()->json(['check' => true, 'msg' => 'Đặt lịch thành công', 'data' => $booking]);
        } else {
            return response()->json(['check' => false, 'msg' => 'Đặt lịch thất bại']);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $booking = Booking::findOrFail($id);
        if ($booking) {
            $booking->delete();
            $booking = Booking::with('customer', 'service', 'user')->get();
            return response()->json(['check' => true, 'msg' => 'Xoá lịch thành công', 'data' => $booking]);
        } else {
            return response()->json(['check' => false, 'msg' => 'Xoá lịch thất bại']);
        }
    }
}
