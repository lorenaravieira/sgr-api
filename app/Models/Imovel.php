<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Imovel extends Model
{
    protected $table = "imovel";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'nu_cep',
        'no_cidade',
        'de_endereco',
        'de_complemento',
        'nu_endereco',
        'co_tipo_imovel',
        'estado_id',
        'nu_matricula',
        'cadastro_dt'

    ];
}
