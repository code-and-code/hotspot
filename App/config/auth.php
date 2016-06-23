<?php

return [
        'auth' => [
        'class'          =>'App\Models\User',
        'viewLogin'      => 'admin.auth.login',
        'viewRegister'   => 'admin.auth.register',
        'required'       => ['email','password'],
        'redirect'       => '/admin',
        'notauthorized'  => '/auth'
    ],
];
