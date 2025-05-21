<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class WorkOrder extends Model
{
    use HasFactory;

    protected $table = 'work_orders';

    protected $fillable = [
        'no_amp',
        'no_wo',
        'kategori',
        'technical_requirment',
        'task_plan_schedule',
        'material',
        'method',
        'machine_tools_usage',
        'tanggal_wo',
        'diterbitkan_oleh',
        'tanggal_diterbitkan',
        'dilaksanakan_oleh',
        'dilaksanakan_tanggal',
        'ditutup_oleh',
        'ditutup_tanggal',
        'user_created',
    ];

    // Relasi ke Penugasan
    public function penugasan()
    {
        return $this->belongsTo(Penugasan::class, 'no_amp', 'no_amp');
    }
    public function dkmj()
    {
        return $this->hasMany(Dkmj::class, 'no_amp', 'no_amp');
    }
}
