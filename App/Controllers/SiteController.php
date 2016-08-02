<?php
namespace App\Controllers;


class SiteController extends Controller
{
    public function index()
    {
        $html  = $this->cache()->get('page');
        echo $html;
    }

    public function help()
    {
        echo $this->render('admin.index.help');
    }
}
