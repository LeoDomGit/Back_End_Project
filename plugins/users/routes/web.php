<?php

use App\Http\Middleware\CheckLogin;
use Illuminate\Support\Facades\Route;
use Leo\Users\Controllers\UserController;

// Route::prefix('/api/users')->name('users.')->group(function () {
//     Route::get('/', [UserController::class, 'index'])->name('users.index');
//     Route::get('/create', [UserController::class, 'create'])->name('users.create');
//     Route::post('/', [UserController::class, 'store'])->name('users.store');
//     Route::get('/{id}', [UserController::class, 'show'])->name('users.show');
//     Route::get('/{id}/edit', [UserController::class, 'edit'])->name('users.edit');
//     Route::put('/', [UserController::class, 'update'])->name('users.update');
//     Route::put('/switch/{id}', [UserController::class, 'switchUser'])->name('users.switch');
//     Route::delete('/{id}', [UserController::class, 'destroy'])->name('users.destroy');
// });
Route::group(['middleware' => ['web']], function () {
    Route::get('/', [UserController::class,'login'])->name('login');
    Route::post('/users/checkLogin',[UserController::class,'checkLogin']);
    Route::resource('users', UserController::class)->middleware(CheckLogin::class);
    Route::get('/logout', [UserController::class,'logout'])->middleware(CheckLogin::class);
});
Route::put('/users/switch/{id}', [UserController::class,'switchUser']);

