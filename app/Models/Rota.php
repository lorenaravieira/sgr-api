<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Modulo;
use App\Models\Perfil;

class Rota extends Model
{
    protected $table = "rota";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'no_rota',
        'ds_rota',
        'no_icone',
        'sg_menu',
        'rota_pai_id',
        'nu_ordem'
          
    ];

    public function perfis()
    {
        return $this->belongsToMany(Perfil::class);
    }

    public function modulo()
    {
        return $this->belongsTo(Modulo::class);
    }
}
