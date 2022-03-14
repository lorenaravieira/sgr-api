<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Profile;
use App\Models\PerfilRota;

class Modulo extends Model
{
    protected $table = "modulo";
    use HasFactory;

    public $timestamps = false;
    
    protected $fillable = [
        'no_modulo',
        'no_icone'
    ];

    
    

}
