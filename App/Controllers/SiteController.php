<?php
namespace App\Controllers;


class SiteController extends Controller
{
    public function index()
    {
        $html  = $this->cache()->get('page');
        echo $html;
    }
}
