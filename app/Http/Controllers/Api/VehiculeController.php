<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Vehicule;
use Illuminate\Support\Facades\Auth;
use App\Models\Trajet;
use App\Models\TrajetParticipant;

class VehiculeController extends Controller
{
    public function store(Request $request)
    {
        $data = $request->validate([
            'immatriculation' => 'required|string|max:255',
            'date_premiere_immatriculation' => 'required|date',
            'marque' => 'required|string|max:255',
            'modele' => 'required|string|max:255',
            'couleur' => 'required|string|max:255',
            'type_energie' => 'required|in:essence,diesel,electrique,hybride',
            'nombre_places' => 'required|integer|min:1',
            'fumeur' => 'required|in:0,1',
            'animaux' => 'required|in:0,1',
            'voyage_ecologique' => 'required|in:0,1',
            'preferences' => 'nullable|string',
        ]);

        $data['proprietaire_id'] = Auth::id();

        if (empty($data['preferences'])) {
            $data['preferences'] = 'Non';
        }

        Vehicule::create($data);

        return response()->json([
            'message' => 'Véhicule enregistré avec succès',
            'data' => $data
        ]);
    }
   public function index($userId)
{
   
    if ($userId != Auth::id()) {
        return response()->json(['message'=>'Non autorisé'], 403);
    }

    $vehicules = Vehicule::where('proprietaire_id', $userId)->get();
    return response()->json($vehicules);
}
public function mesVehicules($id)
{
    return response()->json(
        \App\Models\Vehicule::where('proprietaire_id', $id)->get()
    );
}

public function destroy($id)
{
    $user = auth()->user();

    $vehicule = Vehicule::where('id', $id)
        ->where('proprietaire_id', $user->id)
        ->first();

    if (!$vehicule) {
        return response()->json(['message' => 'Véhicule non trouvé ou non associé à l\'utilisateur.'], 404);
    }
    $trajets = Trajet::where('vehicule_id', $vehicule->id)->get();

    foreach ($trajets as $trajet) {
        TrajetParticipant::where('trajet_id', $trajet->id)->delete();

        $trajet->delete();
    }

    $vehicule->delete();

    return response()->json(['message' => 'Véhicule, trajets et participants supprimés avec succès']);
}



}


