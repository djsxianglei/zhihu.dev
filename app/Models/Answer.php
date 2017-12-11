<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Answer
 * @package App\Models
 */
class Answer extends Model
{
    //
    /**
     * @var array
     */
    protected $fillable = ['user_id','question_id','body'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function question()
    {
        return $this->belongsTo(Question::class,'question_id');
    }
}
