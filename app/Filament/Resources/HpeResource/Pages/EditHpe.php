<?php

namespace App\Filament\Resources\HpeResource\Pages;

use App\Models\Dkmj;
use Filament\Actions;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use App\Filament\Resources\HpeResource;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Validation\ValidationException;

class EditHpe extends EditRecord
{
    protected static string $resource = HpeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
    /*
    protected function mutateFormDataBeforeUpdate(array $data): array
    {

        logger('MutateFormDataBeforeUpdate called', $data); // ✅ Debug log
        // Ambil DKMJ dari input HPE
        $dkmj = Dkmj::find($data['no_dkmj']);

        // Ambil penugasan dari relasi work order
        $penugasan = $dkmj->workOrder->penugasan;

        // Total semua Hpe dalam work order, termasuk Hpe yang sedang diupdate
            $totalHpe = 0;
            foreach ($dkmj->workOrder->dkmj as $dk) {
                $totalHpe += $dk->Hpes()->sum(DB::raw('nilai_hpe + nilai_ppn'));
            }

            // Kurangi nilai Hpe lama dari record yang sedang diedit
            $oldHpe = $this->record->nilai_hpe ?? 0;
            $oldPpn = $this->record->nilai_ppn ?? 0;
            $totalHpe -= ($oldHpe + $oldPpn);

            // Tambahkan nilai baru dari form
            $currentValue = ($data['nilai_hpe'] ?? 0) + ($data['nilai_ppn'] ?? 0);
            $totalHpe += $currentValue;

        if ($totalHpe > $penugasan->nilai_penugasan) {
            $nilaiPenugasan = number_format($penugasan->nilai_penugasan, 0, ',', '.');
            $existingTotal = number_format($totalHpe - $currentValue, 0, ',', '.');
            $sisaSaldo = number_format($penugasan->nilai_penugasan - ($totalHpe - $currentValue), 0, ',', '.');

            Notification::make()
                ->title('Total nilai Hpe melebihi nilai penugasan.')
                ->body("Nilai Penugasan: Rp {$nilaiPenugasan}\nTotal Hpe Sebelumnya: Rp {$existingTotal}\nSisa Saldo: Rp {$sisaSaldo}")
                ->danger()
                ->duration(10000) // auto hilang 10 detik
                ->send();

            throw ValidationException::withMessages([
                'nilai_hpe' => 'Total Hpe (termasuk PPN) sudah melebihi nilai penugasan.',
            ]);
        }

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

    protected function mutateFormDataBeforeFill(array $data): array
    {
        // Konversi string ke float (hilangkan format ribuan)

        logger()->debug('Data sebelum konversi:', $data);
        $nilaiHpe = is_numeric($data['nilai_hpe']) 
            ? (float)$data['nilai_hpe'] 
            : (float)str_replace(['.', ','], ['', '.'], $data['nilai_hpe'] ?? '0');
        
        $nilaiPpn = is_numeric($data['nilai_ppn']) 
            ? (float)$data['nilai_ppn'] 
            : (float)str_replace(['.', ','], ['', '.'], $data['nilai_ppn'] ?? '0');

        // Hitung grand total
        $data['grand_total'] = $nilaiHpe + $nilaiPpn;
        logger()->debug('Data setelah konversi:', $data);
        return $data;
    }*/
}
