<?php
namespace App\Controllers;

use App\Support\Cache;
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
          $this->src   = config('app.file.folder');
    }

    public function create()
    {
       echo $this->render('admin.photo.create',['id' => $_GET['id']]);
    }

    public function store(array $photo)
    {
        try {

            $this->photo->create($photo);
            header('Content-type: application/json');
            http_response_code(200);
            Cache::set('publish',date('d-m-Y H:m:s'));
            echo json_encode('Enviado com Sucesso!!');

        }catch (\Exception $e)
        {
            header('Content-type: application/json');
            http_response_code(404);
            echo json_encode($e->getMessage());
        }
    }

    public function upload()
    {
         try {

            $file       = new File($_FILES['file'],$this->src);
            $nameFile   = md5(date('H:m:s:'));
            $file->setName($nameFile)->mimeType(['image/png','image/jpeg', 'image/jpg'])->maxSize('3MB')->upload();

            $photo        = $_REQUEST;
            $photo['src'] = $this->src.'/'.$file->getData()->name;
            $this->store($photo);

        }
        catch (\Exception $e)
        {
            header('Content-type: application/json');
            http_response_code(404);
            echo json_encode(['errors' => $file->getErrors()]);
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
        Cache::set('publish',date('d-m-Y H:m:s'));
        header("Location: /admin/gallery/edit?id=".$photo->Gallery()->id);
    }

    public function delete()
    {
        $id = $_GET['id'];
        $file = $this->photo->find($id);
        if(file_exists($file->src))
        {
            unlink($file->src);
            $file->delete();
            header("Location: /admin/gallery/edit?id=".$file->Gallery()->id);
        }else{
            echo "file nao existe";
        }
    }

}