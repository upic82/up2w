<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class HpeDetail extends Model
{
    protected $table = 'hpe_detail';

    protected $fillable = [
        'no_hpe',
        'no_material',
        'qty',
        'satuan',
        'harga',
    ];

    protected $casts = [
        'harga' => 'decimal:2',
    ];

    public function hpe(): BelongsTo
    {
        return $this->belongsTo(Hpe::class, 'no_hpe');
    }


    // app/Models/HpeDetail.php
public function material()
{
    return $this->belongsTo(Material::class, 'no_material', 'id');
}
}
