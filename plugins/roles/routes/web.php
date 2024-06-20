<?php
use Illuminate\Support\Facades\Route;
use Leo\Roles\Controllers\RolesController;

Route::resource('roles', RolesController::class);