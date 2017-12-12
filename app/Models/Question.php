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

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }

    public function scopePublished($query)
    {
        return $query->where('is_hidden','F');
    }

    public function answers()
    {
        return $this->hasMany(Answer::class);
    }

    public function follows()
    {
        return $this->belongsToMany(User::class,'user_question')->withTimestamps();
    }
}
