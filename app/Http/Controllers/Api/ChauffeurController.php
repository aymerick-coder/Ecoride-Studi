<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Utilisateur;
use App\Models\Vehicule;
use App\Models\Trajet;

class ChauffeurController extends Controller
{
 public function show($id)
{
    $chauffeur = Utilisateur::with([
        'vehicule', 
        'trajetsConducteur.vehicule'
    ])->findOrFail($id);

    $trajetsCount = Trajet::where('conducteur_id', $id)->count();

    return response()->json([
        'id' => $chauffeur->id,
        'nom' => $chauffeur->nom,
        'prenom' => $chauffeur->prenom,
        'email' => $chauffeur->email,
        'photo' => $chauffeur->photo,
        'vehicule' => $chauffeur->vehicule,
        'trajets_count' => $trajetsCount,
        'preferences' => $chauffeur->vehicule?->preferences,
        'trajets' => $chauffeur->trajetsConducteur->map(function($trajet) {
            return [
                'id' => $trajet->id,
                'vehicule' => $trajet->vehicule,
                'ville_depart' => $trajet->ville_depart,
                'ville_arrivee' => $trajet->ville_arrivee
            ];
        }),
    ]);
}


   public function suspendre($id)
{
    $chauffeur = Utilisateur::find($id);

    if (!$chauffeur || $chauffeur->role !== 'conducteur') {
        return response()->json(['message' => 'Chauffeur introuvable ou non valide'], 404);
    }

    $chauffeur->status = $chauffeur->status === 'suspendu' ? 'actif' : 'suspendu';
    $chauffeur->save();

    return response()->json([
        'message' => "Le compte du chauffeur a été {$chauffeur->status} avec succès.",
        'nouveau_status' => $chauffeur->status
    ]);
}

public function listeChauffeurs()
{
    try {
        $chauffeurs = DB::table('utilisateurs')
            ->join('trajets', 'utilisateurs.id', '=', 'trajets.conducteur_id')
            ->select(
                'utilisateurs.id',
                'utilisateurs.nom',
                'utilisateurs.prenom',
                'utilisateurs.email',
                'utilisateurs.telephone',
                'utilisateurs.status' 
            )
            ->groupBy(
                'utilisateurs.id',
                'utilisateurs.nom',
                'utilisateurs.prenom',
                'utilisateurs.email',
                'utilisateurs.telephone',
                'utilisateurs.status' 
            )
            ->get();

        return response()->json($chauffeurs);
    } catch (\Throwable $e) {
        \Log::error("Erreur listeChauffeurs : " . $e->getMessage());
        return response()->json([
            'error' => true,
            'message' => $e->getMessage()
        ], 500);
    }
}

public function supprimerChauffeur($id)
{
    $chauffeur = Utilisateur::find($id);

    if (!$chauffeur) {
        return response()->json(['message' => 'Chauffeur introuvable.'], 404);
    }

    Trajet::where('conducteur_id', $chauffeur->id)->delete();

    Vehicule::where('proprietaire_id', $chauffeur->id)->delete();

    $chauffeur->delete();

    return response()->json(['message' => 'Chauffeur, ses trajets et ses véhicules supprimés avec succès.']);
}

}
