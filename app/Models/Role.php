<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $fillable = ['nom'];

    public function utilisateurs()
    {
        return $this->belongsToMany(Utilisateur::class, 'utilisateur_roles', 'role_id', 'utilisateur_id');
    }
}
