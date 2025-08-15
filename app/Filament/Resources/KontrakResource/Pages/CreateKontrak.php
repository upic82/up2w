<?php

namespace App\Filament\Resources\KontrakResource\Pages;

use App\Models\Hpe;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use App\Filament\Resources\KontrakResource;
use Illuminate\Validation\ValidationException;

class CreateKontrak extends CreateRecord
{
    protected static string $resource = KontrakResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $hpe = Hpe::find($data['no_hpe']);

        $grandTotalKontrak = collect($data['kontrakDetail'] ?? [])
            ->sum(fn ($item) => $item['qty'] * $item['harga_satuan']);

        if ($hpe && $grandTotalKontrak > $hpe->grand_total) {
            Notification::make()
                ->title('Grand total kontrak melebihi nilai HPE (' . number_format($hpe->grand_total) . ')')
                ->danger()
                ->send();

            // Lempar exception untuk menghentikan proses simpan
            throw ValidationException::withMessages([
                'kontrakDetail' => 'Grand total melebihi nilai HPE (' . number_format($hpe->grand_total) . ')',
            ]);
        }

        return $data;
    }


}
