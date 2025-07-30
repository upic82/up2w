<?php

namespace App\Models;

use App\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class KontrakDetail extends Model
{
    use LogsActivity;
    protected $table = 'kontrak_detail';

    protected $fillable = [
        'no_kontrak',
        'no_material',
        'qty',
        'harga',
    ];

    protected $casts = [
        'harga' => 'decimal:2',
    ];

    // Relasi ke kontrak
    public function kontrak(): BelongsTo
    {
        return $this->belongsTo(Kontrak::class, 'no_kontrak');
    }

    // Relasi ke material/jasa
    public function material(): BelongsTo
    {
        return $this->belongsTo(Material::class, 'no_material');
    }
}
