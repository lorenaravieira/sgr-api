<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoricoContrato extends Model
{
    protected $table = "historico_contrato";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'id_pai',
        'cliente_id',
        'situacao_id',
        'escritorio_id',
        'st_com_exclusividade',
        'users_id',
        'tipo_contrato_id',
        'dt_cadastro',
        'imovel_id',
        'contrato_id',
        'registro_dt'
          
    ];
}
