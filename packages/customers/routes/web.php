<?php

use Illuminate\Support\Facades\Route;
use App\Http\Middleware\CheckLogin;

use Leo\Customers\Controllers\CustomersController;


Route::middleware(['web',CheckLogin::class])->group(function () {
    Route::resource('customers', CustomersController::class);
});

Route::prefix('api')->group(function () {
    Route::prefix('customers')->group(function () {
        Route::post('/auth/register',[CustomersController::class,'store']);
        Route::post('/auth/login',[CustomersController::class,'CheckLogin']);
        Route::post('/auth/login-email',[CustomersController::class,'CheckLogin']);
        Route::get('/bills',[CustomersController::class,'get_bills'])->middleware('auth:sanctum');
        
    });
});