<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Laravel\Fortify\Rules\Password;

class UserController extends Controller
{
    public function register(Request $request)
    {
        # code...
        try {
            # CEK REQ REGISTER SESUAI DENGAN ATURAN
            $request->validate([
                'name' => ['required', 'string', 'max:255'],
                'username' => ['required', 'string', 'max:255', 'unique:users'],
                'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
                'phone' => ['nullable', 'string', 'max:255'],
                'password' => ['required', 'string', new Password],
            ]);

            # MEMBUAT DATA USER SESUAI REQ
            User::create([
                'name' => $request->name,
                'username' => $request->username,
                'email' => $request->email,
                'phone' => $request->phone,
                'password' => Hash::make($request->password),
            ]);

            # CEK DATA USER YANG TELAH DI REGIS
            $user = User::where('email', $request->email)->first();

            # MEMBUAT TOKEN REGIS USER
            $tokenResult = $user->createToken('authToken')->plainTextToken;

            # RESPON JSON APABILA BERHASIL
            return ResponseFormatter::success([
                'accsess_token' => $tokenResult,
                'token_type' => 'Bearer',
                'user' => $user
            ], 'User Registered');
        } catch (Exception $error) {

            # RESPON JSON APABILA GAGAL
            return json_encode([
                'status' => 'error',
                'message' => $error->getMessage(),
                'code' => $error->getCode(),
            ]);
        }
    }

    public function login(Request $request)
    {
        try {
            # CEK INPUT EMAIL DAN PASSOWRD USER
            $request->validate([
                'email' => 'email|required',
                'password' => 'required',
            ]);

            $credentials = request(['email', 'password']);

            # CEK APAKAH EMAIL & PASSWORD USER TERDAFTAR
            if (!Auth::attempt($credentials)) {
                return Responseformatter::error([
                    'message' => 'unauthorized',
                ], 'Authentication Failed', 500);
            }

            # MENGAMBIL DATA USER SESUAI REQ EMAIL
            $user = User::where('email', $request->email)->first();

            # CEK APAKAHA HASH PASSWORD REQUEST SESUAI DENGAN PASSWORD USER (DB)
            if (!Hash::check($request->password, $user->password, [])) {
                # code...
                throw new \Exception('Invalid Credentials');
            }

            # MEMBUAT TOKEN LOGIN USER
            $tokenResult = $user->createToken('authToken')->plainTextToken;

            # RESPON JSON APABILA BERHASIL
            return ResponseFormatter::success([
                'access_token' => $tokenResult,
                'token_type' => 'Bearer',
                'user' => $user
            ], 'Authenticated');
            //code...
        } catch (Exception $error) {
            //throw $th;

            # RESPON JSON APABILA GAGAL
            return json_encode([
                'status' => 'error',
                'message' => $error->getMessage(),
                'code' => $error->getCode(),
            ]);
        }
    }
}
