<?php
namespace App\Controllers;

use Cac\Controller\BaseController;

class Content extends  BaseController
{
    public function edit()
    {
        $id = $_GET['id'];
        $this->render('edit');
    }

    public function update()
    {
        header('Cache-Control: no-cache, must-revalidate');
        header('Content-Type: application/json; charset=utf-8');

       //$request = json_decode($_REQUEST, true);

        echo var_dump($_REQUEST);


    }
}