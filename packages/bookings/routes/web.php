<?php

use Illuminate\Support\Facades\Route;
use Leo\Bookings\Controllers\BookingController;

Route::apiResource('api/bookings', BookingController::class);
Route::apiResource('bookings', BookingController::class);
