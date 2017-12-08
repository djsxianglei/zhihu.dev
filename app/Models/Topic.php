<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Topic extends Model
{
    //
    protected $fillable = ['name','questions_count','bio','followers_count'];

    public function questions()
    {
        return $this->belongsToMany(Question::class,'question_topic','topic_id','question_id')->withTimestamps();
    }
}
