<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class StatistiquesController extends Controller
{
    public function trajetsParJour()
{
    $debutSemaine = Carbon::now()->startOfWeek();
    $finSemaine = Carbon::now();          

    $resultats = DB::table('trajet_participants')
        ->select(DB::raw("DAYNAME(date_confirmation) as jour, COUNT(*) as total"))
        ->whereBetween('date_confirmation', [$debutSemaine, $finSemaine])
        ->where('confirm', 1)
        ->groupBy('jour')
        ->get();

    $joursMap = [
        'Monday' => 'Lundi',
        'Tuesday' => 'Mardi',
        'Wednesday' => 'Mercredi',
        'Thursday' => 'Jeudi',
        'Friday' => 'Vendredi',
        'Saturday' => 'Samedi',
        'Sunday' => 'Dimanche',
    ];

    $data = array_fill_keys(array_values($joursMap), 0);

    foreach ($resultats as $row) {
        $jourFr = $joursMap[$row->jour] ?? $row->jour;
        $data[$jourFr] = $row->total;
    }

    return response()->json(array_values($data));
}
}