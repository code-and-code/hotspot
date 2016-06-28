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
        try {
            $this->photo->create($photo);
            echo "Photo Criada";

        }catch (\Exception $e)
        {
            echo json_encode(['errors' => $e->getMessage()], 404);
        }
    }

    public function upload()
    {
         try {
            $file       = new File('file',$this->src);
            $nameFile   = md5(date('H:m:s:'));
            $file->setName($nameFile)->mimeType(['image/png','image/jpeg', 'image/jpg'])->maxSize('3M')->upload();
            $photo = $_REQUEST;
            $photo['src'] = $this->src.'/'.$file->getData()['name'];
            $this->store($photo);

        }
        catch (\Exception $e)
        {
            echo json_encode(['errors' => $e->getMessage()],404);
        }
    }

    public function edit()
    {
        $id = $_GET['id'];
        $photo = $this->photo->find($id);
        echo $this->render('admin.photo.edit', ['photo' => $photo]);
    }

    public function update()
    {
        $id = $_POST['id'];
        $photo = $this->photo->find($id)->update($_REQUEST);
        header("Location: /admin/gallery/edit?id=".$photo->Gallery()->id);
    }

    public function delete()
    {
        $id = $_GET['id'];
        $path = __DIR__."/../../public/";
        $file = $this->photo->find($id);
        if(file_exists($path.$file->src))
        {
            unlink($path.$file->src);
            $file->delete();
            header("Location: /admin/gallery/edit?id=".$file->Gallery()->id);
        }else{
            echo "file nao existe";
        }
    }

}