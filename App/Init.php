<?php

namespace App;

use Cac\Init\Bootstrap;

class Init extends Bootstrap
{
    protected function initRoutes()
    {
        $ar['index.home']     = ['route' => '/',              'controller' => 'Index', 'action' => 'index'];
        $ar['index.contact']  = ['route' => '/contact',       'controller' => 'Index', 'action' => 'contact'];

        $ar['admin']                   = ['route' => '/admin',                 'controller' => 'Admin', 'auth' =>true, 'action' => 'index'    ];
        $ar['admin.page']              = ['route' => '/admin/pages',           'controller' => 'Admin', 'auth' =>true, 'action' => 'page'     ];
        $ar['admin.page.category']     = ['route' => '/admin/page/categories', 'controller' => 'Admin', 'auth' =>true, 'action' => 'category' ];

        //Auth
        $ar['content.edit']   = ['route' => '/content/editar', 'controller' => 'Content', 'auth' =>true,'action' => 'edit'];
        $ar['content.update'] = ['route' => '/content/update', 'controller' => 'Content', 'auth' =>true,'action' => 'update'];


        $ar['photo.create']    = ['route' => '/photo/create', 'controller' => 'Photo', 'auth' =>true,'action' => 'create'];


        $ar['auth.index']     = ['route' => '/auth',          'controller' => 'Auth', 'action' => 'getLogin'    ];
        $ar['auth.login']     = ['route' => '/auth/login',    'method'=>'POST',       'controller' => 'Auth', 'action' => 'postLogin'   ];
        $ar['auth.logout']    = ['route' => '/auth/logout',   'controller' => 'Auth', 'action' => 'logout'      ];



        $this->setRoutes($ar);
    }

}
