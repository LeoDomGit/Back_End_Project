<?php

// use App\Http\Middleware\JWT;
use Illuminate\Support\Facades\Route;
use Leo\Users\Controllers\UserController;
use App\Http\Middleware\CheckLogin;

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
Route::middleware(['web',CheckLogin::class])->group(function () {
    Route::resource('users', UserController::class);
});
Route::get('/', [UserController::class,'login']);
Route::post('/users/checkLogin',[UserController::class,'checkLogin']);
Route::put('/users/switch/{id}', [UserController::class,'switchUser'])->middleware('auth:admin');



