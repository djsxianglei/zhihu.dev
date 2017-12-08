<?php
/**
 * Created by PhpStorm.
 * User: xianglei
 * Date: 2017/12/8
 * Time: 23:42
 */

namespace App\Repositories;


use App\Models\Question;
use App\Models\Topic;

/**
 * Class QuestionRepository
 * @package App\Repositories
 */
class QuestionRepository
{
    /**
     * @param $id
     * @return \Illuminate\Database\Eloquent\Collection|\Illuminate\Database\Eloquent\Model|null|static|static[]
     */
    public function byIdWithTopics($id)
    {
        return Question::where('id',$id)->with('topics')->first();
    }

    public function byId($id)
    {
        return Question::find($id);
    }
    public function create(array $attributes)
    {
        return Question::create($attributes);
    }

    public function normalizeTopic(array $topics)
    {
        return collect($topics)->map(function($topic){
            if(is_numeric($topic)){
                Topic::find($topic)->increment('questions_count');
                return (int) $topic;
            }
            $newTopic = Topic::create([
                'name'=>$topic,
                'questions_count'=>1
            ]);
            return $newTopic->id;
        })->toArray();
    }
}