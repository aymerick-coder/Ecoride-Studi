<?php
Route::get('/debug-db-host', function(){
    return [
        'env(DB_HOST)'   => env('DB_HOST'),
        'config.db.host' => config('database.connections.mysql.host'),
    ];
});
use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ConnexionController;
use Laravel\Sanctum\Http\Controllers\CsrfCookieController;
use Illuminate\Support\Facades\Auth;

Route::get('/sanctum/csrf-cookie', [CsrfCookieController::class, 'show']);

Route::get('/', function () {
    return view('welcome');
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';


use App\Models\Avis;
use Illuminate\Http\Request;

Route::get('/avis/create', function () {
    return view('avis.create');
});

Route::get('/avis', function () {
    $avis = Avis::all();
    return $avis;
});

Route::post('/avis', function (Request $request) {
    Avis::create($request->all());
    return redirect('avis');
})->name('avis.store');

Route::get('/dashboard', function () {
    return view('dashboard.user-dashboard'); 
})->name('user.dashboard');


Route::get('/test-utilisateur', function() {
    
    dd(\App\Models\Utilisateur::class);
});


Route::get('/connexion', function(){
    return view('connexion');
})->name('connexion.form');

Route::post('/connexion', [ConnexionController::class, 'login'])
     ->name('connexion.submit');


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
