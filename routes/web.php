<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web']], function () {
    \UniSharp\LaravelFilemanager\Lfm::routes();
});