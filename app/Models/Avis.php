<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Avis extends Model
{
     protected $table = 'avis';


    protected $fillable = [
        'trajet',
        'passager_id',
        'conducteur_id',
        'note',
        'commentaire',
        'statut_avis',
        'date_creation',
    ];

    public $timestamps = false;
}
