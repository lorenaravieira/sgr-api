<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Rota extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rota', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->string('no_rota')->nullable($value = false);
            $table->string('ds_rota')->nullable($value = false);
            $table->string('no_icon')->nullable($value = true);
            $table->boolean('sg_menu')->default(0);
            $table->integer('rota_pai_id')->nullable($value = true);
            $table->integer('nu_ordem')->nullable($value = true);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
