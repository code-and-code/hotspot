<?php

namespace App\Controllers;

use App\Models\Client;
use Cac\Controller\Action;

class ClientController extends Action
{
    private $client;

    public function __construct()
    {
        $this->client = new Client();
    }

    public function index()
    {
        echo $this->render('admin.client.index', ['clients' => $this->client->all()]);
    }

    public function create()
    {
        echo $this->render('admin.client.create');
    }

    public function store()
    {
        try{
            $this->client->create($_REQUEST);
            echo $this->render('admin.client.create', ['success' => true]);
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function show()
    {
        $id = $_GET['id'];
        $client = $this->client->find($id);
        $this->setVars('disabled', "disabled");
        echo $this->render('admin.client.show', ['client' => $client]);
    }

    public function edit()
    {
        try{
            $client = $this->client->find($_GET['id']);
            echo $this->render('admin.client.edit', ['client' => $client]);
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function update()
    {
        try{
            $id = $_GET['id'];
            $client = $this->client->find($id)->update($_REQUEST);
            echo $this->render('admin.client.edit', ['client' => $client, 'success' => true]);
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function delete()
    {
        try{
            $this->client->find($_GET['id'])->delete();
            header('Location: /admin/client');
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

}