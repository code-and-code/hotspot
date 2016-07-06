<?php

namespace App\Controllers;

use App\Models\Content;

class ContentController extends Controller
{
    private $content;

    public function __construct()
    {
        $this->content = new Content();
    }

    public function index()
    {
        $array = $_REQUEST;
        $contents = $this->content->where('page_id', '=', $array['id'])->get();
        echo $this->render('admin.contents.index', ['contents' => $contents]);
    }

    public function edit()
    {
        $id = $_GET['id'];
        $content =  $this->content->find($id);
        echo $this->render('admin.contents.edit', ['content' => $content]);
    }

    public function update()
    {
        header('Content-type: application/json');
        try{
            $id = $_GET['id'];
            $this->content->find($id)->update($_REQUEST);
            $this->cache()->set('publish',date('d-m-Y H:m:s'));
            http_response_code(200);
            echo json_encode('success');

        }catch (\Exception $e)
        {
            http_response_code(404);
            echo json_encode(['error' => $e]);
        }
    }

}