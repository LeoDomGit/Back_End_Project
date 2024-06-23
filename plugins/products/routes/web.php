<?php

use App\Http\Middleware\JWT;
use Illuminate\Support\Facades\Route;
use Leo\Products\Controllers\ProductsController;

Route::resource('products', ProductsController::class);
Route::put('/products/switch/{id}',[ProductsController::class,'switchProduct']);
Route::delete('/products/drop-image/{id}/{imageName}', [ProductsController::class, 'removeImage']);
Route::post('/products/set-image/{id}/{imageName}', [ProductsController::class, 'setImage']);
Route::put('/products/{id}',[ProductsController::class,'update']);
Route::post('/products/set-image/{id}/{imageName}', [ProductsController::class, 'setImage']);
// Route::prefix('api/')->name('api.')->middleware(JWT::class)->group(function () {
//     Route::prefix('products')->name('products.')->group(function () {
//         Route::get('/',[ProductsController::class,'index']);
//         Route::post('/',[ProductsController::class,'store']);
//         Route::post('/import',[ProductsController::class,'import']);
//         Route::post('/upload-images/{id}',[ProductsController::class,'UploadImages']);
//         Route::post('/import-images/{id}',[ProductsController::class,'importImages']);
//         Route::get('/{id}',[ProductsController::class,'show']);
//         Route::put('/{id}',[ProductsController::class,'update']);
//         Route::put('/switch/{id}',[ProductsController::class,'switchProduct']);
//         Route::delete('/{id}',[ProductsController::class,'destroy']);
//         Route::delete('/drop-image/{id}/{imageName}', [ProductsController::class, 'removeImage']);
//         Route::post('/set-image/{id}/{imageName}', [ProductsController::class, 'setImage']);
//     });
// });


// Route::prefix('api2/')->name('api2.')->group(function () {
//     Route::prefix('products')->name('products.')->group(function () {
//         Route::get('/',[ProductsController::class,'Active']);
//         Route::get('/{id}',[ProductsController::class,'Single_Active']);
//     });
// });