<?php
namespace App\Controllers;

use App\Models\Category;
use App\Models\Page;
use Cac\Controller\BaseController;

class Admin extends  BaseController
{
    public function index()
    {
        $this->render('index',['email' => auth('email')]);
    }

    public function page()
    {
        $page = new Page();
        $this->render('pages',['pages' => $page->all()]);
    }

    public function category()
    {
        $id = $_GET['id'];
        $category   = new Category();
        $categories = $category->where('page_id','=',$id)->get();
        $this->render('categories',['categories' => $categories]);
    }
}