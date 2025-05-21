<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Spbl extends Model
{
    protected $table = 'spbl';

    protected $fillable = [
        'no_spbl',
        'no_dkmj',
        'tanggal_spbl',
        'nilai_spbl',
        'nilai_ppn',
        'disusun_by',
        'persyaratan_pengadaan',
        'no_vendor',
        'approved_by',
        'approved_at',
        'created_by',
        'updated_by',
    ];

    protected $casts = [
        'tanggal_spbl' => 'date',
        'approved_at' => 'datetime',
        'nilai_spbl' => 'decimal:2',
        'nilai_ppn' => 'decimal:2',
    ];

    public function dkmj(): BelongsTo
    {
        return $this->belongsTo(Dkmj::class, 'no_dkmj');
    }

    public function vendor(): BelongsTo
    {
        return $this->belongsTo(Vendor::class, 'no_vendor');
    }
    public function details()
    {
        return $this->hasMany(SpblDetail::class, 'no_spbl');
    }

}

