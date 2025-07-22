<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Vehicule extends Model
{
    protected $table = 'vehicules'; 

   protected $fillable = [
    'proprietaire_id',
    'immatriculation',
    'date_premiere_immatriculation',
    'marque',
    'modele',
    'couleur',
    'type_energie',
    'nombre_places',
    'fumeur',
    'animaux',
    'voyage_ecologique',
    'preferences',
];

}

