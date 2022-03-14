<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Rota;
use App\Models\PerfilRota;

class Perfil extends Model
{
    use HasFactory;
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'perfil';

    protected $fillable = [
        'no_perfil'
    ];

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    public function rotas()
    {
        return $this->belongsToMany(Rota::class);
    }

}
