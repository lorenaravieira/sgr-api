<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SituacaoContrato extends Model
{
    protected $table = "situacao_contrato";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'de_situacao_contrato',
        'tx_situacao_contrato'
    ];
}
