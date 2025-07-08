<?php

namespace App\Filament\Resources\DkmjResource\Pages;

use App\Models\Dkmj;
use Filament\Resources\Pages\CreateRecord;
use App\Filament\Resources\DkmjResource;
use Filament\Notifications\Notification;

class CreateDkmj extends CreateRecord
{
    protected static string $resource = DkmjResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Log ke storage/logs/laravel.log
        \Log::info('Data sebelum create DKMJ:', $data);

        // Atau tampilkan di notifikasi untuk sementara (jika ringan dan tidak sensitif)
        Notification::make()
            ->title('Data Submit')
            ->body('No AMP: ' . ($data['no_amp'] ?? 'tidak ada'))
            ->success()
            ->send();

        return $data;
    }

    // Opsional: debug lebih lanjut saat create
    protected function handleRecordCreation(array $data): Dkmj
    {
        \Log::info('Handle Record Creation:', $data);
        return Dkmj::create($data);
    }
}
