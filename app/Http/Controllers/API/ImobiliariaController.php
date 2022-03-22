<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Imobiliaria;

class ImobiliariaController extends Controller
{
     public function create(ImobiliariaController $request)
        {
            $data = $request->all();

            $imobiliaria = Imobiliaria::create($data);

            return response([ 'imobiliaria' => $imobiliaria, 'message' => 'Created successfully'], 200);


        }


    public function update(Request $request, Imobiliaria $imobiliaria)
    {
        $imobiliaria->update($request->all());

        return response([ 'imobiliaria' => $imobiliaria, 'message' => 'Created successfully'], 200);
    }

    public function list (Request $request)
    {
        $dados = Imobiliaria::find($request->imobiliaria);
        return response([ 'imobiliaria' => $dados, 'message' => 'Retrieved successfully'], 200);
    }


    public function destroy(Imobiliaria $imobiliaria)
    {
        $imobiliaria->delete();
        return response(['message' => 'Deleted']);
    }

}
