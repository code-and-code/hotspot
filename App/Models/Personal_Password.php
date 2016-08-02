<?php
namespace App\Models;

use Cac\Model\Model;


class Personal_Password extends Model
{
    protected $table = "personal_password";

    public function Client()
    {
        return $this->hasOne(Client::class);
    }
}