<?php
namespace App\Models;

use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ActivityLog extends Model
{
    use HasFactory, Notifiable, HasRoles;
    protected $casts = [
        'properties' => 'array', // Otomatis convert JSON db ke array PHP
    ];
    protected $fillable = [
        'log_name', 'description', 'event', 
        'subject_id', 'subject_type', 'causer_id',
        'properties', 'ip_address', 'user_agent'
    ];

    public function causer()
    {
        return $this->belongsTo(User::class, 'causer_id');
    }

    public function subject()
    {
        return $this->morphTo();
    }
}