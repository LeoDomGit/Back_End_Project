<?php
use Illuminate\Support\Facades\Route;
use Leo\Permissions\Controllers\PermissionController;
use App\Http\Middleware\CheckLogin;
Route::middleware(['web', CheckLogin::class])->group(function () {
    Route::resource('permissions', PermissionController::class);

});