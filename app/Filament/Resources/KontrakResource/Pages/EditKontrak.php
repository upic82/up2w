<?php

namespace App\Filament\Resources\KontrakResource\Pages;

use App\Models\Hpe;
use Filament\Actions;
use App\Models\Kontrak;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\EditRecord;
use App\Filament\Resources\KontrakResource;
use Illuminate\Validation\ValidationException;

class EditKontrak extends EditRecord
{
    protected static string $resource = KontrakResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
    protected function mutateFormDataBeforeSave(array $data): array
    {
        // Ambil kontrak berdasarkan ID
        //dd($data);
        $kontrak = Kontrak::find($data['no_kontrak']);
        // Ambil no_hpe dari relasi kontrak
        $noHpe = $kontrak?->no_hpe;
        $hpe = Hpe::find($noHpe);

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
