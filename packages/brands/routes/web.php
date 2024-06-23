<?php

use Illuminate\Support\Facades\Route;
use Leo\Brands\Controllers\BrandsController;

Route::resource('brands', BrandsController::class);

Route::prefix('api')->group(function () {
    Route::get('/brands',[BrandsController::class,'api_index']);
    Route::get('/brands/{id}',[BrandsController::class,'api_show']);
});