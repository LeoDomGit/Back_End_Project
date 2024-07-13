<?php
use Illuminate\Support\Facades\Route;
use Leo\Permissions\Controllers\PermissionController;
use App\Http\Middleware\CheckLogin;
Route::middleware(['web', CheckLogin::class])->group(function () {
    Route::resource('permissions', PermissionController::class);
    Route::post('/permissions/add-role-permision',[PermissionController::class,'role_permission']);
    Route::get('/permissions/roles/{id}',[PermissionController::class,'get_permissions']);
});