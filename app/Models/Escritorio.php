<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Escritorio extends Model
{
    protected $table = "escritorio";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'no_escritorio',
        'nu_cnpj',
        'estado_id'
          
    ];
}
