<?php

namespace App\Controllers;

use App\Models\Gallery;

use Illuminate\Http\Request;
use Illuminate\Validation\Validator;
use Illuminate\Container\Container;
use Illuminate\Filesystem\Filesystem;
use Illuminate\Translation\FileLoader;
use Illuminate\Translation\Translator;
use Illuminate\Validation\Factory;



class GalleryController extends Controller
{
    private $gallery;

    public function __construct()
    {
        $this->gallery = new Gallery();
    }

    public function index($id)
    {
        var_dump($id);

        echo $this->render('admin.gallery.index', ['galleries' => $this->gallery->all()]);
    }

    public function create()
    {
        echo $this->render('admin.gallery.create');
    }

    public function store()
    {

        $loader = new FileLoader(new Filesystem, 'lang');
        $translator = new Translator($loader, 'en');
        $validation = new Factory($translator, new Container);

        $rules = ['email' => 'required|email'];
        $errors = null;

        $validator = $validation->make($_REQUEST, $rules);
        if ($validator->fails()) {
            $errors = $validator->errors();

            print_r($errors);
        }

        //$gallery = $_REQUEST;
        //$this->gallery->create($gallery);
        //header('Location: /admin/gallery/create');
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
        $this->redirectTo('info','Gravado','/admin/gallery');
    }

    public function delete()
    {
        $id = $_GET['id'];
        $this->gallery->find($id)->delete();
        header('Location: /admin/gallery');
    }
}