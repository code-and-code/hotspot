<?php

namespace App\Controllers;

use App\Models\Information;
use App\Support\Cache;
use Cac\Controller\Action;

class InformationController extends Action
{
    private $information;

    public function __construct()
    {
        $this->information = new Information();
    }

    public function edit()
    {
        $id = $_GET['id'];
        echo $this->render('admin.information.edit', ['info' => $this->information->find($id)]);
    }

    public function update()
    {
        header('Content-type: application/json');

        try
        {
            $id = $_GET['id'];
            $this->information->find($id)->update($_REQUEST);
            Cache::set('publish',date('d-m-Y H:m:s'));
            http_response_code(200);
            echo json_encode('success');
        }
        catch (\Exception $e)
        {
            http_response_code(404);
            echo json_encode(['error' => $e]);
        }
    }
}
