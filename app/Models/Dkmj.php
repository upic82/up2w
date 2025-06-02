<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Dkmj extends Model
{
    // Nama tabel di database (jika tidak plural otomatis)
    protected $table = 'dkmj';

    // Primary key
    protected $primaryKey = 'id';

    // Mass assignable fields
    protected $fillable = [
        'no_amp',
        'no_dkmj',
        'status',
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
    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            // Pastikan no_amp terisi
            if (empty($model->no_amp)) {
                throw new \Exception('No AMP harus diisi sebelum membuat DKJM');
            }
        });

        static::created(function ($model) {
            // Generate setelah record dibuat (karena butuh ID)
            $model->update([
                'no_dkmj' => $model->generateDkmjNumber()
            ]);
        });
    }

    public function generateDkmjNumber()
    {
        $penugasan = Penugasan::find($this->no_amp);
        
        if (!$penugasan) {
            throw new \Exception('Data penugasan tidak ditemukan');
        }

        return "{$penugasan->no_amp}-{$this->id}";
    }

    public function workOrder()
    {
        return $this->belongsTo(WorkOrder::class, 'no_amp', 'no_amp');
    }

    public function details()
    {
        return $this->hasMany(DkmjDetail::class, 'no_dkmj', 'id');
    }
    public function penugasan()
    {
        return $this->belongsTo(Penugasan::class, 'no_amp', 'id');
    }   
    public function spbls()
    {
        return $this->hasMany(Spbl::class,'no_dkmj');
    }
    // app/Models/Dkmj.php
    public function calculateRemainingQty($materialId)
    {
        $totalUsed = $this->spbls()
            ->with('details')
            ->get()
            ->flatMap->details
            ->where('no_material', $materialId)
            ->sum('qty');

        $originalQty = $this->dkmjDetails()
            ->where('no_material', $materialId)
            ->value('qty');

        return max(0, $originalQty - $totalUsed);
    }
}
