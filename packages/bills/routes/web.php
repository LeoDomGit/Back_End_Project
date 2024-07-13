<?php



use Illuminate\Support\Facades\Route;

use App\Http\Middleware\CheckLogin;

use Leo\Bills\Controllers\BillsController;







Route::middleware(['web',CheckLogin::class])->group(function () {

    Route::resource('bills', BillsController::class);

});



Route::prefix('api')->group(function () {

    Route::prefix('bills')->group(function () {

        Route::post('/',[BillsController::class,'store']);
        Route::post('/login',[BillsController::class,'store2']);



    });

});