<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
{
    Schema::create('vehicules', function (Blueprint $table) {
        $table->id();
        $table->string('plaque_immatriculation');
        $table->date('date_premiere_immatriculation');
        $table->string('modele');
        $table->string('couleur');
        $table->string('marque');
        $table->integer('nombre_places');
        $table->boolean('fumeur');
        $table->boolean('animaux');
        $table->boolean('voyage_ecologique');
        $table->text('preferences')->default('Non');
        $table->timestamps();
    });
}
};
