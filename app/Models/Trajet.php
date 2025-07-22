<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Trajet extends Model
{
    protected $table = 'trajets';

   protected $fillable = [
    'conducteur_id',
    'vehicule_id',          
    'ville_depart',
    'ville_arrivee',
    'heure_depart',
    'heure_arrivee',
    'date_creation',
    'prix_credits',
    'statut_trajet',
    'places_disponibles',
     'eco_responsable',
];
    public $timestamps = false; 
    public function conducteur()
{
    return $this->belongsTo(Utilisateur::class, 'conducteur_id');
}
public function avis()
{
    return $this->hasMany(\App\Models\Avis::class, 'conducteur_id', 'conducteur_id');
}
public function vehicule()
{
    return $this->belongsTo(Vehicule::class, 'vehicule_id');
}

}


