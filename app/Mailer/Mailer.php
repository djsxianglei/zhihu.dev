<?php
/**
 * Created by PhpStorm.
 * User: xianglei
 * Date: 2018/1/3
 * Time: 23:17
 */

namespace App\Mailer;


use Illuminate\Support\Facades\Mail;
use Naux\Mail\SendCloudTemplate;

class Mailer
{

    protected function sendTo($template,$email,array $data)
    {
        $content = new SendCloudTemplate($template, $data);

        Mail::raw($content, function ($message) use ($email) {
            $message->from('sweet@leadnew.cn', 'djs');

            $message->to($email);
        });
    }
}