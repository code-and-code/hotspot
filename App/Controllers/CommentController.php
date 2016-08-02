<?php

namespace App\Controllers;

use App\Models\Comment;
use Cac\Controller\Action;

class CommentController extends Action
{
    private $comment;
    private $header = "Location: /admin/contact/show?id=";

    public function __construct()
    {
        $this->comment = new Comment();
    }

    public function create()
    {
        echo $this->render('admin.comment.create',['id' => $_GET['id']]);
    }

    public function store()
    {
        try{
            $comment = $_REQUEST;
            $this->comment->create($comment);
            header($this->header."{$comment['contact_id']}");
        }catch (\Exception $e)
        {
            echo $e->getMessage();
        }
    }

    public function edit()
    {
        $id = $_GET['id'];
        $comment = $this->comment->find($id);
        echo $this->render('admin.comment.edit', ['comment' => $comment]);
    }

    public function update()
    {
        try{
            $id = $_POST['id'];
            $comment = $this->comment->find($id)->update($_REQUEST);
            header($this->header."{$comment->contact_id}");
        }catch (\Exception $e)
        {
            echo $this->render('admin.layout.message', ['danger' => 'Não foi possível editar esse comentário']);
        }
    }

    public function delete()
    {
        $this->comment->find($_GET['id'])->delete();
        header($this->header."{$_GET['contact_id']}");
    }
}