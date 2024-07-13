<?php

use App\Http\Middleware\JWT;
use Illuminate\Support\Facades\Route;
use Leo\Products\Controllers\ProductsController;
use App\Http\Middleware\CheckLogin;
Route::middleware(['web', CheckLogin::class])->group(function () {
    Route::resource('products', ProductsController::class);
});
Route::put('/products/switch/{id}',[ProductsController::class,'switchProduct']);
Route::delete('/products/drop-image/{id}/{imageName}', [ProductsController::class, 'removeImage']);
Route::post('/products/set-image/{id}/{imageName}', [ProductsController::class, 'setImage']);
Route::put('/products/{id}',[ProductsController::class,'update']);
Route::post('/products/set-image/{id}/{imageName}', [ProductsController::class, 'setImage']);
Route::post('/products/upload-images/{id}',[ProductsController::class,'UploadImages']);

Route::prefix('api/')->name('api.')->group(function () {
    Route::prefix('products')->name('products.')->group(function () {
        Route::get('/',[ProductsController::class,'api_product']);
        Route::get('/search/{id}',[ProductsController::class,'api_search_product']);
        Route::get('/{id}',[ProductsController::class,'api_single_product']);
        Route::post('/loadCart',[ProductsController::class,'api_load_cart_product']);
    });
});