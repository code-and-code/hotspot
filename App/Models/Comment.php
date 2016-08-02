<?php
namespace App\Models;

use Cac\Model\Model;

class Comment extends Model
{
    protected $table = "comments";

    public function Contact()
    {
        return $this->hasOne(Contact::class);

    }
}