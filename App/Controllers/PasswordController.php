<?php

namespace App\Controllers;

use App\Models\Personal_Password;
use App\Support\Mail;
use Cac\Controller\Action;

class PasswordController extends Action
{
    private $password;

    public function __construct()
    {
        $this->password = new Personal_Password();
    }

    public function addPassword()
    {
        try{
            $password = $this->password->where('status', '=', 0)->first();
            if($password)
            {
                $password = $password->update(['status' => 1, 'client_id' => $_GET['id']]);
                $html = $this->render('admin.emails.password', ['password' => $password ]);
                new Mail([$password->Client()->email => $password->Client()->name], $html, 'Bem Vindo a Hotspot!!');
                echo $this->render('admin.layout.message', ['success' => 'Senha gerada com sucesso']);
            }else{
                echo $this->render('admin.layout.message', ['danger' => 'Não há senhas disponíveis']);
            }

        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function passwords()
    {
        try{
            $active = count($this->password->where('status', '=', 0)->get());
            $inactive = count($this->password->where('status', '=', 1)->get());
            $blocked = count($this->password->where('status', '=', 2)->get());
            echo $this->render('admin.personal_password.index', ['active' => $active, 'inactive' => $inactive, 'blocked' => $blocked]);
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function inactive()
    {
        try{
            $passwords = $this->password->where('status', '=', 1)->get();
            echo $this->render('admin.personal_password.inactive', ['passwords' => $passwords]);
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function blocked()
    {
        try{
            $passwords = $this->password->where('status', '=', 2)->get();
            echo $this->render('admin.personal_password.blocked', ['passwords' => $passwords]);
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function comment()
    {
        try{
            $password = $this->password->find($_GET['id']);
            echo $this->render('admin.personal_password.comment', ['id' => $password->id, 'client_id' => $password->client_id]);
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function reset()
    {
        try{
            $password = $this->password->where('status', '=', 0)->first();
            if($password)
            {
                $this->password->find($_GET['id'])->update(['comment' => $_POST['comment'], 'client_id' => null]);
                $password = $password->update(['status' => 1, 'client_id' => $_GET['client_id']]);
                $html = $this->render('admin.emails.password', ['password' => $password ]);
                new Mail([$password->Client()->email => $password->Client()->name], $html, 'Nova Senha');
                echo $this->render('admin.layout.message', ['success' => "Senha resetada e enviada no e-mail ".$password->Client()->email]);
            }else{
                echo $this->render('admin.layout.message', ['danger' => 'Não há senhas disponíveis']);
            }

        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function activate()
    {
        $this->password->find($_GET['id'])->update(['status' => 0, 'comment' =>  null]);
        header('Location: /admin/personal_password/inactive');
    }

    public function sendPassword()
    {
        $password = $this->password->find($_GET['id']);
        $html = $this->render('admin.emails.password', ['password' => $password ]);
        new Mail([$password->Client()->email => $password->Client()->name], $html, 'Nova Senha');
        echo $this->render('admin.layout.message', ['success' => "Senha reenviada ao e-mail ". $password->Client()->email]);
    }

    public function blockade()
    {
        try{
            $client_id = $_GET['id'];
            $password = $this->password->where('client_id', '=', $client_id)->first();
            if($password)
            {
                $client = $password->Client();
                $password->update(['status' => 2, 'comment' => "$client->name", 'client_id' => null]);
                echo $this->render('admin.layout.message', ['success' => "A senha do cliente: $client->name foi bloqueada com sucesso!!"]);
            }else{
                echo $this->render('admin.layout.message', ['warning' => "Esse cliente não possui senha!"]);
            }
        }catch (\Exception $e){
            echo $e->getMessage();
        }
    }

    public function generate()
    {
        $array = array();
        for($i=0; $i<50; $i++) // $i = Usuário
        {
            $x = rand(0,9).rand(0,9).rand(0,9).rand(0,9); //$x = password
            if(in_array($x, $array))
            {
                echo "Existe valor duplicado";
                echo $x."<br/>";
                while(in_array($x, $array))
                {
                    $x = rand(0,9).rand(0,9).rand(0,9).rand(0,9);
                }
                $array[$i] = $x;
            }else{
                $array[$i] = $x;
                echo $array[$i]."<br/>";
            }
        }
        for($i=0; $i<50; $i++){
            echo $array[$i]."<br/>";
            $this->password->create(['phone' => $array[$i], 'print' => $array[$i], 'status' => 0]);
        }

    }
}

