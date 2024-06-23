<?php
use Illuminate\Support\Facades\Route;
use Leo\Permissions\Controllers\PermissionController;

Route::resource('permissions', PermissionController::class);