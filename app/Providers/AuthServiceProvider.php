<?php

namespace App\Providers;

use App\Models\CEO;
use App\Models\User;
use App\Policies\UserPolicy;
use App\Policies\CEOPolicy;
use App\Models\Perfil;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;
use Illuminate\Support\Facades\Route;
use Illuminate\Auth\Access\Response;
use phpDocumentor\Reflection\Types\Boolean;


class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        //'App\Models\Model' => 'App\Policies\ModelPolicy',
        //User::class => UserPolicy::class,
        //CEO::class => CEOPolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        if (! $this->app->routesAreCached()) {
            Passport::routes();
        }

        Gate::define('firewall', function (User $user, $role = null)
        {
            if($user->isAdministrador()){
                return true;
            }

            $actions = Route::current()->getAction();
            $rota =  $actions['as'];

            if(is_null($rota))
            {
                return false;
            }

            return $this->verificarAcessoRota($user,$rota);

       });
    }

    public function verificarAcessoRota($user,$rota)
    {
        $rotaAcessada = Perfil::find($user->perfil_id)->rotas()->where('no_rota','=',$rota)->first();

        if(is_null($rotaAcessada)){
           return false;
        }else{
           return true;
        }

    }
}
