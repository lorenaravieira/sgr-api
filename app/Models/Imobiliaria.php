<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Imobiliaria extends Model
{
    protected $table = "imobiliaria";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'no_imobiliaria',
        'nu_cnpj',
        'estado_id'

    ];
}
