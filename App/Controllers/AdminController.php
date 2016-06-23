<?php
namespace App\Controllers;

use App\Models\Page;

class AdminController extends Controller
{

    public function index()
    {
        echo $this->render('admin.index.index', ['email' => auth('email')]);
    }

    public function page()
    {
        $page = new Page();
        echo $this->render('admin.pages.index', ['pages' => $page->all()]);
    }

}