<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IsAdmin
{
    public function handle(Request $request, Closure $next)
    {
        $user = Auth::user();
        if ($user && $user->role === 'admin') {
            return $next($request);
        }
        return response()->json(['message' => 'Accès refusé'], 403);
    }
}

