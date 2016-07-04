<?php
namespace App\Controllers;

class AdminController extends Controller
{

    public function index()
    {
        echo $this->render('admin.index.index', ['email' => auth('email')]);
    }
}