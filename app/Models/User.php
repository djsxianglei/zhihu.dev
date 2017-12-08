<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Mail;
use Naux\Mail\SendCloudTemplate;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','avatar','confirmation_token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function owns(Model $model)
    {
        return $this->id == $model->user_id;
    }
    public function sendPasswordResetNotification($token)
    {
        $data = ['url'=>url('password/reset',$token)];
        $template = new SendCloudTemplate('zhihu_app_reset_password',$data);

        Mail::raw($template, function ($message){
            $message->from('sweet@leadnew.cn', 'djs');
            $message->to($this->email);
        });
    }
}
