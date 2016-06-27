<?php
namespace App\Controllers;

use App\Models\Page;
use App\Support\Cache;
use Cac\Support\FlashMessages;


class SiteController extends Controller
{
    private $page;

    public function __construct()
    {
        $this->page = new Page();
    }

    public function index()
    {
        $html = $this->initCache('index');
        if(!$html)
        {
            $html =$this->render('site.index');
            Cache::set('index', $html);
            echo $html;
        }else{
            echo $html;
        }
    }

    public function about()
    {
        $html = $this->initCache('about');
        if (!$html) {
            $page = $this->page->where('name', '=', 'hotspot_coworking')->first();
            foreach ($page->Contents() as $content) {
                $contents[$content->flag] = $content;
            }
            $html = $this->render('site.about', ['contents' => $contents]);
            Cache::set('about', $html);
            echo $html;
        }else{
            echo $html;
        }
    }

    public function works()
    {
        $html = $this->initCache('works');
        if(!$html)
        {
            $page = $this->page->where('name', '=', 'como_funciona')->first();
            foreach ($page->Contents() as $content)
            {
                $contents[$content->flag] = $content;
            }
            $html = $this->render('site.works', ['contents' => $contents]);
            Cache::set('works', $html);
            echo $html;
        }else{
            echo $html;
        }

    }

    public function images()
    {
        echo $this->render('site.images');
    }

}
