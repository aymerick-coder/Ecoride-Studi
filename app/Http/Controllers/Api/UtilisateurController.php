<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Utilisateur;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;

class UtilisateurController extends Controller
{
    public function index(): JsonResponse
{
    $users = Utilisateur::all()->map(function ($u) {
        return [
            'id' => $u->id,
            'nom' => $u->nom,
            'prenom' => $u->prenom,
            'email' => $u->email,
            'telephone' => $u->telephone,
            'adresse' => $u->adresse,
            'date_naissance' => $u->date_naissance,
            'photo' => $u->photo,
            'credits' => $u->credits,
            'status' => $u->status,
        ];
    });

    return response()->json($users);
}

   public function getUserInfo(): JsonResponse
{
    $user = Auth::user();

    if (!$user) {
        return response()->json(['error' => 'Non authentifié'], 401);
    }

    return response()->json([
        'prenom' => $user->prenom,
        'email' => $user->email,
        'telephone' => $user->telephone,
        'adresse' => $user->adresse,
    ]);
}
public function destroy($id)
{
    $utilisateur = Utilisateur::find($id);

    if (!$utilisateur) {
        return response()->json(['message' => 'Utilisateur non trouvé.'], 404);
    }

    $utilisateur->delete();

    return response()->json(['message' => 'Compte supprimé avec succès.']);
}
public function getConducteurs()
{
    $userId = Auth::id();

    $conducteurs = Utilisateur::whereHas('trajetsConducteur')
        ->where('id', '!=', $userId)   
        ->select('id', 'prenom', 'nom')
        ->get();

    return response()->json($conducteurs);
}

public function register(Request $request)
{
    $request->validate([
        'nom' => 'required',
        'prenom' => 'required',
        'email' => 'required|email|unique:utilisateurs',
        'password' => 'required|confirmed',
        'photo' => 'required|image|mimes:jpeg,png,jpg,webp|max:2048',
    ]);

    $photoPath = null;
    if ($request->hasFile('photo')) {
        $photoPath = $request->file('photo')->store('photos', 'public');
    }

    $utilisateur = new Utilisateur();
    $utilisateur->nom = $request->nom;
    $utilisateur->prenom = $request->prenom;
    $utilisateur->email = $request->email;
    $utilisateur->password = Hash::make($request->password);
    $utilisateur->photo = $photoPath;
    $utilisateur->save();

    return response()->json(['message' => 'Inscription réussie']);
}

public function updatePhoto(Request $request)
{
    $request->validate([
        'photo' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
    ]);

    $user = Auth::user();

    if ($user->photo) {
        Storage::disk('public')->delete($user->photo);
    }

    $path = $request->file('photo')->store('photos_utilisateurs', 'public');

    $user->photo = $path;
    $user->save();

    return response()->json([
        'message' => 'Photo mise à jour avec succès',
        'photo_url' => asset('storage/' . $path)
    ]);
}

}


