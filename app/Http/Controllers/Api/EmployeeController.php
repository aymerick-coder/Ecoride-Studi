<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Employe;

class EmployeeController extends Controller
{
     public function index()
    {
        $employees = Employe::all();
        return response()->json($employees);
    }

    public function suspendre($id)
{
    $employee = Employe::findOrFail($id);
    
    $employee->status = $employee->status === 'actif' ? 'inactif' : 'actif';
    $employee->save();

    return response()->json([
        'message' => 'Statut mis à jour avec succès',
        'nouveau_status' => $employee->status,
    ]);
}

public function destroy($id)
{
    $employee = Employe::findOrFail($id);
    $employee->delete();

    return response()->json(['message' => 'Employé supprimé avec succès']);
}

}


