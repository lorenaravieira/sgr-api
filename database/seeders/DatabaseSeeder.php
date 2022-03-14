<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Models\Rota;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'nome' => 'Admin',
            'email' => 'admin@sgc.com.br',
            'password' => bcrypt('sgc.2022'),
            'perfil_id' =>  '1',
            'st_ativo' => true
       ]);

       DB::table('rota')->insert([
            [
                'no_rota' => 'ceo.show',
                'ds_rota' => 'Visualização do CEO'
            ],
            [
                'no_rota' => 'ceo.update',
                'ds_rota' => 'Atualização do CEO'
            ],
            [
                'no_rota' => 'ceo.store',
                'ds_rota' => 'Registrar do CEO'
            ]
            ,
            [
                'no_rota' => 'ceo.put',
                'ds_rota' => 'Editar do CEO'
            ]
            ,
            [
                'no_rota' => 'ceo.delete',
                'ds_rota' => 'Deletar do CEO'
            ]
        ]);

        $rotas = Rota::all();

        foreach($rotas as $r)
        {
            DB::table('perfil_rota')->insert([
                'perfil_id' => 1,
                'rota_id'   => $r->id
            ]);
        }

    }
}
