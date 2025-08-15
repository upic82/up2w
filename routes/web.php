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

/*
Route::get('/workorder/{workorder}/print', function ($id) {
    $workoder = \App\Models\WorkOrder::findOrFail($id);
    return view('workorder.simple-print', compact('workorder'));
})->name('workorder.print');*/

use App\Models\WorkOrder;

Route::get('/workorder/{workorder}/print', function (WorkOrder $workorder) {
    return view('workorder.simple-print', [
        'workOrder' => $workorder
    ]);
})->name('workorder.print');


Route::get('/spbl/{spbl}/print', function ($id) {
    $spbl = \App\Models\Spbl::findOrFail($id);
    return view('spbl.cetak-spbl', compact('spbl'));
})->name('spbl.print');