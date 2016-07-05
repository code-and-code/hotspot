<?php
namespace App\Controllers;

use Cac\Controller\Action;

class AdminController extends Action
{
    public function index()
    {
        echo $this->render('admin.index.index', ['email' => auth('email')]);
    }
}