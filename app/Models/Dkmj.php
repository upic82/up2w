<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Dkmj extends Model
{
    // Nama tabel di database (jika tidak plural otomatis)
    protected $table = 'dkmj';

    // Primary key
    protected $primaryKey = 'ID';

    // Mass assignable fields
    protected $fillable = [
        'ID',
        'no_amp',
        'disusun_oleh',
        'menyetujui',
        'tanggal_dkmj',
        'disetujui_tanggal',
        'kota_unit',
        'no_wbs',
        'created_by',
        'updated_by'
    ];

    /**
     * Relasi ke WorkOrders
     * Dkmj memiliki satu WorkOrders terkait berdasarkan no_amp
     */
    public function workOrder()
    {
        return $this->belongsTo(WorkOrder::class, 'no_amp', 'no_amp');
    }

    public function details()
    {
        return $this->hasMany(DkmjDetail::class, 'no_dkmj', 'ID');
    }

}
