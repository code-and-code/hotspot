<?php
namespace App\Models;

use Cac\Model\Model;

class Content extends Model
{
    protected $table = "content";

    public function Information()
    {
        return $this->hasMany(Information::class);
    }

    public function Page()
    {
        return $this->belongsTo(Page::class);
    }
}