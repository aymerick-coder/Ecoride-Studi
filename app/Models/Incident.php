<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Incident extends Model
{
    protected $table = 'incidents';

    protected $fillable = [
        'utilisateur_id',
        'conducteur_id',
        'trajet',
        'date_depart',
        'heure_depart',
        'heure_arrivee',
        'message',
        'statut',
        'date_creation',
    ];

    public $timestamps = false; 
}