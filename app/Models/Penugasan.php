<?php

namespace App\Models;

use App\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Penugasan extends Model
{
    use LogsActivity;
    protected $table = 'penugasan';
    protected $foreignKey = 'id_customer';
    protected $casts = [
        'tanggal_penugasan' => 'date',
        'batas_waktu' => 'date',
    ];
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
        'id_customer',
        'status_progress',
        'created_by',
        'updated_by',
    ];

    // Relasi ke Customer
    public function customer()
    {
        return $this->belongsTo(Customer::class, 
            'id_customer', // Kolom FK di tabel penugasan
            'id'        // Kolom PK di tabel customer
        );
    }

    public function workOrder()
    {
        return $this->hasOne(WorkOrder::class, 'no_amp', 'no_amp');
    }
    public function scopeActive($query)
    {
        return $query->whereIn('status_penugasan', ['Not Started', 'On Progress']);
    }
    
    // app/Models/Penugasan.php
    public function scopeHasWorkOrder($query)
    {
        return $query->whereHas('workOrders');
    }

    public function workOrders()
    {
        return $this->hasMany(WorkOrder::class, 'no_amp', 'id');
    }
}
