<?php
use Illuminate\Support\Facades\Route;
use Leo\Slides\Controllers\SlidesController;

Route::resource('slides', SlidesController::class);