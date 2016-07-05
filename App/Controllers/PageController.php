<?php
namespace App\Controllers;

use App\Models\Gallery;
use App\Models\Page;
use App\Support\Cache;
use Cac\Controller\Action;

class PageController extends Action
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

    public function showPublish()
    {
        echo $this->render('admin.pages.showPublish', ['publish' => Cache::get('publish')]);
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

        $html = $this->render('app_cache',['contents' => $contents,'galleries' => $gallery->all()]);
        Cache::set('page', $html);
        Cache::delete('publish');
        header('Location: /admin/pages/show-publish');
    }


}