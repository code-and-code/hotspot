<?php

return [
           'public'    => false,
           'timezone' => 'America/Sao_Paulo',

           'database' => [ 'host'     => 'opmy0008.servidorwebfacil.com',
                           'dbname'   => 'hotspot_site',
                           'username' => 'hotsp_site',
                           'password' =>  'Info1605'
                          ],

            'layout' =>  [ 'folder'     => 'App/views/',
                           'tag'       => ['{','}'],
                           'extension' => '.html.twig',
                           'cache'     => 'storage/compilation_cache'
                        ],

            'file'  => [
                            'folder' => 'images'
                        ],

            'cache'  => [ 'active' => true,
                          'folder' => 'storage/cache',

                        ]
];
