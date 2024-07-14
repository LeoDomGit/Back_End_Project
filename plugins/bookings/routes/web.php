<?php

use Illuminate\Support\Facades\Route;
use KhanhDuy\Bookings\Controllers\BookingsController;

Route::resource('api/booking', BookingsController::class)->middleware("web");
