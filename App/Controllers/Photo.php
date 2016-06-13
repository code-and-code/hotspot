<?php
namespace App\Controllers;

use Cac\Controller\BaseController;

class Photo extends  BaseController
{
    public function create()
    {
        $this->render('create');
    }

    public function store()
    {

    }
}