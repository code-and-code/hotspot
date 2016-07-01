<?php

namespace App\Controllers;

use App\Models\Content;
use App\Support\Cache;

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
        try{
            $id = $_GET['id'];
            $content = $this->content->find($id)->update($_REQUEST);
            var_dump($content);
            Cache::delete($content->Page()->cache);
            echo json_encode('success', 200);
        }catch (\Exception $e)
        {
            echo json_encode(['error' => $e], 404);
        }
    }

}