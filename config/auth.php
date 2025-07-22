<?php

namespace Illuminate\Support\Facades; // NE PAS garder ce namespace ; juste en haut du fichier lisez bien "namespace" ci-dessous.

use App\Models\Utilisateur;  // ← Importez votre modèle ici

return [

    /*
    |--------------------------------------------------------------------------
    | Authentication Defaults
    |--------------------------------------------------------------------------
    */
    'defaults' => [
    'guard'     => 'web',          
    'passwords' => 'utilisateurs',
],
    /*
    |--------------------------------------------------------------------------
    | Authentication Guards
    |--------------------------------------------------------------------------
    */
    'guards' => [
        'web' => [
            'driver'   => 'session',
            'provider' => 'utilisateurs',
        ],

        'api' => [
            'driver'   => 'sanctum',     // si vous n’utilisez pas Sanctum, mettez 'token'
            'provider' => 'utilisateurs',// ← doit matcher la clé du provider ci-dessous
            'hash'     => false,
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | User Providers
    |--------------------------------------------------------------------------
    */
    'providers' => [
        'utilisateurs' => [
            'driver' => 'eloquent',
            'model'  => Utilisateur::class,  // ← grâce au "use" du haut
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Resetting Passwords
    |--------------------------------------------------------------------------
    */
    'passwords' => [
        'utilisateurs' => [
            'provider' => 'utilisateurs',
            'table'    => env('AUTH_PASSWORD_RESET_TOKEN_TABLE', 'password_reset_tokens'),
            'expire'   => 60,
            'throttle' => 60,
        ],
    ],

    'password_timeout' => env('AUTH_PASSWORD_TIMEOUT', 10800),
];
