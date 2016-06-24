<?php

namespace App;

use Cac\Init\Bootstrap;

class Init extends Bootstrap
{
    protected function initRoutes()
    {
        $ar['site.index']             = ['route' => '/',                                    'controller' => 'SiteController',       'action' => 'index'                         ];
        $ar['site.about']             = ['route' => '/hotspot_coworking',                   'controller' => 'SiteController',       'action' => 'about'                         ];
        $ar['site.works']             = ['route' => '/como_funciona',                       'controller' => 'SiteController',       'action' => 'works'                         ];
        $ar['site.images']            = ['route' => '/imagens',                             'controller' => 'SiteController',       'action' => 'images'                        ];


        $ar['auth.index']     = ['route' => '/auth',                                        'controller' => 'AuthController',       'action' => 'getLogin'                      ];
        $ar['auth.login']     = ['route' => '/auth/login',       'method'=>'POST',          'controller' => 'AuthController',       'action' => 'postLogin'                     ];
        $ar['auth.logout']    = ['route' => '/auth/logout',                                 'controller' => 'AuthController',       'action' => 'logout'                        ];



        $ar['admin']                   = ['route' => '/admin',                              'controller' => 'AdminController',      'auth' =>true, 'action' => 'index'         ];
        $ar['admin.page']              = ['route' => '/admin/pages',                        'controller' => 'AdminController',      'auth' =>true, 'action' => 'page'          ];


        $ar['admin.cache']             = ['route' => '/admin/cache',                        'controller' => 'CacheController',      'auth' =>true, 'action' => 'index'            ];
        $ar['admin.cache.show']        = ['route' => '/admin/cache/show',                   'controller' => 'CacheController',      'auth' =>true, 'action' => 'show'             ];
        $ar['admin.cache.delete']      = ['route' => '/admin/cache/delete',                 'controller' => 'CacheController',      'auth' =>true, 'action' => 'delete'           ];


        $ar['admin.content.index']      = ['route' => '/admin/content/index',                   'controller' => 'ContentController',    'auth' =>true, 'action' => 'index'         ];
        $ar['admin.content.edit']       = ['route' => '/admin/content/edit',                    'controller' => 'ContentController',    'auth' =>true, 'action' => 'edit'          ];
        $ar['admin.content.update']     = ['route' => '/admin/content/update', 'method'=>'POST','controller' => 'ContentController',    'auth' =>true, 'action' => 'update'        ];



        $ar['admin.information.index']     = ['route' => '/admin/information',                        'controller' => 'InformationController',    'auth' =>true,'action' => 'index'  ];
        $ar['admin.information.edit']      = ['route' => '/admin/information/edit',                   'controller' => 'InformationController',    'auth' =>true,'action' => 'edit'   ];
        $ar['admin.information.update']    = ['route' => '/admin/information/update','method'=>'POST','controller' => 'InformationController',    'auth' =>true,'action' => 'update' ];


        $ar['admin.photo.create']            = ['route' => '/admin/photo/create',                       'controller' => 'PhotoController',      'auth' =>true,'action' => 'create'         ];
        $ar['admin.photo.store']             = ['route' => '/admin/photo/store','method'=>'POST',       'controller' => 'PhotoController',      'auth' =>true,'action' => 'store'          ];

        $this->setRoutes($ar);
    }

}
