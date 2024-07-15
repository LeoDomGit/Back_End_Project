<?php

namespace Leo\Bookings\Controllers;

use Carbon\Carbon;
use Inertia\Inertia;
use Illuminate\Http\Request;
use App\Events\BookingCreated;
use Leo\Bookings\Models\Bookings;
use Leo\Customers\Models\Customers;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class BookingController extends Controller
{
    // List all bookings
    public function index()
    {
        $bookings = Bookings::with(['user', 'customer', 'service'])->get();
        return Inertia::render('Bookings/Index', ['bookings' => $bookings]);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'phone' => 'required|string|max:255',
            'email' => 'required|email',
            'time' => 'required|date_format:Y-m-d H:i:s',
            'id_service' => 'required|exists:services,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['check' => false, 'msg' => $validator->errors()->first()]);
        }
        $customer = Customers::where('email', $request->email)->first();
        if ($customer) {
            $id_customer = $customer->id;
        } else {
            $data['name'] = $request->name;
            $data['email'] = $request->email;
            $data['password'] = Hash::make($request->password);
            $id_customer = Customers::insertGetId($data);
        }

        $booking = Bookings::create([
            'id_user' => $request->user()->id ?? null,
            'id_customer' => $id_customer,
            'id_service' => $request->id_service,
            'time' => $request->time,
            'end_time' => Carbon::parse($request->time)->addHour(),
        ]);
        // BookingCreated::dispatch($booking);
        return response()->json($booking, 200);
    }

    public function show($id)
    {
        $booking = Bookings::with(['user', 'customer', 'service'])->findOrFail($id);
        return response()->json($booking);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'time' => 'sometimes|required|date_format:Y-m-d H:i:s',
            'id_service' => 'sometimes|required|exists:services,id',
        ]);

        $booking = Bookings::findOrFail($id);

        if ($request->has('time')) {
            $booking->time = $request->time;
            $booking->end_time = Carbon::parse($request->time)->addHour();
        }

        if ($request->has('id_service')) {
            $booking->id_service = $request->id_service;
        }

        $booking->save();

        return response()->json($booking);
    }

    public function destroy($id)
    {
        $booking = Bookings::findOrFail($id);
        $booking->delete();

        return response()->json(null, 204);
    }
}
