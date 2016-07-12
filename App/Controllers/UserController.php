<?php

namespace App\Controllers;

use App\Models\User;
use App\Support\Mail;
use Cac\Controller\Action;

class UserController extends Action
{
    private $user;

    public function __construct()
    {
        $this->user = new User();
    }

    public function index()
    {
        echo $this->render('admin.users.index', ['users' => $this->user->all()]);
    }

    public function create()
    {
        echo $this->render('admin.users.create');
    }

    public function store()
    {
        try{
            $this->user->create($_REQUEST);
            header('Location: /admin/user/create');
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function edit()
    {
        try{
            $id = $_GET['id'];
            echo $this->render('admin.users.edit', ['user' => $this->user->find($id)]);
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function update()
    {
        try{
            $id = $_GET['id'];
            $this->user->find($id)->update($_REQUEST);
            header('Location: /admin/user');
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function delete()
    {
        try{
            $this->user->find($_GET['id'])->delete();
            header('Location: /admin/user');
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function reset()
    {
        echo $this->render('admin.users.reset');
    }

    public function passwordUpdate()
    {
        try{
            $array = $_REQUEST;
            $user = $this->user->where('email','=', $array['email'])->first();
            if($user)
            {
                for($i=0; $i<6; $i++)
                {
                    $newPassword = $newPassword.rand(1, 9);
                }
                $this->user->find($user->id)->update(['password'=> $newPassword]);
                new Mail([$user->email => $user->name], "<html><h4>Sua nova senha é:</h4><p>$newPassword</p> </html>");
                $this->setVars('newPassword', $newPassword);
                echo  $this->render('admin.auth.login');
            }else{
                echo "error";
            }
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }


}