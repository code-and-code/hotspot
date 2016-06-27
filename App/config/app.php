<?php

return [
           'public'    => true,
           'timezone' => 'UTC',

           'database' => [ 'host'     => '127.0.0.1',
                           'dbname'   => 'hotspot',
                           'username' => 'root',
                           'password' =>  ''
                          ],

            'layout' =>  ['folder'     => '../App/views/',
                           'tag'       => ['{','}'],
                           'extension' => '.html.twig'
                        ],

            'file '  => ['folder' => 'public']

        ];

