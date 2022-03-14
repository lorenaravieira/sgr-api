<?php

namespace App\Http\Controllers\API;


use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Str;

class ResetarSenhaController extends Controller
{
      public function enviarLink(Request $request)
      {
        $request->validate(['email' => 'required|email']);

        $status = Password::sendResetLink(
            $request->only('email')
        );

        $sucesso =  $status === Password::PASSWORD_RESET ? true : $status;

        return response(['sucesso' => $sucesso  ,'message' => $status ]);
      }

      public function alterarSenha(Request $request)
      {
        $request->validate([
            'token' => 'required',
            'email' => 'required|email',
            'password' => 'required|min:8|confirmed',
        ]);
    
        $status = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user, $password) {
                $user->forceFill([
                    'password' => Hash::make($password)
                ])->setRememberToken(Str::random(60));
    
                $user->save();
    
                event(new PasswordReset($user));
            }
        );

        $sucesso =  $status === Password::PASSWORD_RESET ? true : $status;

        return response(['sucesso' => $sucesso  ,'message' => $status ]);
      }
}
