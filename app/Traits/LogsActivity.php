<?php

namespace App\Traits;

use App\Models\ActivityLog;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

trait LogsActivity
{
    protected static function bootLogsActivity()
    {
        foreach (['created', 'updated', 'deleted'] as $event) {
            static::$event(function (Model $model) use ($event) {
                self::logActivity($model, $event);
            });
        }
    }

    protected static function logActivity(Model $model, string $event)
    {
        $description = match($event) {
            'created' => 'Membuat transaksi baru',
            'updated' => 'Memperbarui transaksi',
            'deleted' => 'Menghapus transaksi',
            default => 'Melakukan aksi pada transaksi'
        };

        ActivityLog::create([
            'log_name' => 'transaction',
            'description' => $description,
            'event' => $event,
            'subject_id' => $model->id,
            'subject_type' => get_class($model),
            'causer_id' => Auth::id(),
            'properties' => $model->getChanges(),
            'ip_address' => request()->ip(),
            'user_agent' => request()->userAgent()
        ]);
    }
}