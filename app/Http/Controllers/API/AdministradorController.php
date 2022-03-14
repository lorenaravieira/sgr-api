<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Resources\CEOResource;
use App\Models\Rota;

class AdministradorController extends Controller
{
    public function indexRota()
    {
        $rota = Rota::all();
        return response([ 'rota' => CEOResource::collection($rota), 'message' => 'Retrieved successfully'], 200);
    }

    public function createRota(Request $request)
    {
        $data = $request->all();

        $store = Rota::create($data);

        return response([ 'rota' => $store, 'message' => 'Created successfully'], 200);
    }

    public function showRota(Request $request)
    {
        $dados = Rota::find($request->rota);
        return response([ 'rota' => $dados, 'message' => 'Retrieved successfully'], 200);
    }

    public function editRota(Request $request, Rota $rota)
    {
        $rota->updateRota($request->all());

        return response([ 'rota' => $rota, 'message' => 'Retrieved successfully'], 200);
    }

}
