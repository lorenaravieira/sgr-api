<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CEO extends Model
{
    protected $table = "ceos";
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
          'name'
        , 'company_name'
        , 'year'
        , 'company_headquarters'
        , 'what_company_does'
        , 'user_id'
    ];

}
