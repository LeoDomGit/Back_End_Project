<?php
use App\Http\Middleware\CheckLogin;
use Illuminate\Support\Facades\Route;
use Leo\Slides\Controllers\SlidesController;

Route::middleware(['web',CheckLogin::class])->group(function () {
    Route::resource('slides', SlidesController::class);
});

Route::get('api/slides/', [SlidesController::class,'api_index']);
Route::get('api/slides/{slug}', [SlidesController::class,'api_single']);