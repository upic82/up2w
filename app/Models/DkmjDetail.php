<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DkmjDetail extends Model
{
    protected $fillable = [
        'ID',
        'no_dkmj',
        'no_material',
        'satuan',
        'qty',
        'spesifikasi'
    ];

    /**
     * Relasi ke Dkmj (parent)
     */

    public function dkmj()
    {
        return $this->belongsTo(Dkmj::class, 'no_dkmj', 'ID');
    }

    // Relasi ke Material
    public function material()
    {
        return $this->belongsTo(Material::class, 'no_material', 'ID');
    }
}
