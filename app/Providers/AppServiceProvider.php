<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Routing\Router;
use Carbon\Carbon;

class AppServiceProvider extends ServiceProvider
{
    public function register()
    {
        //
    }

    public function boot(Router $router)
{
    $router->middlewareGroup('api', [
        'throttle:api',
        \Illuminate\Routing\Middleware\SubstituteBindings::class,
    ]);
    Carbon::setLocale('fr');
    date_default_timezone_set('Europe/Paris');
}
}
