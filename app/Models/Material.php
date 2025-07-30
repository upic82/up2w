<?php

namespace App\Models;

use App\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class Material extends Model
{
    use LogsActivity;
    // Nama tabel (jika tidak mengikuti konvensi jamak)
    protected $table = 'material';

    // Kolom yang bisa diisi secara massal (mass assignment)
    protected $fillable = [
        'nama_material',
        'satuan',
        'jenis',
        'created_by',
        'udpated_by',
    ];

    public function dkmjDetail()
    {
        return $this->hasMany(DkmjDetail::class, 'no_material');
    }
    public function spblDetails()
    {
        return $this->hasMany(SpblDetail::class, 'no_material');
    }
    
    public function hpeDetails()
    {
        return $this->hasMany(HpeDetail::class, 'no_material', 'id');
        // Asumsi:
        // - no_material adalah foreign key di tabel hpe_detail
        // - id adalah primary key di tabel material
    }
    public function kontrakDetails()
    {
        return $this->hasMany(KontrakDetail::class, 'no_material');
    }
    // Di app/Models/Material.php
    public function dkmjDetails()
    {
        return $this->hasMany(DkmjDetail::class, 'no_material');
    }
   
}
