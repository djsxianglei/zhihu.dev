<?php

namespace App\Http\Controllers;

use App\Repositories\AnswerRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AnswerController extends Controller
{
    //
    protected $answerRepository;

    /**
     * AnswerController constructor.
     * @param $answerRepository
     */
    public function __construct(AnswerRepository $answerRepository)
    {
        $this->answerRepository = $answerRepository;
    }

    public function store($question,Request $request)
    {
        $answer = $this->answerRepository->create([
            'question_id'=>$question,
            'user_id'=>Auth::id(),
            'body'=>$request->get('body')
        ]);
        $answer->question()->increment('comments_count');
        return back();
    }
}
