<?php

use Illuminate\Support\Facades\Route;
use App\Http\Middleware\CheckLogin;
use Leo\Carts\Controllers\CartController;



Route::middleware(['web',CheckLogin::class])->group(function () {
    Route::resource('customers', CustomersController::class);
});

Route::prefix('api')->group(function () {
    Route::prefix('carts')->group(function () {
        Route::post('/',[CartController::class,'store']);
        Route::delete('/{id}',[CartController::class,'destroy']);
        Route::get('/{id}',[CartController::class,'index']);
    });
});