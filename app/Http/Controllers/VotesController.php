<?php

namespace App\Http\Controllers;

use App\Repositories\AnswerRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VotesController extends Controller
{
    //
    protected $answer;

    /**
     * VotesController constructor.
     * @param $answer
     */
    public function __construct(AnswerRepository $answer)
    {
        $this->answer = $answer;
    }

    public function users(Request $request)
    {
        $user = Auth::guard('api')->user();
        $voted = $user->hasVotedFor($request->get('answer'));
        if($voted){
            return response()->json(['voted'=>true]);
        }
        return response()->json(['voted'=>false]);
    }

    public function vote(Request $request)
    {
        $user = Auth::guard('api')->user();
        $answer_id = $request->get('answer');
        $answer = $this->answer->byTd($answer_id);
        $voted = $user->voteFor($answer_id);
        if(count($voted['detached']) > 0){
            $answer->decrement('votes_count');
            return response()->json(['voted'=>false]);
        }
        $answer->increment('votes_count');
        return response()->json(['voted'=>true]);
    }
}
