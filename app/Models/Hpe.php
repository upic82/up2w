<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Hpe extends Model
{
    protected $table = 'hpe';

    protected $fillable = [
        'no_hpe',
        'jenis', // ✅ tambahkan ini
        'nama_hpe',
        'no_dkmj',
        'tanggal_hpe',
        'nilai_hpe',
        'nilai_ppn',
        'grand_total',
        'disusun_oleh',
        'approved_by',
        'approved_at',
        'created_by',
        'updated_by',
    ];

    protected $casts = [
        'tanggal_hpe' => 'date',
        'approved_at' => 'date',
        'nilai_hpe' => 'decimal:2',
        'nilai_ppn' => 'decimal:2',
    ];

    public function dkmj(): BelongsTo
    {
        return $this->belongsTo(Dkmj::class, 'no_dkmj');
    }
    public function details()
    {
        return $this->hasMany(HpeDetail::class, 'no_hpe');
    }

}
