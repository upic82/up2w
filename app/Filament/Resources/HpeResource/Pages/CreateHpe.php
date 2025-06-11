<?php

namespace App\Filament\Resources\HpeResource\Pages;

use App\Models\Dkmj;
use Illuminate\Support\Facades\DB;
use Filament\Actions;
use App\Filament\Resources\HpeResource;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Validation\ValidationException;

class CreateHpe extends CreateRecord
{
    protected static string $resource = HpeResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Ambil DKMJ dari input SPBL
        $dkmj = Dkmj::find($data['no_dkmj']);

        // Ambil penugasan dari relasi work order
        $penugasan = $dkmj->workOrder->penugasan;

        // Hitung total nilai_spbl + nilai_ppn dari semua SPBL dalam work order ini
        $totalSpbl = 0;

        foreach ($dkmj->workOrder->dkmj as $dk) {
            $totalSpbl += $dk->spbls()->sum(DB::raw('nilai_spbl + nilai_ppn'));
        }

        // Tambahkan nilai yang sedang akan disimpan
        $currentValue = ($data['nilai_spbl'] ?? 0) + ($data['nilai_ppn'] ?? 0);
        $totalSpbl += $currentValue;

        if ($totalSpbl > $penugasan->nilai_penugasan) {
            $nilaiPenugasan = number_format($penugasan->nilai_penugasan, 0, ',', '.');
            $existingTotal = number_format($totalSpbl - $currentValue, 0, ',', '.');
            $sisaSaldo = number_format($penugasan->nilai_penugasan - ($totalSpbl - $currentValue), 0, ',', '.');

            Notification::make()
                ->title('Total nilai SPBL melebihi nilai penugasan.')
                ->body("Nilai Penugasan: Rp {$nilaiPenugasan}\nTotal SPBL Sebelumnya: Rp {$existingTotal}\nSisa Saldo: Rp {$sisaSaldo}")
                ->danger()
                ->duration(10000) // auto hilang 10 detik
                ->send();

            throw ValidationException::withMessages([
                'nilai_spbl' => 'Total SPBL (termasuk PPN) sudah melebihi nilai penugasan.',
            ]);
        }

        return $data;
    }
}
