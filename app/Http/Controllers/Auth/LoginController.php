<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    public function validateLogin(Request $request)
    {
        # code...
        $request->validate([]);
    }
}
