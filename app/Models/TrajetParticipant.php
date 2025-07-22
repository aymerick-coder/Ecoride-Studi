<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TrajetParticipant extends Model
{
    protected $table = 'trajet_participants';

    protected $fillable = [
        'trajet_id',
        'utilisateur_id',
        'cedits_utilises',
        'date_confirmation',
        'confirm',
        
    ];

    public $timestamps = true; // ou false si pas de created_at / updated_at
}
