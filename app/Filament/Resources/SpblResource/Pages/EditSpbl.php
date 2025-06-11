<?php

namespace App\Filament\Resources\SpblResource\Pages;

use App\Models\Dkmj;
use Filament\Actions;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use App\Filament\Resources\SpblResource;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Validation\ValidationException;

class EditSpbl extends EditRecord
{
    protected static string $resource = SpblResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
    protected function mutateFormDataBeforeUpdate(array $data): array
    {

        logger('MutateFormDataBeforeUpdate called', $data); // ✅ Debug log
        // Ambil DKMJ dari input SPBL
        $dkmj = Dkmj::find($data['no_dkmj']);

        // Ambil penugasan dari relasi work order
        $penugasan = $dkmj->workOrder->penugasan;

        // Total semua SPBL dalam work order, termasuk SPBL yang sedang diupdate
            $totalSpbl = 0;
            foreach ($dkmj->workOrder->dkmj as $dk) {
                $totalSpbl += $dk->spbls()->sum(DB::raw('nilai_spbl + nilai_ppn'));
            }

            // Kurangi nilai SPBL lama dari record yang sedang diedit
            $oldSpbl = $this->record->nilai_spbl ?? 0;
            $oldPpn = $this->record->nilai_ppn ?? 0;
            $totalSpbl -= ($oldSpbl + $oldPpn);

            // Tambahkan nilai baru dari form
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
        logger()->debug('Data setelah konversi:', $data);
        return $data;
    
    }
    protected function handleRecordUpdate(Model $record, array $data): Model
    {
        // Jalankan validasi sebelum update
        $data = $this->mutateFormDataBeforeUpdate($data);

        // Update record
        $record->update($data);

        return $record;
    }

}
