<?php
use Illuminate\Routing\Router;

/** @var $router Router */
$router->get('/', function () {
    return 'hello world!';
});


$router->group(['namespace' => 'App\Controllers', 'prefix' => 'admin'], function (Router $router) {

    $router->get('gallery/{id}', ['name' => 'users.index', 'uses' => 'GalleryController@index']);
});
