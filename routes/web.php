<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// Di routes/web.php
Route::get('/dkmj/{dkmj}/print', function ($id) {
    $dkmj = \App\Models\Dkmj::findOrFail($id);
    return view('dkmj.simple-print', compact('dkmj'));
})->name('dkmj.print');