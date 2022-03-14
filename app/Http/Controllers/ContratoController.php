<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cliente;
use App\Models\Imovel;
use App\Models\Contrato;

class ContratoController extends Controller
{

    public function __construct()
    {

    }
    public function create(ContratoController  $request)


    {
        $data = $request->all();
        $this->user = auth()->user();

        $cliente = $data ['cliente'];
        $cliente['estado_id'] =$cliente ['estado']['id'];
        $cliente['nu_cpf'] = $cliente ['nu_cpf'];
        $cliente['nu_cnpj'] =$cliente ['nu_cnpj'];
        $client = Cliente:: create($cliente);

        $imovel = $data['imovel'];
        $imovel ['estado_id'] = $imovel ['estado']['id'];
        $imovel ['tipo_imovel_id'] = $imovel ['estado']['id'];
        $imv = Imovel::create($imovel);

        $contrato = $data ['contrato'];
        $contrato ['tipo_contrato_id'] = $data ['tipo_contrato']['id'];
        $contrato ['st_com_exclusividade'] = $data ['st_com_exclusividade'];
        $contrato ['situacao_id'] = $data['situacao_id'];
        $contrato ['user_id'] = $data['user_id'];
        $contrato ['cliente_id'] = $client->id;
        $contrato ['imovel_id'] = $imv->id;
        $contract = Contrato::create($contrato);


        $cntract = Contrato::create($contrato);



        return response([ 'cliente' => $cliente, 'message' => 'Created successfully'], 200);


    }


}
