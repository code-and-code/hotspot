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




        $ar['admin']                   = ['route' => '/admin',                              'controller' => 'AdminController',      'auth' =>false, 'action' => 'index'         ];
        $ar['admin.page']              = ['route' => '/admin/pages',                        'controller' => 'AdminController',      'auth' =>false, 'action' => 'page'          ];
        $ar['admin.cache']             = ['route' => '/admin/cache',                        'controller' => 'CacheController',      'auth' =>false, 'action' => 'index'         ];
        $ar['admin.cache.delete']      = ['route' => '/admin/cache/delete',                 'controller' => 'CacheController',      'auth' =>false, 'action' => 'delete'         ];
        $ar['admin.cache.show']        = ['route' => '/admin/cache/show',                   'controller' => 'CacheController',      'auth' =>false, 'action' => 'show'         ];
        $ar['admin.page.content']      = ['route' => '/admin/page/content',                 'controller' => 'ContentController',    'auth' =>false, 'action' => 'index'         ];
        $ar['content.edit']            = ['route' => '/content/edit',                       'controller' => 'ContentController',    'auth' =>false, 'action' => 'edit'          ];
        $ar['content.update']          = ['route' => '/content/update',                     'controller' => 'ContentController',    'auth' =>false, 'action' => 'update'        ];



        $ar['content.information']     = ['route' => '/content/information',                'controller' => 'InformationController',    'auth' =>false, 'action' => 'index'         ];
        $ar['information.edit']        = ['route' => '/information/edit',                   'controller' => 'InformationController',    'auth' =>false,'action' => 'edit'           ];
        $ar['information.update']      = ['route' => '/information/update',                 'controller' => 'InformationController',    'auth' =>false,'action' => 'update'         ];

        $ar['contact.index']           = ['route' => '/contact',                            'controller' => 'ContentController',    'action' => 'index'                         ];
        $ar['contact.delete']          = ['route' => '/contact/delete',                     'controller' => 'ContentController',    'action' => 'delete'                        ];

        $ar['photo.create']            = ['route' => '/admin/photo/create',                       'controller' => 'PhotoController',      'auth' =>false,'action' => 'create'         ];
        $ar['photo.store']             = ['route' => '/admin/photo/store','method'=>'POST',       'controller' => 'PhotoController',      'auth' =>false,'action' => 'store'          ];


        $ar['auth.index']     = ['route' => '/auth',                                        'controller' => 'AuthController',       'action' => 'getLogin'                      ];
        $ar['auth.login']     = ['route' => '/auth/login',       'method'=>'POST',          'controller' => 'AuthController',       'action' => 'postLogin'                     ];
        $ar['auth.logout']    = ['route' => '/auth/logout',                                 'controller' => 'AuthController',       'action' => 'logout'                        ];



        $this->setRoutes($ar);
    }

}
