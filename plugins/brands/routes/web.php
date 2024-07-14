<?php

use Illuminate\Support\Facades\Route;
use Leo\Brands\Controllers\BrandsController;
use App\Http\Middleware\CheckLogin;
Route::middleware(['web', CheckLogin::class])->group(function () {
    Route::resource('brands', BrandsController::class);
});

Route::prefix('api')->group(function () {
    Route::get('/brands',[BrandsController::class,'api_index']);
    Route::get('/brands/{id}',[BrandsController::class,'api_show']);
});