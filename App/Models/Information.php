<?php

namespace App\Models;

use Cac\Model\Model;

class Information extends Model
{
    protected  $table = "information";

    public function Content()
    {
        return $this->belongsTo(Content::class);
    }
}