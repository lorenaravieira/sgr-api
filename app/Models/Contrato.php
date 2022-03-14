<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contrato extends Model
{
    protected $table = "contrato";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'cliente_id',
        'situacao_id',
        'st_com_exclusividade',
        'users_id',
        'tipo_contrato_id',
        'cadastro_dt',
        'imovel_id',
        'imobiliaria_id'

    ];
}
