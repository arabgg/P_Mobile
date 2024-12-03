<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\RegisteredUserController;
use Illuminate\Support\Facades\Route;

Route::post('/register', [RegisteredUserController::class, 'store']);  // Rute untuk registrasi
Route::post('/login', [AuthenticatedSessionController::class, 'store']);  // Rute untuk login
Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])
    ->middleware('auth:sanctum');  // Rute untuk logout yang dilindungi autentikasi

