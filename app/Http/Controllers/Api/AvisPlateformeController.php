<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\AvisPlateforme;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;  

class AvisPlateformeController extends Controller
{
    public function store(Request $request)
{
    $data = $request->validate([
        'nom_prenom' => 'required|string|max:255',
        'email' => 'required|email|max:255',
        'note' => 'required|integer|min:0|max:5',
        'message' => 'nullable|string',
    ]);
    
    if (Auth::check()) {
        $data['utilisateur_id'] = Auth::id();
    }

    AvisPlateforme::create($data);

    return response()->json(['message' => 'Avis bien enregistré !'], 201);
}

   public function index()
{
  $avis = \App\Models\AvisPlateforme::with('utilisateur')->get();

$avis = $avis->map(function ($a) {
    return [
        'id' => $a->id,
        'message' => $a->message,
        'note' => $a->note,
        'valide' => $a->valide,
        'nom_prenom' => $a->utilisateur ? $a->utilisateur->prenom . ' ' . $a->utilisateur->nom : $a->nom_prenom,
        'email' => $a->utilisateur ? $a->utilisateur->email : $a->email,
    ];
});

return response()->json($avis);
}
public function destroy($id)
{
    $avis = \App\Models\AvisPlateforme::find($id);

    if (!$avis) {
        return response()->json(['message' => 'Avis non trouvé'], 404);
    }

    $avis->delete();

    return response()->json(['message' => 'Avis supprimé']);
}

public function valider($id)
{
    $avis = \App\Models\AvisPlateforme::find($id);

    if (!$avis) {
        return response()->json(['message' => 'Avis introuvable'], 404);
    }

    $avis->valide = true;
    $avis->save();

    return response()->json(['message' => 'Avis validé']);
}

}

