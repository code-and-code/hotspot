<?php
namespace App\Controllers;

use App\Support\Cache;
use Cac\Controller\Action;

class SiteController extends Action
{

    public function index()
    {
        $html = Cache::get('page');
        echo $html;
    }
}
