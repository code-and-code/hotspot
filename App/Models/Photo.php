<?php
namespace App\Models;

use Cac\Model\Model;

class Photo extends Model
{
    protected $table = "photos";

    public function Gallery()
    {
        return $this->belongsTo(Gallery::class);
    }
}