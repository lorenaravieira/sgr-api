<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cliente;

class ClienteController extends Controller
{
    public function create(Request $request)
    {
        $data = $request->all();

        $cliente = Cliente::create($data);

        return response([ 'cliente' => $cliente, 'message' => 'Created successfully'], 200);


    }

    public function update(Request $request,$id)
    {
        $cliente= Cliente::findOrFail($id)->update($request->all());

        return response([ 'cliente' => $cliente, 'message' => 'Created successfully'], 200);
    }

    public function index()
    {
        $cliente = Cliente::all();

        return response([ 'cliente' => $cliente, 'message' => 'Created successfully'], 200);
    }
}
