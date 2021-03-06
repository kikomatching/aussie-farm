<?php


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([
    'namespace' => 'Api\V1',
    'prefix' => 'v1/',
], function() {
    Route::resource('pets', PetController::class)->except([
        'create', 'edit', 'destroy',
    ]);
});
