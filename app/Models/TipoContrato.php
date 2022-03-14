<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipoContrato extends Model
{
    protected $table = "tipo_contrato";
    use HasFactory;

    public $timestamps = false;
    protected $fillable = [
        'de_tipo_contrato'
    ];
}
