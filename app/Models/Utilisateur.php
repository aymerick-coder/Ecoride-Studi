<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Utilisateur extends Authenticatable
{
    use HasApiTokens, Notifiable; 

    protected $table = 'utilisateurs';

    protected $fillable = [
        'nom',
        'prenom',
        'email',
        'note_moyenne',
        'password',
        'telephone',
        'adresse',
        'date_naissance',
        'photo',
        'credits',
        'status',
    ];

    protected $hidden = ['password', 'remember_token'];
    public function trajetsConducteur()
{
    return $this->hasMany(Trajet::class, 'conducteur_id');
}
public function roles()
{
    return $this->belongsToMany(Role::class, 'utilisateur_roles', 'utilisateur_id', 'role_id');
}
public function avisRecus()
{
    return $this->hasMany(Avis::class, 'conducteur_id');
}
public function vehicule()
{
    return $this->hasOne(Vehicule::class, 'proprietaire_id');
}

}

