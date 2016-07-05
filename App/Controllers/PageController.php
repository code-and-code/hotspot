<?php
namespace App\Controllers;

use App\Models\Page;
use App\Models\Gallery;

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
        $galleries = $this->gallery();
        echo $this->render('app_cache', ['contents' => $contents, 'galleries' => $galleries]);
    }

    public function gallery()
    {
        $gallery = new Gallery();
        $galleries = $gallery->all();
        return $galleries;
    }
}