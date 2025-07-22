<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AvisPlateforme extends Model
{
    protected $table = 'avis_platforme';

    protected $fillable = [
        'nom_prenom',
        'email',
        'note',
        'message',
        'utilisateur_id'
    ];

    public $timestamps = false;

     public function utilisateur()
{
    return $this->belongsTo(\App\Models\Utilisateur::class);
}
}
