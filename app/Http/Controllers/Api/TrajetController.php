<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Trajet;
use App\Models\Vehicule;
use App\Models\Utilisateur;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class TrajetController extends Controller
{

public function store(Request $request)
{
       $data = $request->validate([
            'ville_depart'   => 'required|string|max:255',
            'ville_arrivee'  => 'required|string|max:255',
            'heure_depart'   => 'required|date_format:H:i',
            'heure_arrivee'  => 'required|date_format:H:i',
            'date_creation' => 'required|date_format:d/m/Y',
            'prix_credits'   => 'required|integer|min:0',
            'vehicule_id'    => 'required|exists:vehicules,id',
        ]);

      
        $carbonDate = Carbon::createFromFormat('d/m/Y', $data['date_creation']);


        $data['date_creation'] = $carbonDate->format('Y-m-d');


        $data['heure_depart']  = $data['date_creation'] . ' ' . $data['heure_depart']  . ':00';
        $data['heure_arrivee'] = $data['date_creation'] . ' ' . $data['heure_arrivee'] . ':00';

        $data['conducteur_id'] = Auth::id();
        $data['statut_trajet'] = 'À venir';


        $vehicule = Vehicule::findOrFail($data['vehicule_id']);;
        $data['places_disponibles'] = $vehicule->nombre_places;
        $data['eco_responsable'] = false;


      $trajet = Trajet::create($data);

        return response()->json([
            'message' => 'Trajet créé',
            'trajet'  => $trajet
        ], 201);
    }

   
 public function historique()
{
    try {
        $userId = Auth::id();
        $hist = Trajet::with('vehicule') 
            ->where('conducteur_id', $userId)
            ->orderBy('date_creation', 'desc')
            ->get();

        return response()->json($hist);
    } catch (\Throwable $e) {
        return response()->json([
            'error'   => true,
            'message' => $e->getMessage(),
        ], 500);
    }
}

 public function rechercher(Request $request)
{
    $ville_depart = $request->query('depart');
    $ville_arrivee = $request->query('arrivee');
    $date = $request->query('date');
    $places = $request->query('places');

    $query = \App\Models\Trajet::with('conducteur');

    if ($ville_depart) {
        $query->where('ville_depart', 'LIKE', "%{$ville_depart}%");
    }
    if ($ville_arrivee) {
        $query->where('ville_arrivee', 'LIKE', "%{$ville_arrivee}%");
    }
    if ($date) {
        try {
            $dateSql = \Carbon\Carbon::createFromFormat('d/m/Y', $date)->format('Y-m-d');
            $query->whereDate('heure_depart', $dateSql);
        } catch (\Exception $e) {
            \Log::error("Date invalide reçue : $date");
        }
    }
    if ($places) {
        $query->where('places_disponibles', '>=', $places);
    }
    $query->where('places_disponibles', '>', 0);

    $trajets = $query->get();

    $result = $trajets->map(function($t) {
        return [
            "id" => $t->id,
            "nom" => $t->conducteur
                ? $t->conducteur->prenom . ' ' . $t->conducteur->nom
                : "Conducteur inconnu",
            "ville_depart" => $t->ville_depart,
            "ville_arrivee" => $t->ville_arrivee,
            "heure_depart" => \Carbon\Carbon::parse($t->heure_depart)->format('d/m/Y H:i'),
            "heure_arrivee" => \Carbon\Carbon::parse($t->heure_arrivee)->format('d/m/Y H:i'),
            "date_creation" => \Carbon\Carbon::parse($t->date_creation)->format('d/m/Y'),
            "places_disponibles" => $t->places_disponibles,
            "prix_credits" => $t->prix_credits,
            "eco_responsable" => $t->eco_responsable,
        ];
    });

  return response()->json($result);
}


public function participer($id)
{
    try {
        $user = auth()->user();
        if (!$user) {
            return response()->json(['message' => 'Non authentifié'], 401);
        }

        $trajet = Trajet::findOrFail($id);

        if ($trajet->places_disponibles <= 0) {
            return response()->json(['message' => 'Plus de places disponibles'], 400);
        }

        $prix = $trajet->prix_credits;

        if ($user->credits < $prix) {
            return response()->json(['message' => 'Crédits insuffisants'], 400);
        }

        $user->credits -= $prix;
        $user->save();

        $chauffeur = Utilisateur::findOrFail($trajet->conducteur_id);
        $chauffeur->credits += $prix;
        $chauffeur->save();

        DB::table('trajet_participants')->insert([
            'trajet_id' => $trajet->id,
            'utilisateur_id' => $user->id,
            'credits_utilises' => $prix,
            'confirm' => 1,
            'date_confirmation' => now()
        ]);

        $trajet->places_disponibles -= 1;

        if ($trajet->places_disponibles <= 0) {
            $trajet->statut_trajet = 'Complet';
        }

        $trajet->save();

        return response()->json(['message' => 'Participation validée']);
    } catch (\Throwable $e) {
        \Log::error("Erreur participer: " . $e->getMessage());
        return response()->json(['message' => $e->getMessage()], 500);
    }
}

public function historiquePassager()
{
    try {
        $userId = Auth::id();
$trajets = DB::table('trajet_participants')
    ->join('trajets', 'trajet_participants.trajet_id', '=', 'trajets.id')
    ->join('utilisateurs', 'trajets.conducteur_id', '=', 'utilisateurs.id')
    ->where('trajet_participants.utilisateur_id', $userId)
    ->where('trajet_participants.confirm', 1)
    ->select(
        'trajets.id',
        'trajets.ville_depart',
        'trajets.ville_arrivee',
        'trajets.heure_depart',
        'trajets.heure_arrivee',
        'trajets.date_creation',
        'trajet_participants.credits_utilises as credits_depenses',
        DB::raw("CONCAT(utilisateurs.prenom, ' ', utilisateurs.nom) as conducteur_nom")
    )
    ->orderBy('trajet_participants.date_confirmation', 'desc')
    ->get();

        return response()->json($trajets);

    } catch (\Throwable $e) {
        \Log::error("Erreur historiquePassager: ".$e->getMessage());
        return response()->json([
            'error' => true,
            'message' => $e->getMessage()
        ], 500);
    }
}
public function index(Request $request)
{
    $trajets = Trajet::with(['conducteur', 'vehicule']) 
        ->withAvg(['avis as note_moyenne' => function ($q) {
            $q->where('statut_avis', 'approuve'); 
        }], 'note')
        ->whereNotNull('conducteur_id')
        ->where('statut_trajet', 'À venir')
        ->whereDate('heure_depart', '>=', now()->toDateString())
        ->get();

    $result = $trajets->map(function($t) {
        return [
            'id'                 => $t->id,
            'nom'                => $t->conducteur
                                     ? $t->conducteur->prenom.' '.$t->conducteur->nom
                                     : '—',
            'conducteur_id'      => $t->conducteur_id,
            'ville_depart'       => $t->ville_depart,
            'ville_arrivee'      => $t->ville_arrivee,
            'heure_depart'       => \Carbon\Carbon::parse($t->heure_depart)->format('d/m/Y H:i'),
            'heure_arrivee'      => \Carbon\Carbon::parse($t->heure_arrivee)->format('d/m/Y H:i'),
            'date_creation'      => \Carbon\Carbon::parse($t->date_creation)->format('d/m/Y'),
            'places_disponibles' => $t->places_disponibles,
            'prix_credits'       => $t->prix_credits,
            'eco_responsable'    => $t->eco_responsable,
            'note_moyenne'       => round($t->note_moyenne, 1),
            'vehicule'           => $t->vehicule ? [
                'marque' => $t->vehicule->marque,
                'modele' => $t->vehicule->modele,
                'energie' => $t->vehicule->type_energie
            ] : null,
        ];
    });

    return response()->json($result);
}




public function listeReservationsAdmin()
{
    try {
       $reservations = DB::table('trajet_participants')
    ->join('trajets', 'trajet_participants.trajet_id', '=', 'trajets.id')
    ->join('utilisateurs as passager', 'trajet_participants.utilisateur_id', '=', 'passager.id')
    ->join('utilisateurs as chauffeur', 'trajets.conducteur_id', '=', 'chauffeur.id')
    ->where('trajet_participants.confirm', 1)
    ->select(
        DB::raw("CONCAT(trajet_participants.trajet_id, '_', trajet_participants.utilisateur_id) as id"),
        'trajets.ville_depart',
        'trajets.ville_arrivee',
        DB::raw("DATE_FORMAT(trajets.heure_depart, '%H:%i') as heure_depart"),
        DB::raw("DATE_FORMAT(trajets.heure_arrivee, '%H:%i') as heure_arrivee"),
        'trajets.date_creation as date',
        DB::raw("CONCAT(passager.prenom, ' ', passager.nom) as passager_nom"),
        DB::raw("CONCAT(chauffeur.prenom, ' ', chauffeur.nom) as chauffeur_nom"),
        'passager.email as passager_email',
        'chauffeur.email as chauffeur_email'
    )
    ->orderBy('trajet_participants.date_confirmation', 'desc')  
    ->get();

        return response()->json($reservations);

    } catch (\Throwable $e) {
        \Log::error("Erreur listeReservationsAdmin : ".$e->getMessage());
        return response()->json([
            'error' => true,
            'message' => $e->getMessage()
        ], 500);
    }
}

public function listeChauffeurs()
{
    try {
        $chauffeurs = DB::table('utilisateurs')
            ->join('trajets', 'utilisateurs.id', '=', 'trajets.conducteur_id')
            ->select('utilisateurs.id', 'utilisateurs.nom', 'utilisateurs.prenom', 'utilisateurs.email', 'utilisateurs.telephone', 'utilisateurs.status')
            ->groupBy('utilisateurs.id', 'utilisateurs.nom', 'utilisateurs.prenom', 'utilisateurs.email', 'utilisateurs.telephone', 'utilisateurs.status')
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

public function changerStatut(Request $request, $id)
{
    $trajet = Trajet::find($id);
    if (!$trajet) {
        return response()->json(['message' => 'Trajet non trouvé'], 404);
    }

    $statut = $request->input('statut');

   $mapping = [
    'En cours' => 'en_cours',
    'Terminé'  => 'termine',
    'Annulé'   => 'annule',
    'À venir'  => 'À venir',
];

$nouveauStatut = $mapping[$statut] ?? null;

    if ($nouveauStatut && in_array($nouveauStatut, ['À venir', 'en_cours', 'termine', 'annule'])) {
        $trajet->statut_trajet = $nouveauStatut;
        $trajet->save();
        return response()->json(['message' => "Statut changé en $nouveauStatut"]);
    }

    return response()->json(['message' => 'Statut invalide'], 400);
}

public function supprimerHistoriquePassager($id)
{
    try {
        $userId = Auth::id();

        $participant = DB::table('trajet_participants')
            ->where('utilisateur_id', $userId)
            ->where('trajet_id', $id)
            ->first();

        if (!$participant) {
            return response()->json(['message' => 'Trajet non trouvé ou non associé à l’utilisateur.'], 404);
        }

        DB::table('trajet_participants')
            ->where('utilisateur_id', $userId)
            ->where('trajet_id', $id)
            ->delete();

        return response()->json(['message' => 'Trajet supprimé avec succès.']);

    } catch (\Throwable $e) {
        \Log::error("Erreur suppression trajet passager : " . $e->getMessage());
        return response()->json([
            'error' => true,
            'message' => $e->getMessage()
        ], 500);
    }
}

public function getVilles()
{
    $villes_depart = Trajet::select('ville_depart')
                    ->distinct()
                    ->pluck('ville_depart');

    $villes_arrivee = Trajet::select('ville_arrivee')
                    ->distinct()
                    ->pluck('ville_arrivee');

    return response()->json([
        'depart' => $villes_depart,
        'arrivee' => $villes_arrivee
    ]);
}
}



