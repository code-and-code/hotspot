<?php
namespace App\Models;

use Cac\Model\Model;


class Client extends Model
{
    protected $table = "clients";

    public function Password()
    {
        return $this->belongsTo(Personal_Password::class);
    }
}