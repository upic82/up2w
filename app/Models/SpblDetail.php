<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SpblDetail extends Model
{
    protected $table = 'spbl_detail';

    protected $fillable = [
        'no_material',
        'no_spbl',
        'qty',
        'harga',
    ];

    protected $casts = [
        'harga' => 'decimal:2',
    ];

    public function spbl(): BelongsTo
    {
        return $this->belongsTo(Spbl::class, 'no_spbl');
    }

    public function material(): BelongsTo
    {
        return $this->belongsTo(Material::class, 'no_material');
    }
}
