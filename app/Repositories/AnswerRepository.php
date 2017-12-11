<?php
/**
 * Created by PhpStorm.
 * User: xianglei
 * Date: 2017/12/11
 * Time: 22:32
 */

namespace App\Repositories;


use App\Models\Answer;

class AnswerRepository
{

    public function create(array $attributes)
    {
        return Answer::create($attributes);
    }
}