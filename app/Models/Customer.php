<?php

namespace App\Models;

use App\Traits\LogsActivity;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use LogsActivity;
    protected $table = 'customer';
    protected $primaryKey = 'id';
    protected $fillable = [
        'nama_customer',
        'nama_alias',
        'created_by',
        'updated_by',
    ];

    // Relasi ke Penugasan
    public function penugasan()
    {
        return $this->hasMany(Penugasan::class, 'customer');
    }
}

