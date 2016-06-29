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
            throw new \Exception('Error: Voc� atingiu numero Maximo(5) de Galerias!');
        }
    }

    public function store()
    {
        try
        {
            $this->limit();
            $this->gallery->create($_REQUEST);
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
        try {

            $gallery = $this->gallery->find($_GET['id']);
            if($this->clearGallery($gallery))
            {
                Cache::delete('images');
                header('Location: /admin/gallery');
            }
        }catch (\Exception $e)
        {

        }
    }

    public function clearGallery(Gallery $gallery)
    {
        foreach ($gallery->Photos() as $photo)
        {
            unlink($photo->src);
        }
        $gallery->delete();
        return true;
    }
}