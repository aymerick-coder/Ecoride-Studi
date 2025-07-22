<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class AdminStatsController extends Controller
{
 public function creditsParJour()
{
    $debutSemaine = Carbon::now()->startOfWeek();
    $finSemaine = Carbon::now();

    $credits = DB::table('trajet_participants')
        ->selectRaw('DAYOFWEEK(date_confirmation) as jour_number, DAYNAME(date_confirmation) as jour, SUM(credits_utilises) as total_credits')
        ->where('confirm', 1)
        ->whereBetween('date_confirmation', [$debutSemaine, $finSemaine])
        ->groupBy(DB::raw('DAYOFWEEK(date_confirmation), DAYNAME(date_confirmation)'))
        ->orderBy(DB::raw('jour_number'))
        ->get();

    return response()->json($credits);
}

public function statsGlobales()
{
    $credits = DB::table('trajet_participants')
        ->where('confirm', 1)
        ->sum('credits_utilises');

    $reservations = DB::table('trajet_participants')
        ->where('confirm', 1)
        ->count();

    $utilisateurs = DB::table('utilisateurs')
        ->where('role', 'user')
        ->count();

    $chauffeurs = DB::table('trajets')
        ->distinct('conducteur_id')
        ->count('conducteur_id');

    return response()->json([
        'credits'      => $credits,
        'reservations' => $reservations,
        'utilisateurs' => $utilisateurs,
        'chauffeurs'   => $chauffeurs
    ]);
}




  }
