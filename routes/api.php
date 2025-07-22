<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AvisPlateformeController;
use App\Http\Controllers\Api\InscriptionController;
use App\Http\Controllers\Api\UtilisateurController;
use App\Http\Controllers\Api\ContactController;
use App\Http\Controllers\Api\VehiculeController;
use App\Http\Controllers\Api\ConnexionController;
use App\Http\Controllers\Api\TrajetController;
use App\Http\Controllers\Api\AvisChauffeurController;
use Laravel\Sanctum\Http\Controllers\CsrfCookieController;
use App\Models\Utilisateur;
use App\Http\Controllers\Api\IncidentController;
use App\Http\Controllers\AdminStatsController;
use App\Http\Controllers\Api\ChauffeurController;
use App\Http\Controllers\Api\EmployeeController;
use App\Models\Employe;
use App\Models\Incident;
use App\Http\Controllers\StatistiquesController;
use App\Models\Trajet;
use Carbon\Carbon;



Route::get('/sanctum/csrf-cookie', [CsrfCookieController::class, 'show']);



Route::get('/avis-plateforme', [AvisPlateformeController::class, 'index']);
Route::post('/avis-plateforme', [AvisPlateformeController::class, 'store']);

Route::post('/avis', [AvisChauffeurController::class, 'store']);
Route::get('/avis/chauffeur/{id}', [AvisChauffeurController::class, 'getAvisByChauffeur']);
Route::get('/avis/chauffeurs', [AvisChauffeurController::class, 'getAllAvis']);

Route::get('/utilisateurs/conducteurs', [UtilisateurController::class, 'getConducteurs']);

Route::get('/trajets', [TrajetController::class, 'index']);

Route::delete('/avis-plateforme/{id}', [AvisPlateformeController::class, 'destroy']);
Route::put('/avis-plateforme/{id}/valider', [AvisPlateformeController::class, 'valider']);

Route::post('/inscription', [InscriptionController::class, 'store']);
Route::get('utilisateurs',  [UtilisateurController::class, 'index']);


Route::post('contacts', [\App\Http\Controllers\Api\ContactController::class, 'store']);
Route::get ('contacts', [\App\Http\Controllers\Api\ContactController::class, 'index']);

Route::delete('/contacts/{id}', [ContactController::class, 'destroy']);


Route::post('/connexion', [ConnexionController::class,'login']);

Route::delete('/utilisateur/{id}', [UtilisateurController::class, 'destroy']);

Route::middleware('auth:sanctum')->post('/trajets/{id}/participer', [TrajetController::class, 'participer']);

Route::middleware('auth:sanctum')->get('/trajets/historique-passager', [TrajetController::class, 'historiquePassager']);


Route::middleware('auth:sanctum')->group(function(){
  Route::post('/vehicules', [VehiculeController::class,'store']);
  Route::get('/vehicules/{userId}', [VehiculeController::class,'index']);
    Route::get('/mes-vehicules', [VehiculeController::class, 'mesVehicules']);
});

Route::middleware('auth:sanctum')->group(function(){
    Route::get('/user-info',    [ConnexionController::class, 'userInfo']);
    Route::post('/logout',      [ConnexionController::class, 'logout']);
    });


Route::middleware('auth:sanctum')->group(function () {
    Route::post('/trajets',  [TrajetController::class, 'store']);
    Route::get('/trajets/historique',  [TrajetController::class, 'historique']);
});

Route::post('/trajets/{id}/changer-statut', [TrajetController::class, 'changerStatut']);

Route::middleware('auth:sanctum')->get('/user/credits', function() {
    return response()->json([
        'credits' => Auth::user()->credits
    ]);
});

Route::middleware('auth:sanctum')->get('/trajets/conducteur', function() {
    $count = \App\Models\Trajet::where('conducteur_id', Auth::id())->count();
    return response()->json(['count' => $count]);
});



Route::middleware('auth:sanctum')->post('/utilisateurs/suspendre/{id}', function($id) {
    $user = Utilisateur::findOrFail($id);
    $user->status = $user->status === 'actif' ? 'suspendu' : 'actif';
    $user->save();

    return response()->json([
        'message' => 'Statut mis à jour',
        'nouveau_status' => $user->status
    ]);
});

