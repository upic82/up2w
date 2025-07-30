<?php

namespace App\Models;

use App\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class Vendor extends Model
{
    use LogsActivity;
    protected $table = 'vendor';

    protected $fillable = [
        'nama_vendor',
        'alamat',
        'created_by',
        'updated_by',
    ];
}
