<?php
namespace App\Support;

use \Upload\Storage\FileSystem;
use \Upload\File as Upload;

class File
{
    protected $file;

    public function __construct($file,$path)
    {
        $storage    = new FileSystem($path);
        $this->file = new Upload($file, $storage);
    }

    public function setName($name)
    {
        $this->file->setName($name);
        return $this;
    }

    public function maxSize($size)
    {
        $this->file->addValidations(array(
            new \Upload\Validation\Size($size)
        ));
        return $this;
    }

    public function mimeType(array $type)
    {
        $this->file->addValidations(array(
            new \Upload\Validation\Mimetype($type),
        ));
        return $this;
    }

    public function getData()
    {
        $data = $data = array(
            'name'       => $this->file->getNameWithExtension(),
            'extension'  => $this->file->getExtension(),
            'mime'       => $this->file->getMimetype(),
        );

        return $data;
    }

    public function upload()
    {
        if($this->file->upload())
        {
            return $this;
        }
        else
        {
           throw new \Exception ($this->file->getErrors());
        }
    }

}