Route::get('/trajets/recherche', [TrajetController::class, 'rechercher']);


Route::middleware('auth:sanctum')->delete('/utilisateurs/{id}', function($id) {
    $user = Utilisateur::findOrFail($id);
    $user->delete();
    return response()->json(['message' => 'Compte supprimé']);
});

Route::post('/incidents', [IncidentController::class, 'store']);
Route::get('/incidents', [IncidentController::class, 'index']);
Route::get('/incidents', [App\Http\Controllers\Api\IncidentController::class, 'index']);
Route::get('/incidents', [IncidentController::class, 'index']);
Route::get('/incidents-attente', [IncidentController::class, 'enAttente']);
Route::get('/incidents-valides', [IncidentController::class, 'valides']);
Route::patch('/incidents/{id}/valider', [IncidentController::class, 'valider']);
Route::patch('/incidents/{id}/rejeter', [IncidentController::class, 'rejeter']);


Route::middleware(['auth:sanctum'])->group(function () {
    Route::get('/admin/reservations', [TrajetController::class, 'listeReservationsAdmin']);
    Route::get('/admin/chauffeurs', [TrajetController::class, 'listeChauffeurs']);
});

Route::get('/credits-par-jour', [App\Http\Controllers\AdminStatsController::class, 'creditsParJour']);

Route::get('/stats-globales', [AdminStatsController::class, 'statsGlobales']);

Route::get('/chauffeurs/{id}', [ChauffeurController::class, 'show']);


Route::get('/employees', [App\Http\Controllers\Api\EmployeeController::class, 'index']);

Route::post('/employes/{id}/suspendre', [EmployeeController::class, 'suspendre']);
Route::delete('/employes/{id}', [EmployeeController::class, 'destroy']);

Route::middleware('auth:sanctum')->delete('/trajets/historique-passager/{id}', [TrajetController::class, 'supprimerHistoriquePassager']);

Route::middleware('auth:sanctum')->delete('/vehicules/{id}', [VehiculeController::class, 'destroy']);

Route::middleware('auth:sanctum')->get('/employee-info', function (Request $request) {
    $employee = Employe::find($request->user()->id);
    return response()->json([
        'nom' => $employee->nom,
        'prenom' => $employee->prenom,
        'email' => $employee->email,
    ]);
});

Route::delete('/incidents/{id}', [IncidentController::class, 'destroy']);

Route::get('/statistiques/trajets-semaine', [StatistiquesController::class, 'trajetsParJour']);

Route::put('/avis/valider/{id}', [AvisChauffeurController::class, 'validerAvis']);
Route::get('/avis/chauffeur/{id}', [AvisChauffeurController::class, 'getAvisValides']);

Route::post('/chauffeurs/suspendre/{id}', [ChauffeurController::class, 'suspendre']);

Route::get('/prochaine-date', function (Request $request) {
    $ville_depart = $request->query('depart');
    $ville_arrivee = $request->query('arrivee');
    $places = $request->query('places');

    $prochain = Trajet::where('ville_depart', 'LIKE', "%{$ville_depart}%")
        ->where('ville_arrivee', 'LIKE', "%{$ville_arrivee}%")
        ->where('places_disponibles', '>=', $places)
        ->where('heure_depart', '>=', Carbon::now())
        ->orderBy('heure_depart', 'asc')
        ->first();

    return response()->json([
        'date' => $prochain ? Carbon::parse($prochain->heure_depart)->format('d/m/Y H:i') : null
    ]);
});

Route::get('/villes', [TrajetController::class, 'getVilles']);

Route::middleware('auth:sanctum')->post('/utilisateur/photo', [UtilisateurController::class, 'updatePhoto']);

Route::delete('/admin/chauffeurs/{id}', [ChauffeurController::class, 'supprimerChauffeur']);

Route::get('/api/chauffeurs/{id}', [ChauffeurController::class, 'show']);
















