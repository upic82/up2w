<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{
    protected $table = 'vendor';

    protected $fillable = [
        'nama_vendor',
        'alamat',
        'created_by',
        'updated_by',
    ];
}
