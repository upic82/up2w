<?php

namespace App\Models;

use App\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Kontrak extends Model
{
    use LogsActivity;
    protected $table = 'kontrak';

    protected $fillable = [
        'no_kontrak',
        'no_hpe',
        'judul_kontrak',
        'tgl_kontrak_awal',
        'tgl_kontrak_akhir',
        'id_vendor',
        'nilai_kontrak',
        'nilai_ppn',
        'grand_total',
        'no_gl',
        'judul_kontrak',
        'no_pr',
        'no_po',
        'no_nota_dinas',
        'jenis_kontrak',
        'jenis_pengadaan',
        'metode_pengadaan',
        'status_kontrak',
        'created_by',
        'updated_by',
    ];

    protected $casts = [
        'tgl_kontrak_awal' => 'date',
        'tgl_kontrak_akhir' => 'date',
        'nilai_kontrak' => 'decimal:2',
        'nilai_ppn' => 'decimal:2',
    ];

    // Relasi ke HPE
    public function hpe(): BelongsTo
    {
        return $this->belongsTo(Hpe::class, 'no_hpe');
    }

    

    // Relasi ke Vendor
    public function vendor(): BelongsTo
    {
        return $this->belongsTo(Vendor::class, 'id_vendor');
    }

    //detail
    public function detail()
    {
        return $this->hasMany(KontrakDetail::class, 'no_kontrak');
    }

}
