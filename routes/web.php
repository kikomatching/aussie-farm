<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'PetController@index')->name('pets.index');

Route::get('pets', 'PetController@index')->name('pets.index');
Route::get('pets/create', 'PetController@create')->name('pets.create');
Route::get('pets/{pet}', 'PetController@edit')->name('pets.edit');
