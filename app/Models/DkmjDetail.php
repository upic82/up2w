<?php

namespace App\Models;

use App\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class DkmjDetail extends Model
{
    use LogsActivity;
    protected $table = 'dkmj_detail'; // Tetap gunakan nama tabel yang ada
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
