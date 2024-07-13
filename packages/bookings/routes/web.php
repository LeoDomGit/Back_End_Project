<?php

use Illuminate\Support\Facades\Route;
use KhanhDuy\Bookings\Controllers\BookingsController;

Route::resource('booking', BookingsController::class);
