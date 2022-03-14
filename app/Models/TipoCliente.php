<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipoCliente extends Model
{
    protected $table = "tipo_cliente";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'de_tipo_cliente'
          
    ];
}
