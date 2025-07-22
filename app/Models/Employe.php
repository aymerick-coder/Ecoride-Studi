<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;

class Employe extends Model
{ 
    use HasApiTokens;
    protected $table = 'employees';
   protected $fillable = [
    "nom",
    "prenom",
    "email",
    "password",
    "status"
];
}
