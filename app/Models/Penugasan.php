<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Penugasan extends Model
{
    protected $table = 'penugasan';

    protected $fillable = [
        'no_amp',
        'nama_penugasan',
        'no_surat_penugasan',
        'tanggal_penugasan',
        'batas_waktu_penugasan',
        'nilai_penugasan',
        'no_wbs',
        'pic_ren',
        'pic_mek',
        'status_penugasan',
        'customer',
        'status_progress',
        'created_by',
        'updated_by',
    ];

    // Relasi ke Customer
    public function customer()
    {
        return $this->belongsTo(Customer::class, 'customer');
    }

    public function workOrder()
    {
        return $this->hasOne(WorkOrder::class, 'no_amp', 'no_amp');
    }

}
