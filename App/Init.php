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
        $ar['site.images']              = ['route' => '/imagens',                                       'controller' => 'SiteController',       'action' => 'images'                        ];
        $ar['site.email']               = ['route' => '/email',                                         'controller' => 'ContactController',    'action' => 'store'                         ];
        $ar['site.help']                = ['route' => '/ajuda',                                          'controller' => 'SiteController',      'action' => 'help'                          ];

        $ar['auth.index']               = ['route' => '/auth',                                          'controller' => 'AuthController',       'action' => 'getLogin'                      ];
        $ar['auth.login']               = ['route' => '/auth/login',       'method'=>'POST',            'controller' => 'AuthController',       'action' => 'postLogin'                     ];
        $ar['auth.logout']              = ['route' => '/auth/logout',                                   'controller' => 'AuthController',       'action' => 'logout'                        ];

        $ar['admin']                    = ['route' => '/admin',                                         'controller' => 'AdminController',      'auth' =>true, 'action' => 'index'         ];


        $ar['admin.page.index']         = ['route' => '/admin/pages',                                   'controller' => 'PageController',       'auth' =>true, 'action' => 'index'         ];
        $ar['admin.page.show']          = ['route' => '/admin/pages/show-publish',                      'controller' => 'PageController',       'auth' =>true, 'action' => 'showPublish'   ];
        $ar['admin.page.publish']       = ['route' => '/admin/page/publish',                            'controller' => 'PageController',       'auth' =>true, 'action' => 'publish'       ];

        $ar['admin.content.index']      = ['route' => '/admin/content/index',                           'controller' => 'ContentController',    'auth' =>true, 'action' => 'index'              ];
        $ar['admin.content.edit']       = ['route' => '/admin/content/edit',                            'controller' => 'ContentController',    'auth' =>true, 'action' => 'edit'               ];
        $ar['admin.content.update']     = ['route' => '/admin/content/update', 'method'=>'POST',        'controller' => 'ContentController',    'auth' =>true, 'action' => 'update'             ];

        $ar['admin.information.index']     = ['route' => '/admin/information',                          'controller' => 'InformationController',    'auth' =>true,'action' => 'index'           ];
        $ar['admin.information.edit']      = ['route' => '/admin/information/edit',                     'controller' => 'InformationController',    'auth' =>true,'action' => 'edit'            ];
        $ar['admin.information.update']    = ['route' => '/admin/information/update','method'=>'POST',  'controller' => 'InformationController',    'auth' =>true,'action' => 'update'          ];

        $ar['admin.gallery.index']         = ['route' => '/admin/gallery',                              'controller' => 'GalleryController',      'auth' =>true,'action' => 'index'             ];
        $ar['admin.gallery.create']        = ['route' => '/admin/gallery/create',                       'controller' => 'GalleryController',      'auth' =>true,'action' => 'create'            ];
        $ar['admin.gallery.store']         = ['route' => '/admin/gallery/store',   'method'=>'POST',    'controller' => 'GalleryController',      'auth' =>true,'action' => 'store'             ];
        $ar['admin.gallery.edit']          = ['route' => '/admin/gallery/edit',                         'controller' => 'GalleryController',      'auth' =>true,'action' => 'edit'              ];
        $ar['admin.gallery.update']        = ['route' => '/admin/gallery/update', 'method'=>'POST',     'controller' => 'GalleryController',      'auth' =>true,'action' => 'update'            ];
        $ar['admin.gallery.delete']        = ['route' => '/admin/gallery/delete',                       'controller' => 'GalleryController',      'auth' =>true,'action' => 'delete'            ];

        $ar['admin.photo.create']          = ['route' => '/admin/photo/create',                         'controller' => 'PhotoController',          'auth' =>true,'action' => 'create'          ];
        $ar['admin.photo.edit']            = ['route' => '/admin/photo/edit',                           'controller' => 'PhotoController',          'auth' =>true,'action' => 'edit'            ];
        $ar['admin.photo.update']          = ['route' => '/admin/photo/update','method'=>'POST',        'controller' => 'PhotoController',          'auth' =>true,'action' => 'update'          ];
        $ar['admin.photo.upload']          = ['route' => '/admin/photo/upload','method'=>'POST',        'controller' => 'PhotoController',          'auth' =>true,'action' => 'upload'          ];
        $ar['admin.photo.delete']          = ['route' => '/admin/photo/delete',                         'controller' => 'PhotoController',          'auth' =>true,'action' => 'delete'          ];

        $ar['admin.contact']               = ['route' => '/admin/contact',                              'controller' => 'ContactController',      'auth' =>true,'action' => 'index'             ];
        $ar['admin.contact.show']          = ['route' => '/admin/contact/show',                         'controller' => 'ContactController',      'auth' =>true,'action' => 'show'              ];
        $ar['admin.contact.delete']        = ['route' => '/admin/contact/delete',                       'controller' => 'ContactController',      'auth' =>true,'action' => 'delete'            ];
        $ar['admin.contact.toClient']      = ['route' => '/admin/contact/toClient',                   'controller' => 'ContactController',      'auth' =>true,'action' => 'toClient'            ];

        $ar['admin.comment.create']        = ['route' => '/admin/comment/create',                        'controller' => 'CommentController',      'auth' =>true,'action' => 'create'           ];
        $ar['admin.comment.store']         = ['route' => '/admin/comment/store',                         'controller' => 'CommentController',      'auth' =>true,'action' => 'store'            ];
        $ar['admin.comment.edit']          = ['route' => '/admin/comment/edit',                          'controller' => 'CommentController',      'auth' =>true,'action' => 'edit'             ];
        $ar['admin.comment.update']        = ['route' => '/admin/comment/update',                        'controller' => 'CommentController',      'auth' =>true,'action' => 'update'           ];
        $ar['admin.comment.delete']        = ['route' => '/admin/comment/delete',                        'controller' => 'CommentController',      'auth' =>true,'action' => 'delete'           ];

        $ar['admin.user']                  = ['route' => '/admin/user',                                  'controller' => 'UserController',         'auth' =>true,'action' => 'index'            ];
        $ar['admin.user.create']           = ['route' => '/admin/user/create',                           'controller' => 'UserController',         'auth' =>true,'action' => 'create'           ];
        $ar['admin.user.store']            = ['route' => '/admin/user/store',                            'controller' => 'UserController',         'auth' =>true,'action' => 'store'            ];
        $ar['admin.user.edit']             = ['route' => '/admin/user/edit',                             'controller' => 'UserController',         'auth' =>true,'action' => 'edit'             ];
        $ar['admin.user.update']           = ['route' => '/admin/user/update',                           'controller' => 'UserController',         'auth' =>true,'action' => 'update'           ];
        $ar['admin.user.delete']           = ['route' => '/admin/user/delete',                           'controller' => 'UserController',         'auth' =>true,'action' => 'delete'           ];
        $ar['admin.user.reset']            = ['route' => '/admin/user/reset',                            'controller' => 'UserController',                       'action' => 'reset'            ];
        $ar['admin.user.passwordUpdate']   = ['route' => '/admin/user/passwordUpdate',                   'controller' => 'UserController',                       'action' => 'passwordUpdate'   ];

        $ar['admin.client']                = ['route' => '/admin/client',                                'controller' => 'ClientController',       'auth' =>true,'action' => 'index'            ];
        $ar['admin.client.create']         = ['route' => '/admin/client/create',                         'controller' => 'ClientController',       'auth' =>true,'action' => 'create'           ];
        $ar['admin.client.store']          = ['route' => '/admin/client/store',                          'controller' => 'ClientController',       'auth' =>true,'action' => 'store'            ];
        $ar['admin.client.show']           = ['route' => '/admin/client/show',                           'controller' => 'ClientController',       'auth' =>true,'action' => 'show'             ];
        $ar['admin.client.edit']           = ['route' => '/admin/client/edit',                           'controller' => 'ClientController',       'auth' =>true,'action' => 'edit'             ];
        $ar['admin.client.update']         = ['route' => '/admin/client/update',                         'controller' => 'ClientController',       'auth' =>true,'action' => 'update'           ];
        $ar['admin.client.delete']         = ['route' => '/admin/client/delete',                         'controller' => 'ClientController',       'auth' =>true,'action' => 'delete'           ];

        //$ar['admin.personal_password.generate']         = ['route' => '/admin/generate',                                'controller' => 'PasswordController',                   'auth' =>true,'action' => 'generate'        ];
        $ar['admin.personal_password']                  = ['route' => '/admin/personal_password/addPassword',           'controller' => 'PasswordController',                   'auth' =>true,'action' => 'addPassword'     ];
        $ar['admin.personal_password.passwords']        = ['route' => '/admin/personal_password/passwords',             'controller' => 'PasswordController',                   'auth' =>true,'action' => 'passwords'       ];
        $ar['admin.personal_password.inactive']          = ['route' => '/admin/personal_password/inactive',               'controller' => 'PasswordController',                   'auth' =>true,'action' => 'inactive'         ];
        $ar['admin.personal_password.comment']          = ['route' => '/admin/personal_password/comment',               'controller' => 'PasswordController',                   'auth' =>true,'action' => 'comment'         ];
        $ar['admin.personal_password.reset']            = ['route' => '/admin/personal_password/reset',                 'controller' => 'PasswordController',                   'auth' =>true,'action' => 'reset'           ];
        $ar['admin.personal_password.activate']         = ['route' => '/admin/personal_password/activate',              'controller' => 'PasswordController',                   'auth' =>true,'action' => 'activate'        ];
        $ar['admin.personal_password.sendPassword']     = ['route' => '/admin/personal_password/sendPassword',          'controller' => 'PasswordController',                   'auth' =>true,'action' => 'sendPassword'    ];
        $ar['admin.personal_password.blockade']         = ['route' => '/admin/personal_password/blockade',              'controller' => 'PasswordController',                   'auth' =>true,'action' => 'blockade'        ];
        $ar['admin.personal_password.blocked']         = ['route' => '/admin/personal_password/blocked',                'controller' => 'PasswordController',                   'auth' =>true,'action' => 'blocked'        ];

        $this->setRoutes($ar);

    }

}
