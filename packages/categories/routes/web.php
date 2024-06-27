<?php

use Illuminate\Support\Facades\Route;
use Leo\Categories\Controllers\CategoriesController;
use App\Http\Middleware\CheckLogin;
Route::middleware(['web', CheckLogin::class])->group(function () {
    Route::resource('categories', CategoriesController::class);
});

Route::prefix('api')->group(function () {
    Route::get('/categories',[CategoriesController::class,'api_index']);
    Route::get('/categories/{id}',[CategoriesController::class,'api_show']);
});