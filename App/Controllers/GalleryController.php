<?php

namespace App\Controllers;

use App\Models\Gallery;
use App\Support\Cache;

class GalleryController extends Controller
{
    private $gallery;

    public function __construct()
    {
        $this->gallery = new Gallery();
    }

    public function index()
    {
        echo $this->render('admin.gallery.index', ['galleries' => $this->gallery->all()]);
    }

    public function create()
    {
        echo $this->render('admin.gallery.create');
    }

    private function limit()
    {
        if(count($this->gallery->all()) > 5)
        {
            throw new \Exception('Error: Você atingiu numero Maximo(5) de Galerias!');
        }
    }

    public function store()
    {
        try
        {
            $this->limit();
            $gallery = $_REQUEST;
            $this->gallery->create($gallery);
            Cache::delete('images');
            header('Location: /admin/gallery/create');
        }
        catch (\Exception $e){

            echo $e->getMessage();
        }
    }

    public function edit()
    {
        $id = $_GET['id'];
        $gallery = $this->gallery->find($id);
        echo $this->render('admin.gallery.edit', ['gallery' => $gallery]);
    }

    public function update()
    {
        $id = $_GET['id'];
        $this->gallery->find($id)->update($_REQUEST);
        Cache::delete('images');
        header('Location: /admin/gallery');
    }

    public function delete()
    {
        $id = $_GET['id'];
        $this->gallery->find($id)->delete();
        Cache::delete('images');
        header('Location: /admin/gallery');
    }
}