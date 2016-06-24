<?php
namespace App\Models;

use Cac\Model\Model;

class Gallery extends Model
{
    protected $table = "galleries";

    public function Photo()
    {
        return $this->hasMany(Photo::class);
    }
}