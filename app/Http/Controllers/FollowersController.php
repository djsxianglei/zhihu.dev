<?php

namespace App\Http\Controllers;

use App\Notifications\NewUserFollowNotification;
use App\Repositories\UserRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FollowersController extends Controller
{
    //
    protected $userRepository;

    /**
     * FollowersController constructor.
     * @param $userRepository
     */
    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    public function userFollowers(Request $request)
    {
        $user = $this->userRepository->byId($request->get('user'));
        $followers = $user->followersUser()->pluck('follower_id')->toArray();
        if(in_array(Auth::guard('api')->id(),$followers)){
            return response()->json(['followed'=>true]);
        }
        return response()->json(['followed'=>false]);
    }

    public function userFollow(Request $request)
    {
        $user = $this->userRepository->byId($request->get('user'));
        $followed = Auth::guard('api')->user()->followersThisUser($user->id);
        if(count($followed['detached']) > 0){
            $user->decrement('followers_count');
            return response()->json(['followed'=>false]);
        }
        $user->notify(new NewUserFollowNotification());
        $user->increment('followers_count');
        return response()->json(['followed'=>true]);
    }
}
