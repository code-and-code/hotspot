<?php
namespace App\Controllers;

use App\Models\Page;
use App\Support\Cache\Cache;
use Cac\Controller\Action;

class Controller extends Action
{
    private $page = 'inicio';

    private function setAppVar()
    {
        $page = new Page();
        $page = $page->where('name','=',$this->page)->first();
        $this->setVars('app', $page);
    }

    protected function initCache($name)
    {
        $cache = Cache::get($name);
        if(Cache::has($name))
        {
            return $cache;
        }
        else
        {
            $this->setAppVar();
            return false;
        }
    }
}