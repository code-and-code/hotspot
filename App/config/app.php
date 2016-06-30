<?php

return [
           'public'    => false,
           'timezone' => 'UTC',

           'database' => [ 'host'     => '127.0.0.1',
                           'dbname'   => 'hotspot',
                           'username' => 'root',
                           'password' =>  ''
                          ],

            'layout' =>  [ 'folder'     => '../App/views/',
                           'tag'       => ['{','}'],
                           'extension' => '.html.twig',
                           'cache'     => 'storage/compilation_cache'
                        ],

            'file'  => [
                            'folder' => 'images'
                        ],

            'cache'  => [ 'active' => false,
                          'folder' => 'storage/cache',

                        ]
];
