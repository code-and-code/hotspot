<?php

namespace App;

use Cac\Init\Bootstrap;

class Init extends Bootstrap
{
    protected function initRoutes()
    {
        $ar['site.index']               = ['route' => '/',                                              'controller' => 'SiteController',       'action' => 'index'                         ];
        $ar['site.about']               = ['route' => '/hotspot_coworking',                             'controller' => 'SiteController',       'action' => 'about'                         ];
        $ar['site.works']               = ['route' => '/como_funciona',                                 'controller' => 'SiteController',       'action' => 'works'                         ];
        $ar['site.images']              = ['route' => '/imagens',                                       'controller' => 'SiteController',       'action' => 'images'         ];
        $ar['site.email']               = ['route' => '/email',                                         'controller' => 'ContactController',    'action' => 'store'          ];


        $ar['auth.index']               = ['route' => '/auth',                                          'controller' => 'AuthController',       'action' => 'getLogin'                      ];
        $ar['auth.login']               = ['route' => '/auth/login',       'method'=>'POST',            'controller' => 'AuthController',       'action' => 'postLogin'                     ];
        $ar['auth.logout']              = ['route' => '/auth/logout',                                   'controller' => 'AuthController',       'action' => 'logout'                        ];

        $ar['admin']                    = ['route' => '/admin',                                         'controller' => 'AdminController',      'auth' =>true, 'action' => 'index'         ];
        $ar['admin.page.index']         = ['route' => '/admin/pages',                                   'controller' => 'PageController',       'auth' =>true, 'action' => 'index'         ];
        $ar['admin.page.show']          = ['route' => '/admin/pages/show-publish',                      'controller' => 'PageController',       'auth' =>true, 'action' => 'showPublish'   ];
        $ar['admin.page.publish']       = ['route' => '/admin/page/publish',                            'controller' => 'PageController',       'auth' =>true, 'action' => 'publish'       ];

       
        $ar['admin.content.index']      = ['route' => '/admin/content/index',                           'controller' => 'ContentController',    'auth' =>true, 'action' => 'index'         ];
        $ar['admin.content.edit']       = ['route' => '/admin/content/edit',                            'controller' => 'ContentController',    'auth' =>true, 'action' => 'edit'          ];
        $ar['admin.content.update']     = ['route' => '/admin/content/update', 'method'=>'POST',        'controller' => 'ContentController',    'auth' =>true, 'action' => 'update'        ];

        $ar['admin.information.index']     = ['route' => '/admin/information',                          'controller' => 'InformationController',    'auth' =>true,'action' => 'index'  ];
        $ar['admin.information.edit']      = ['route' => '/admin/information/edit',                     'controller' => 'InformationController',    'auth' =>true,'action' => 'edit'   ];
        $ar['admin.information.update']    = ['route' => '/admin/information/update','method'=>'POST',  'controller' => 'InformationController',    'auth' =>true,'action' => 'update' ];

        $ar['admin.gallery.index']         = ['route' => '/admin/gallery',                              'controller' => 'GalleryController',      'auth' =>true,'action' => 'index'         ];
        $ar['admin.gallery.create']        = ['route' => '/admin/gallery/create',                       'controller' => 'GalleryController',      'auth' =>true,'action' => 'create'        ];
        $ar['admin.gallery.store']         = ['route' => '/admin/gallery/store',   'method'=>'POST',    'controller' => 'GalleryController',      'auth' =>true,'action' => 'store'           ];
        $ar['admin.gallery.edit']          = ['route' => '/admin/gallery/edit',                         'controller' => 'GalleryController',      'auth' =>true,'action' => 'edit'          ];
        $ar['admin.gallery.update']        = ['route' => '/admin/gallery/update', 'method'=>'POST',     'controller' => 'GalleryController',      'auth' =>true,'action' => 'update'        ];
        $ar['admin.gallery.delete']        = ['route' => '/admin/gallery/delete',                       'controller' => 'GalleryController',      'auth' =>true,'action' => 'delete'        ];

        $ar['admin.photo.create']          = ['route' => '/admin/photo/create',                         'controller' => 'PhotoController',      'auth' =>true,'action' => 'create'           ];
        $ar['admin.photo.edit']            = ['route' => '/admin/photo/edit',                           'controller' => 'PhotoController',     'auth' =>true,'action' => 'edit'                 ];
        $ar['admin.photo.update']          = ['route' => '/admin/photo/update','method'=>'POST',        'controller' => 'PhotoController',      'auth' =>true,'action' => 'update'           ];
        $ar['admin.photo.upload']          = ['route' => '/admin/photo/upload','method'=>'POST',        'controller' => 'PhotoController',      'auth' =>true,'action' => 'upload'           ];
        $ar['admin.photo.delete']          = ['route' => '/admin/photo/delete',                         'controller' => 'PhotoController',      'auth' =>true,'action' => 'delete'           ];

        $ar['admin.contact']               = ['route' => '/admin/contact',                              'controller' => 'ContactController',      'auth' =>true,'action' => 'index'          ];
        $ar['admin.contact.show']          = ['route' => '/admin/contact/show',                         'controller' => 'ContactController',      'auth' =>true,'action' => 'show'           ];
        $ar['admin.contact.delete']        = ['route' => '/admin/contact/delete',                       'controller' => 'ContactController',      'auth' =>true,'action' => 'delete'         ];

        $this->setRoutes($ar);
    }

}
