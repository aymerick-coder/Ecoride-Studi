<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\Avis;

class AvisChauffeurController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'trajet'              => 'required|string',
            'passager_id'         => 'required|integer',
            'conducteur_id'       => 'required|integer',
            'note'                => 'required|integer|min:1|max:5',
            'commentaire'         => 'nullable|string',
            'ponctualite'         => 'nullable|string',
            'conduite_securisee'  => 'nullable|boolean',
            'recommande'          => 'nullable|boolean',
        ]);

        $avis = Avis::create([
            'trajet'              => $validated['trajet'],
            'passager_id'         => $validated['passager_id'],
            'conducteur_id'       => $validated['conducteur_id'],
            'note'                => $validated['note'],
            'commentaire'         => $validated['commentaire'] ?? '',
            'ponctualite'         => $validated['ponctualite'] ?? '',
            'conduite_securisee'  => $validated['conduite_securisee'] ?? false,
            'recommande'          => $validated['recommande'] ?? false,
            'statut_avis'         => 'en_attente',
            'date_creation'       => now(),
        ]);

        return response()->json([
            'message' => 'Avis enregistré avec succès',
            'avis'    => $avis,
        ], 201);
    }

   public function getAllAvis()
{
   $avis = DB::table('avis')
    ->join('utilisateurs as passager', 'avis.passager_id', '=', 'passager.id')
    ->join('utilisateurs as conducteur', 'avis.conducteur_id', '=', 'conducteur.id')
    ->select(
        'avis.*',
        'passager.nom as passager_nom',
        'passager.prenom as passager_prenom',
        'passager.email as passager_email',
        'conducteur.nom as conducteur_nom',
        'conducteur.prenom as conducteur_prenom',
        'conducteur.email as conducteur_email'
    )
    ->get();

return response()->json($avis);
}

public function getAvisValides($id)
{
    $avis = DB::table('avis')
        ->join('utilisateurs as passager', 'avis.passager_id', '=', 'passager.id')
        ->where('avis.conducteur_id', $id)
        ->where('avis.statut_avis', 'approuve')
        ->select(
            'avis.*',
            'passager.nom as passager_nom',
            'passager.prenom as passager_prenom'
        )
        ->get();

    return response()->json($avis);
}

public function validerAvis($id)
{
    $avis = Avis::find($id);
    if (!$avis) {
        return response()->json(['message' => 'Avis non trouvé'], 404);
    }

    $avis->statut_avis = 'approuve';
    $avis->save();

    $conducteurId = $avis->conducteur_id;

    $moyenne = Avis::where('conducteur_id', $conducteurId)
                    ->where('statut_avis', 'approuve')
                    ->avg('note');

    DB::table('utilisateurs')
        ->where('id', $conducteurId)
        ->update(['note_moyenne' => $moyenne]);

    return response()->json(['message' => 'Avis validé et note du chauffeur mise à jour']);
}

}
