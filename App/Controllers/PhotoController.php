<?php
namespace App\Controllers;

use App\Support\File;
use Cac\Controller\Action;


class PhotoController extends Action
{
    public function create()
    {

        echo $this->render('admin.photo.create');

    }

    public function store()
    {

        try {

            $file  = new File('file','public');
            $file->mimeType(['image/png','image/jpg'])->maxSize('3M')->upload();

            echo json_encode(['result' =>$file->getData()['name']],200);
        }
        catch (\Exception $e)
        {
            echo json_encode(['errors' => $e],404);
        }
    }
}