<?php
namespace App\Controllers;

use App\Models\Gallery;
use App\Models\Page;

class PageController extends Controller
{
    private $page;

    public function __construct()
    {
        $this->page  = new Page();
    }

    public function index()
    {
        echo $this->render('admin.pages.index', ['pages' => $this->page->all()]);
    }

    public function showPublish()
    {
        echo $this->render('admin.pages.showPublish', ['publish' => $this->cache()->get('publish')]);
    }

    public function publish ()
    {
        $pages     = $this->page->all();
        $gallery   = new Gallery();

        foreach ($pages as $page)
        {
            foreach ($page->Contents() as $content)
            {
                $contents[$content->flag] = $content;
            }
        }
        $html = $this->render('app_production',['contents' => $contents,'galleries' => $gallery->all()]);
        $this->cache()->set('page',$html);
        $this->cache()->delete('publish');
        header('Location: /admin/pages/show-publish');
    }
}