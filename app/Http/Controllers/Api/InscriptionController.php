<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Utilisateur;
use Illuminate\Support\Facades\Hash;

class InscriptionController extends Controller
{
    public function store(Request $request)
    {
        $data = $request->validate([
            'nom'                  => 'required|string|max:255',
            'prenom'               => 'required|string|max:255',
            'email'                => 'required|email|unique:utilisateurs,email',
            'password'             => 'required|string|confirmed|min:8',
            'telephone'            => 'required|string|max:20',
            'adresse'              => 'required|string|max:255',
            'date_naissance'       => 'required|date',
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        if ($request->hasFile('photo')) {
    $photo = $request->file('photo');
    $photoName = time() . '_' . $photo->getClientOriginalName();
    $photo->move(public_path('images/utilisateurs'), $photoName);
    $data['photo'] = $photoName;
}
      
        $data['password'] = Hash::make($data['password']);

      
        $data['credits'] = 20;

        $user = Utilisateur::create($data);

        return response()->json([
            'message' => 'Inscription réussie',
            'data'    => $user
        ], 201);
    }
}

