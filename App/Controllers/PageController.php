<?php
namespace App\Controllers;

use App\Models\Page;

class PageController extends Controller
{
    private $page;

    public function __construct()
    {
        $this->page = new Page();
    }

    public function index()
    {
        echo $this->render('admin.pages.index', ['pages' => $this->page->all()]);
    }

    public function publish ()
    {
        $pages = $this->page->all();

        foreach ($pages as $page)
        {
            foreach ($page->Contents() as $content)
            {
                $contents[$content->flag] = $content;
            }
        }
    }
}