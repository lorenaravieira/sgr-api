<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Models\User;
use App\Http\Requests\UsuarioStoreRequest;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
    public function login(Request $request)
    {

        $loginData = $request->validate([
                        'email' => 'email|required',
                        'password' => 'required'
        ]);

        $loginData['st_ativo'] = true;

        if (!Auth::attempt($loginData)) {
            return response()->json(['message' => 'Invalid Credentials'],401);
        }

        $accessToken = auth()->user()->createToken('authToken')->accessToken;

        return response()->json(['token' => $accessToken,'user' => auth()->user() ,'menu'=> $this->menuSistemaPerfil()]);

    }

    protected function menuSistemaPerfil()
    {
        $rotasSistema = \App\Models\Perfil::find(1)->rotas()
                            ->where('sg_menu',true)->get();

        $modulosList = \App\Models\Modulo::all();
        $modulos = [];
        $modulo  = [];
        $rot = [];

        foreach($modulosList as $md){

            $modulo['id'] = $md->id;
            $modulo['no_icone'] =  $md->no_icone;
            $modulo['no_modulo'] = $md->no_modulo;
            $rotas = [];

            foreach($rotasSistema as $rota){
                if($md->id == $rota->modulo_id){
                    $rot['id']       = $rota->id;
                    $rot['no_icone'] = $rota->no_icone;
                    $rot['no_rota']  = $rota->no_rota;
                    $rot['ds_rota']  = $rota->ds_rota;
                    $rot['modulo_id']  = $rota->modulo_id;
                    array_push($rotas,$rot);
                }
            }

            $modulo['rotas'] = $rotas;
            if(count($rotas) > 0){
                array_push($modulos,$modulo);
            }
        }

        return $modulos;
    }

}
