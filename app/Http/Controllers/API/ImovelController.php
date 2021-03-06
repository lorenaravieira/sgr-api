<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Imovel;
use Illuminate\Http\Request;

class ImovelController extends Controller
{
    public function create(Request $request){
        $data = $request->all();

        $imovel = Imovel::create($data);

        return response(['imovel' => $imovel, 'message' => 'Created successfully'], 200);
    }

    public function update(Request $request, $id){
        $imovel = Imovel::find($id)->update($request->all());

        return response(['imovel' => $imovel, 'message' => 'Created successfully'], 200);
    }

    public function destroy($id){
        Imovel::find($id)->delete();
        return response(['message' => 'Deleted']);
    }

    public function index(){
        $imovel = Imovel::all();

        return response(['imovel' => $imovel, 'message' => 'successfully'], 200);
    }
}
