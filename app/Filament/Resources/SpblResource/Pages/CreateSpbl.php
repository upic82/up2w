<?php

namespace App\Filament\Resources\SpblResource\Pages;

use App\Models\Dkmj;
use Filament\Actions;
use Illuminate\Support\Facades\DB;
use App\Filament\Resources\SpblResource;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Validation\ValidationException;

class CreateSpbl extends CreateRecord
{
    protected static string $resource = SpblResource::class;

    // Di CreateSpbl.php
    /*protected function beforeCreate(): void
    {
        $allDetails = $this->form->getState()['details'] ?? [];
        //dd($allDetails);
        // Validasi semua item
        foreach ($allDetails as $item) {
            if ($item['qty'] <= 0) {
                throw ValidationException::withMessages([
                    'details' => 'Qty harus lebih dari 0'
                ]);
            }
        }
    }*/
    protected function mutateFormDataBeforeCreate(array $data): array
    {
        /*dd([
        'received_data' => $data,
        'request_all' => request()->all(),
        'session_data' => session()->all(),
        'has_details' => array_key_exists('details', $data)
    ]);*/

        // Ambil DKMJ dari input SPBL
        $dkmj = Dkmj::find($data['no_dkmj']);

        // Ambil penugasan dari relasi work order
        $penugasan = $dkmj->workOrder->penugasan;

        //======================Hitung Total SPBL=======================================
        // Hitung total nilai_spbl + nilai_ppn dari semua SPBL dalam work order ini
        $totalSpbl = 0;
        $totalHpe = 0;


        foreach ($dkmj->workOrder->dkmj as $dk) {
            $totalSpbl += $dk->spbls()->sum(DB::raw('nilai_spbl + nilai_ppn'));
            $totalHpe += $dk->hpes()->sum(DB::raw('nilai_hpe + nilai_ppn'));
        }

        // Tambahkan nilai yang sedang akan disimpan
        $currentValue = ($data['nilai_spbl'] ?? 0) + ($data['nilai_ppn'] ?? 0);
        $totalSpbl += $currentValue;
        $totalSpbl += $totalHpe;

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
        try {
        // Validasi stok material
        $this->validateMaterialStocks($data);
        
        } catch (ValidationException $e) {
            // Kirim notifikasi error
            Notification::make()
                ->title('Validasi Gagal')
                ->body($e->getMessage())
                ->danger()
                ->send();
                
            throw $e;
        }
        return $data;
    }
    protected function validateMaterialStocks(array $data): void
    {
        
        $dkmj = Dkmj::with(['details', 'spbls.details', 'hpes.details'])
                  ->find($data['no_dkmj']);
        $allDetails = $this->form->getState()['details'] ?? [];
        foreach ($allDetails as $index => $detail) {
            $materialId = $detail['no_material'];
            
            // Cek apakah material ada di DKMJ
            $dkmjDetail = $dkmj->details->firstWhere('no_material', $materialId);
            if (!$dkmjDetail) {
                throw ValidationException::withMessages([
                    "details.$index.no_material" => 'Material tidak tersedia di DKMJ terkait',
                ]);
            }

            // Hitung total qty di SPBL dan HPE
            $totalSpblQty = $dkmj->spbls
                ->flatMap->details
                ->where('no_material', $materialId)
                ->sum('qty');
                
            $totalHpeQty = $dkmj->hpes
                ->flatMap->details
                ->where('no_material', $materialId)
                ->sum('qty');

            $remainingQty = $dkmjDetail->qty - ($totalSpblQty + $totalHpeQty);
            
            if ($detail['qty'] > $remainingQty) {
                throw ValidationException::withMessages([
                    "details.$index.qty" => "Qty melebihi stok tersisa (SPBL+HPE). Sisa: $remainingQty",
                ]);
            }
        }
    }

}
