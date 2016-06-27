<?php
namespace App\Controllers;

use App\Support\File;
use App\Models\Photo;
use Cac\Controller\Action;

class PhotoController extends Action
{
    private $photo;
    private $src;

    public function __construct()
    {
          $this->photo = new Photo();
          $this->src   = 'images';
    }

    public function create()
    {
       echo $this->render('admin.photo.create',['id' => $_GET['id']]);
    }

    public function store(array $photo)
    {
        $this->photo->create($photo);
    }

    public function upload()
    {

         try {
            $file  = new File('file',$this->src);
            $file->mimeType(['image/png','image/jpg', 'image/jpeg'])->maxSize('50K')->upload();
            $photo = $_REQUEST;
            $photo['src'] = $this->src.'/'.$file->getData()['name'];
            $this->store($photo);
        }
        catch (\Exception $e)
        {
            echo json_encode(['errors' => $e],404);
        }
    }

}