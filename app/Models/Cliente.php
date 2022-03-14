<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
    protected $table = "cliente";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'no_cliente',
        'co_tipo_cliente',
        'nu_cpf',
        'de_email',
        'nu_cnpj',
        'st_pessoa_juridica',
        'tipo_cliente_id',
        'nu_celular',
        'nu_tel_residencial',
        'nu_tel_comercial',
        'dt_nascimento',
        'nu_cep',
        'no_cidade',
        'de_endereco',
        'de_complemento',
        'nu_endereco',
        'estado_id',
        'cadastro_dt'
    ];
}
