<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ConselhoRegional extends Model
{
    protected $table = "conselho_regional";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'de_conselho_regional',
        'nu_ddd',
        'nu_telefone',
        'no_representante'
          
    ];
}
