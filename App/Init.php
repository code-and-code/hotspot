<?php

namespace App;

use Cac\Init\Bootstrap;

class Init extends Bootstrap
{
    protected function initRoutes()
    {
        $ar['index.home']     = ['route' => '/',              'controller' => 'Index', 'action' => 'index'];
        $ar['index.contact']  = ['route' => '/contact',       'controller' => 'Index', 'action' => 'contact'];

        $ar['admin']          = ['route' => '/admin',         'controller' => 'Admin', 'auth' =>true, 'action' => 'index'];

        //Auth
        $ar['content.edit']        = ['route' => '/content/editar', 'controller' => 'Content', 'action' => 'edit'];
        $ar['content.update']      = ['route' => '/content/update', 'controller' => 'Content', 'action' => 'update'];


        $ar['auth.index']     = ['route' => '/auth',          'controller' => 'Auth', 'action' => 'getLogin'    ];
        $ar['auth.login']     = ['route' => '/auth/login',    'method'=>'POST',       'controller' => 'Auth', 'action' => 'postLogin'   ];
        $ar['auth.logout']    = ['route' => '/auth/logout',   'controller' => 'Auth', 'action' => 'logout'      ];



        $this->setRoutes($ar);
    }

}
