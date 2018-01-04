<?php
/**
 * Created by PhpStorm.
 * User: xianglei
 * Date: 2018/1/3
 * Time: 22:42
 */

namespace App\Channels;


use Illuminate\Notifications\Notification;

class SendcludChannel
{
    public function send($notifiable, Notification $notification)
    {
        $message = $notification->toSendcloud($notifiable);
    }
}