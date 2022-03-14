<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Perfil;

class UsuarioController extends Controller
{

    protected $st_ativo_padrao = 0;
    protected $senha_padrao = null;
    protected $registro_por_pagina = 500;

    public function __construct()
    {
        $this->senha_padrao = config('api.senha_padrao');
    }

    public function index(Request $req)
    {
        $users = User::limit($this->registro_por_pagina)->get();

        return response(['user'=> $users, 'message' => 'successfully'], 200);
    }

     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function create(Request $request)
    {

        $user = User::create([
            'nome' =>$request->nome,
            'email'=>$request->email,
            'perfil_id'=> $request->perfil_id,
            'st_ativo' => $this->st_ativo_padrao,
            'password' => bcrypt($this->senha_padrao)
        ]);

        return response()->json(['user' => $user, 'message' => 'successfully'], 200);

    }


    public function show($id)
    {
        $user =  User::findOrfail($id);
        return response(['user'=> $user, 'message' => 'successfully'], 200);
    }

    public function edit(Request $request, $id)
    {
        $User= User::findOrFail($id)->update($request->all());

        return response(['user'=> $User, 'message' => 'successfully'], 200);
    }


}
