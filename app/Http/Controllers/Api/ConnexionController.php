<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Utilisateur;
use App\Models\Employe;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;


class ConnexionController extends Controller
{
public function login(Request $request)
{
    $request->validate([
        'email' => 'required|email',
        'password' => 'required'
    ]);

    $user = Utilisateur::where('email', $request->email)->first();

    if ($user && Hash::check($request->password, $user->password)) {

    if ($user->status === 'suspendu') {
        return response()->json([
            'message' => 'Votre compte est suspendu. Veuillez contacter un administrateur.'
        ], 403);
    }

    $token = $user->createToken('ecoride-token')->plainTextToken;

    return response()->json([
        'message' => 'Connexion réussie',
        'utilisateur' => $user,
        'token' => $token,
        'role' => $user->role ?? 'user'
    ]);
}

   $admin = \App\Models\Admin::where('email', $request->email)->first();

if ($admin) {
    \Log::debug('password clair', ['pass' => $request->password]);
    \Log::debug('password hash BDD', ['hash' => $admin->password]);
    
    if (Hash::check($request->password, $admin->password)) {
        $token = $admin->createToken('ecoride-admin-token')->plainTextToken;

        return response()->json([
            'message' => 'Connexion réussie',
            'utilisateur' => $admin,
            'role' => 'admin',  
            'token' => $token
        ]);
    }
}



   $employe = \App\Models\Employe::where('email', $request->email)->first();

if (!$employe) {
    \Log::debug('EMPLOYE INEXISTANT', ['email_recu' => $request->email]);
    return response()->json(['message' => 'Employé non trouvé'], 404);
}

if (Hash::check($request->password, $employe->password)) {
    $token = $employe->createToken('ecoride-employee-token')->plainTextToken;

    return response()->json([
        'message' => 'Connexion réussie',
        'utilisateur' => $employe,
        'role' => 'employee',
        'token' => $token
    ]);
}

    return response()->json(['message' => 'Identifiants incorrects'], 401);
}




public function userInfo(Request $request)
{
    $user = Auth::user(); 

    if (!$user) {
        return response()->json(['message' => 'Non authentifié.'], 401);
    }

    return response()->json([
        'utilisateur' => [
            'id' => $user->id,
            'prenom' => $user->prenom,
            'nom' => $user->nom,
            'email' => $user->email,
            'telephone' => $user->telephone,
            'adresse' => $user->adresse,
            'date_naissance' => $user->date_naissance,
            'photo' => $user->photo,
        ]
    ]);
}
    }
    

