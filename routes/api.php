<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\CEOController;
use App\Http\Controllers\API\ResetarSenhaController;
use App\Http\Controllers\Api\AdministradorController;
use App\Http\Controllers\Api\UsuarioController;
use App\Http\Controllers\Api\ClienteController;
use App\Http\Controllers\Api\ContratoController;
use App\Http\Controllers\Api\ImobiliariaController;
use App\Http\Controllers\API\ImovelController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::post('/auth', [AuthController::class,'login']);

Route::post('/esqueceu-senha',[ResetarSenhaController::class,'enviarLink'])->name('password.reset');
Route::post('/reset-senha',[ResetarSenhaController::class,'alterarSenha'])->name('password.reset');

Route::middleware(['auth:api','can:firewall'])->group(function(){

    /*Rotas de Exemplo */
    //Route::post('/ceo', [CEOController::class,'store'])->name('ceo.store');
    //Route::get('/ceo', [CEOController::class,'index'])->name('ceo.index');
    //Route::put('/ceo/{ceo}',[CEOController::class,'update'])->name('ceo.put');
    //Route::put('/ceo/{ceo}',[CEOController::class,'show'])->name('ceo.show');

    //william
    Route::get('/rota/{id}', [AdministradorController::class, 'show'])->name('rotaShow');
    Route::post('/rota', [AdministradorController::class, 'create'])->name('rotaCreate');
    Route::put('/rota/{id}/edit', [AdministradorController::class, 'edit'])->name('rotaEdit');
    Route::get('/rota', [AdministradorController::class,'index'])->name('rotaIndex');

    Route::post('/imovel', [ImovelController::class, 'create'])->name('imovelCreate');
    Route::put('/imovel/{id}', [ImovelController::class, 'update'])->name('imovelUpdate');
    Route::delete('/imovel/{id}', [ImovelController::class, 'destroy'])->name('imovelDestroy');
    Route::get('/imovel', [ImovelController::class, 'index'])->name('imovelIndex');

    //lorena -  rotas usuario
    Route::get('/user/{id}' , [UsuarioController::class,'show'])->name('userShow');
    Route::post('/user' , [UsuarioController::class,'create'])->name('userCreate');
    Route::put('/user/{id}/edit' , [UsuarioController::class,'edit'])->name('userEdit');
    Route::post('/user/list' , [UsuarioController::class,'index'])->name('userIndex');

    Route::get('/cliente/{id}', [ClienteController::class, 'show'])->name('clienteShow');
    Route::post('/cliente', [ClienteController::class, 'create'])->name('clienteCreate');
    Route::put('/cliente/{id}' , [ClienteController::class,'edit'])->name('clienteEdit');
    Route::get('/cliente' , [UsuarioController::class,'index'])->name('clienteIndex');

    Route::post('/contrato', [ContratoController::class, 'create'])->name('contratoCreate');

    Route::post('/Imobiliaria', [ImobiliariaController::class, 'create'])->name('imobiliariaCreate');
    Route::post('/Imobiliaria', [ImobiliariaController::class, 'update'])->name('imobiliariaUpdate');
    Route::get('/Imobiliaria', [ImobiliariaController::class, 'list'])->name('imobiliariaList');
    Route::delete('/Imobiliaria', [ImobiliariaController::class, 'delete'])->name('imobiliariaDelete');

});

