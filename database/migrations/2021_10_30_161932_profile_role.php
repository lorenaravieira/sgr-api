<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ProfileRole extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('perfil_rota', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->integer('perfil_id');
            $table->integer('rota_id');
            $table->foreign('perfil_id')->references('id')->on('perfil');
            $table->foreign('rota_id')->references('id')->on('rota');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {

    }
}
