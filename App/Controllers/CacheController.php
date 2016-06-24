<?php
namespace App\Controllers;

use App\Models\Page;
use App\Support\Cache;

class CacheController extends Controller
{
    public function index()
    {
        $page = new Page();
        $pages = $page->all();

        foreach($pages as $pg)
        {
            $cache = Cache::get($pg->cache);
            if($cache)
            {
                $caches[$pg->cache] = $pg;
            }
        }
        echo $this->render('admin.cache.index', ['caches' => $caches]);
    }

    public function show()
    {
        $key = $_GET['key'];
        echo Cache::get($key);
    }

    public function delete()
    {
        $key = $_GET['key'];
        Cache::delete($key);
        header('Location: /admin/cache');
    }
}