<?php
/**
 * Created by PhpStorm.
 * User: xianglei
 * Date: 2017/12/23
 * Time: 10:07
 */

namespace App\Repositories;


use App\Models\User;

class UserRepository
{
    public function byId($id)
    {
        return User::find($id);
    }

}