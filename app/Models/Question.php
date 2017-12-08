<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Question extends Model
{
    //
    protected $fillable = ['title','body','user_id','comments_count','followers_count','answers_count','close_comment','is_hidden'];
    public function topics()
    {
        return $this->belongsToMany(Topic::class,'question_topic','question_id','topic_id')->withTimestamps();
    }
}
