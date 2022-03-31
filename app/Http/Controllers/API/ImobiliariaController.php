<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Imobiliaria;

class ImobiliariaController extends Controller
{
     public function create(request $request)
        {
            $data = $request->all();

            $imobiliaria = Imobiliaria::create($data);

            return response([ 'imobiliaria' => $imobiliaria, 'message' => 'Created successfully'], 200);


        }


    public function update(Request $request,$id)
    {

        $imobiliaria= Imobiliaria::findOrFail($id)->update($request->all());

        return response([ 'imobiliaria' => $imobiliaria, 'message' => 'Created successfully'], 200);
    }

    public function index ()
    {
        $imobiliaria = Imobiliaria::all();
        return response([ 'imobiliaria' => $imobiliaria, 'message' => 'Retrieved successfully'], 200);
    }


    public function destroy($id)
    {
        Imobiliaria::findOrFail($id)->delete();

        return response(['message' => 'Deleted']);
    }

}
