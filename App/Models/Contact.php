<?php
namespace App\Models;

use Cac\Model\Model;

class Contact extends Model
{
    protected $table = "contacts";

    public function Comments()
    {
        return $this->hasMany(Comment::class);

    }
}