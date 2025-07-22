<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Incident;
use Illuminate\Support\Facades\DB;

class IncidentController extends Controller
{
 public function store(Request $request)
{
    \Log::info("REQUETE INCIDENT", $request->all());

   $validated = $request->validate([
    'utilisateur_id' => 'nullable|integer',
    'conducteur_id' => 'nullable|integer',
    'trajet_id' => 'required|integer',
    'date_depart' => 'required|date',
    'heure_depart' => 'required',
    'heure_arrivee' => 'required',
    'message' => 'nullable|string',
]);

$trajet_id = $validated['trajet_id'];
$conducteur_id = DB::table('trajets')
    ->where('id', $trajet_id)
    ->value('conducteur_id');


   DB::table('incidents')->insert([
    'utilisateur_id' => $validated['utilisateur_id'] ?? null,
    'conducteur_id' => $conducteur_id,
    'trajet'      => $trajet_id,   
    'date_depart' => $validated['date_depart'],
    'heure_depart' => $validated['heure_depart'],
    'heure_arrivee' => $validated['heure_arrivee'],
    'message' => $validated['message'],
    'statut' => 'en_attente',
    'date_creation' => now(),
]);

    return response()->json(['message' => 'Incident enregistré'], 201);
}


    public function index()
{
   $incidents = DB::table('incidents')
    ->leftJoin('utilisateurs as u', 'incidents.utilisateur_id', '=', 'u.id')
    ->leftJoin('utilisateurs as c', 'incidents.conducteur_id', '=', 'c.id')
    ->select(
        'incidents.*',
        'u.nom as passager_nom',
        'u.prenom as passager_prenom',
        'u.email as passager_email',
        DB::raw("IF(incidents.utilisateur_id = incidents.conducteur_id, NULL, c.nom) as conducteur_nom"),
        DB::raw("IF(incidents.utilisateur_id = incidents.conducteur_id, NULL, c.prenom) as conducteur_prenom"),
        DB::raw("IF(incidents.utilisateur_id = incidents.conducteur_id, NULL, c.email) as conducteur_email")
    )
    ->orderBy('date_creation', 'desc')
    ->get();

    return response()->json($incidents);
}

    public function valider($id)
    {
        DB::table('incidents')->where('id', $id)->update(['statut' => 'valide']);
        return response()->json(['message' => 'Incident validé']);
    }

    public function rejeter($id)
    {
        DB::table('incidents')->where('id', $id)->update(['statut' => 'rejete']);
        return response()->json(['message' => 'Incident rejeté']);
    }

public function enAttente()
{
    return DB::table('incidents')
        ->join('utilisateurs as passager', 'incidents.utilisateur_id', '=', 'passager.id')
        ->leftJoin('utilisateurs as conducteur', 'incidents.conducteur_id', '=', 'conducteur.id')
        ->select(
            'incidents.*',
            'passager.nom as passager_nom',
            'passager.prenom as passager_prenom',
            'passager.email as passager_email',
            'conducteur.nom as conducteur_nom',
            'conducteur.prenom as conducteur_prenom',
            'conducteur.email as conducteur_email'
        )
        ->where('incidents.statut', 'en_attente')
        ->get();
}

public function valides()
{
    return DB::table('incidents')
        ->join('utilisateurs as passager', 'incidents.utilisateur_id', '=', 'passager.id')
        ->leftJoin('utilisateurs as conducteur', 'incidents.conducteur_id', '=', 'conducteur.id')
        ->select(
            'incidents.*',
            'passager.nom as passager_nom',
            'passager.prenom as passager_prenom',
            'passager.email as passager_email',
            'conducteur.nom as conducteur_nom',
            'conducteur.prenom as conducteur_prenom',
            'conducteur.email as conducteur_email',
            'conducteur.status as conducteur_statut'  
        )
        ->where('incidents.statut', 'valide')
        ->get();
}

public function destroy($id)
{
    try {
        $incident = Incident::findOrFail($id);
        $incident->delete();

        return response()->json(['message' => 'Incident supprimé avec succès']);
    } catch (\Exception $e) {
        return response()->json(['error' => 'Erreur suppression incident', 'details' => $e->getMessage()], 500);
    }
}
}

