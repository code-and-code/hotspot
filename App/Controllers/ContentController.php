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
        echo $this->render('admin.contents.edit', ['content' => $this->content->find($id)]);
    }

    public function update()
    {
        try{
            $array = $_REQUEST;
            $content = $this->content->find($array['id'])->update(['content' => $array['content']]);
            Cache::delete($content->Page()->cache);
            echo json_encode('success', 200);
        }catch (\Exception $e)
        {
            echo json_encode(['error' => $e], 404);
        }
    }

}