<?php

namespace App\Providers;

use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Route;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * This is the path users are redirected to after login.
     */
    public const HOME = '/dashboard/user-dashboard.html';

    /**
     * Configure your rate limiters for the application.
     */
    protected function configureRateLimiting(): void
    {
        RateLimiter::for('api', function (Request $request) {
            // 60 requêtes par minute par utilisateur (ou IP si non authentifié)
            return Limit::perMinute(60)->by(
                optional($request->user())->id ?: $request->ip()
            );
        });
    }

    /**
     * Define your route model bindings, pattern filters, etc.
     */
    public function boot(): void
    {
        // 1️⃣ On configure d’abord le rate limiter "api"
        $this->configureRateLimiting();

        // 2️⃣ Ensuite on enregistre les routes
        $this->routes(function () {
            Route::middleware('api')
                ->prefix('api')
                ->group(base_path('routes/api.php'));

            Route::middleware('web')
                ->group(base_path('routes/web.php'));
        });
    }
}
