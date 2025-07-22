<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Contact;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    // POST /api/contacts
    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email'      => 'required|email|max:255',
            'subject'    => 'required|string|max:255',
            'message'    => 'required|string',
        ]);

        $contact = Contact::create($data);

        return response()->json([
            'message' => 'Merci, votre message a bien été pris en compte.',
            'contact' => $contact
        ], 201);
    }

    public function index()
    {
        return Contact::orderBy('created_at', 'desc')->get();
    }

    public function destroy($id)
{
    $contact = Contact::find($id);

    if (!$contact) {
        return response()->json(['message' => 'Message non trouvé'], 404);
    }

    $contact->delete();

    return response()->json(['message' => 'Message supprimé']);
}

}

