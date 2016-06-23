<?php
namespace App\Models;

use Cac\Model\Model;

class Page extends Model
{
    protected $table = "pages";

    public function Contents()
    {
        return $this->hasMany(Content::class);
    }

}