<?php
namespace App\Controllers;

class AuthController extends \Cac\Auth\Auth
{

    public function __construct()
    {
        $this->setConfig('auth.auth');
    }

    public function getLogin()
    {
        echo $this->render('admin.auth.login');
    }

}