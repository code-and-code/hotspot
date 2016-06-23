<?php

namespace App;

use Cac\Init\Bootstrap;

class Init extends Bootstrap
{
    protected function initRoutes()
    {
        $ar['home.index']             = ['route' => '/',                                    'controller' => 'SiteController',       'action' => 'index'                         ];
        $ar['home.about']             = ['route' => '/sobre',                               'controller' => 'SiteController',       'action' => 'about'                         ];
        $ar['home.works']             = ['route' => '/funciona',                            'controller' => 'SiteController',       'action' => 'works'                         ];
        $ar['home.images']            = ['route' => '/imagens',                             'controller' => 'SiteController',       'action' => 'images'                        ];
        $ar['home.service']           = ['route' => '/servico',                             'controller' => 'SiteController',       'action' => 'servico'                       ];


        $ar['admin']                   = ['route' => '/admin',                              'controller' => 'AdminController',      'auth' =>false, 'action' => 'index'         ];
        $ar['admin.page']              = ['route' => '/admin/pages',                        'controller' => 'AdminController',      'auth' =>false, 'action' => 'page'          ];
        $ar['admin.cache']             = ['route' => '/admin/cache',                        'controller' => 'CacheController',      'auth' =>false, 'action' => 'index'         ];
        $ar['admin.cache.delete']      = ['route' => '/admin/cache/delete',                 'controller' => 'CacheController',      'auth' =>false, 'action' => 'delete'        ];
        $ar['admin.cache.show']        = ['route' => '/admin/cache/show',                   'controller' => 'CacheController',      'auth' =>false, 'action' => 'show'          ];
        $ar['admin.page.content']      = ['route' => '/admin/page/content',                 'controller' => 'ContentController',    'auth' =>false, 'action' => 'index'         ];
        $ar['content.edit']            = ['route' => '/content/edit',                       'controller' => 'ContentController',    'auth' =>false, 'action' => 'edit'          ];
        $ar['content.update']          = ['route' => '/content/update',                     'controller' => 'ContentController',    'auth' =>false, 'action' => 'update'        ];



        $ar['content.information']     = ['route' => '/content/information',                'controller' => 'InformationController',    'auth' =>false,'action' => 'index'      ];
        $ar['information.edit']        = ['route' => '/information/edit',                   'controller' => 'InformationController',    'auth' =>false,'action' => 'edit'       ];
        $ar['information.update']      = ['route' => '/information/update',                 'controller' => 'InformationController',    'auth' =>false,'action' => 'update'     ];

        $ar['contact.index']           = ['route' => '/contact',                            'controller' => 'ContentController',    'action' => 'index'                         ];
        $ar['contact.delete']          = ['route' => '/contact/delete',                     'controller' => 'ContentController',    'action' => 'delete'                        ];

        $ar['photo.create']            = ['route' => '/photo/create',                       'controller' => 'PhotoController',      'auth' =>false,'action' => 'create'         ];


        $ar['auth.index']     = ['route' => '/auth',                                        'controller' => 'AuthController',       'action' => 'getLogin'                      ];
        $ar['auth.login']     = ['route' => '/auth/login',       'method'=>'POST',          'controller' => 'AuthController',       'action' => 'postLogin'                     ];
        $ar['auth.logout']    = ['route' => '/auth/logout',                                 'controller' => 'AuthController',       'action' => 'logout'                        ];

        $this->setRoutes($ar);
    }

}
