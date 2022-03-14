<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Estado extends Model
{
    protected $table = "estado";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'de_estado',
        'co_estado'
          
    ];
}
