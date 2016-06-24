<?php

namespace App\Controllers;

use App\Models\Gallery;

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

    public function store()
    {
        $gallery = $_REQUEST;
        $this->gallery->create($gallery);
        header('Location: /admin/gallery/create');
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
        header('Location: /admin/gallery/edit');
    }

    public function delete()
    {
        $id = $_GET['id'];
        $this->gallery->find($id)->delete();
        header('Location: /admin/gallery');
    }
}