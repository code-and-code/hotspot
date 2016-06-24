<?php

namespace App\Controllers;

use App\Models\Information;
use App\Support\Cache;

class InformationController extends Controller
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
        try
        {
            $id = $_GET['id'];
            $information = $this->information->find($id)->update($_REQUEST);
            Cache::delete($information->Content()->Page()->cache);
            echo json_encode($information->Content()->flag, 200);
        }catch (\Exception $e)
        {
            echo json_encode(['error' => $e], 404);
        }
    }
}
