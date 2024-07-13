<?php

use Illuminate\Support\Facades\Route;
use App\Http\Middleware\CheckLogin;
use Leo\ServicesCollections\Controllers\ServicesCollectionsController;
Route::middleware(['web', CheckLogin::class])->group(function () {
    Route::resource('service-collections', ServicesCollectionsController::class);
});

Route::prefix('api')->group(function () {
    Route::get('/service-collections',[ServicesCollectionsController::class,'api_index']);
    Route::get('/service-collections/{id}',[ServicesCollectionsController::class,'api_show']);
});