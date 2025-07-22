<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function store(Request $request)
    {
        // validation
        $data = $request->validate([
            'name'    => 'required|string|max:255',
            'email'   => 'required|email|max:255',
            'subject' => 'required|string|max:255',
            'message' => 'required|string',
        ]);

        // enregistrement en base
        Contact::create($data);

        // retour avec message flash
        return redirect()
            ->back()
            ->with('success', 'Votre message a bien été envoyé.');
    }
}
