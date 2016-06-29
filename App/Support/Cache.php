<?php
namespace App\Support;
use Desarrolla2\Cache\Cache as DesarrollaCache;
use Desarrolla2\Cache\Adapter\File;
class Cache
{
    private static $cache;

    private static function init()
    {
        if(!config('app.cache.active'))
        {
            return false;
        }
        else {

            $dir = config('app.cache.folder');
            $adapter = new File($dir);
            self::$cache = new DesarrollaCache($adapter);
            return true;
        }
    }

    public static function set($key,$value,$time = 0)
    {
        if(self::init())
        {
            return self::$cache->set($key, $value, $time);
        }

    }
    public static function get($key)
    {
        if(self::init())
        {
            $cache = self::$cache->get($key);
            return $cache;
        }

    }
    public static function delete($key)
    {
        if(self::init())
        {
            return self::$cache->delete($key);
        }
    }

    public static function has($key)
    {
        if(self::init())
        {
            $cache = self::get($key);
            if(empty($cache))
            {
                return false;
            }
            return true;
        }
    }
}