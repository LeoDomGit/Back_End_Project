<?php
use Illuminate\Support\Facades\Route;
use Leo\Roles\Controllers\RolesController;
use App\Http\Middleware\CheckLogin;

Route::middleware(['web', CheckLogin::class])->group(function () {
Route::resource('roles', RolesController::class);
});