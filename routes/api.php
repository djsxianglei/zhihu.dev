<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::middleware('api')->get('/topics', function (Request $request) {
    $topics = \App\Models\Topic::select(['id','name'])
        ->where('name','like','%'.$request->query('q').'%')
        ->get();
    return $topics;
});
Route::middleware('auth:api')->post('/question/follower', function (Request $request) {
    $user = Auth::guard('api')->user();
    $followed = $user->followed($request->get('question'));
    if($followed){
        return response()->json(['followed'=>true]);
    }
    return response()->json(['followed'=>false]);
});
Route::middleware('auth:api')->post('/question/follow', function (Request $request) {
    $user = Auth::guard('api')->user();
    $question_id = $request->get('question');
    $question = \App\Models\Question::find($question_id);
    $followed = $user->followsThis($question_id);
    if(count($followed['detached']) > 0){
        $question->decrement('followers_count');
        return response()->json(['followed'=>false]);
    }
    $question->increment('followers_count');
    return response()->json(['followed'=>true]);
});
Route::middleware('auth:api')->post('user/followers','FollowersController@userFollowers');
Route::middleware('auth:api')->post('user/follow','FollowersController@userFollow');

Route::middleware('auth:api')->post('answer/votes/users','VotesController@users');
Route::middleware('auth:api')->post('answer/vote','VotesController@vote');