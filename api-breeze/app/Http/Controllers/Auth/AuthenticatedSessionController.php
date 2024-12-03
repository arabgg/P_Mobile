<?php
namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class AuthenticatedSessionController extends Controller
{
    // Metode untuk menangani login pengguna
    public function store(Request $request)
    {
        // Validasi input dari pengguna
        $request->validate([
            'email' => ['required', 'string', 'email'],
            'password' => ['required', 'string'],
        ]);

        // Mencoba autentikasi pengguna
        if (!Auth::attempt($request->only('email', 'password'))) {
            // Jika kredensial tidak valid, kembalikan respon error
            return response()->json(['message' => 'Invalid login credentials'], 401);
        }

        // Jika login berhasil, ambil data pengguna yang sedang login
        $user = Auth::user();

        // Buatkan token untuk pengguna yang berhasil login
        $token = $user->createToken('auth_token')->plainTextToken;

        // Kembalikan respons dalam format JSON dengan token dan data pengguna
        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
            'user' => $user,
            'status' => 'Login successful',
        ]);
    }

    // Metode untuk logout pengguna
    public function destroy(Request $request)
    {
        // Menghapus token yang digunakan saat ini
        $request->user()->currentAccessToken()->delete();

        // Kembalikan respons sukses logout
        return response()->json(['message' => 'Logout successful']);
    }
}
