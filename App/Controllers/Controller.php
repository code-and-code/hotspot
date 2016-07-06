<?php
namespace App\Controllers;

use App\Support\Cache5;
use Cac\Controller\Action;

class Controller extends Action
{
    public function cache()
    {
         $cache  = new Cache5(config('app.cache.folder'));
         return $cache;
    }
}
