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

Route::get('/','QuestionController@index');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('email/verify/{token}',['as'=> 'email.verify' , 'uses' => 'EmailController@verify']);



Route::post('questions/{question}/answer','AnswerController@store')->name('questions.answer');
Route::get('questions/{question}/follow','QuestionFollowController@follow')->name('questions.follow');
Route::resource('questions','QuestionController');

Route::get('notifications','NotificationController@index');