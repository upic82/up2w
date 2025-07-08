<?php

namespace App\Filament\Resources\PenugasanResource\Pages;

use App\Filament\Resources\PenugasanResource;
use Filament\Resources\Pages\ListRecords;
use Filament\Forms\Components\FileUpload;
use Filament\Actions\Action;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\PenugasanImport;
use Illuminate\Support\Facades\Storage;
use Filament\Notifications\Notification;

class ListPenugasans extends ListRecords
{
    protected static string $resource = PenugasanResource::class;

    

    protected function getHeaderActions(): array
    {
        return [
            Action::make('Import Excel')
                ->label('Import Excel')
                ->icon('heroicon-o-arrow-up-on-square')
                ->form([
                    FileUpload::make('file')
                        ->label('Pilih File Excel')
                        ->required()
                        ->disk('public')
                        ->directory('imports')
                        ->acceptedFileTypes(['application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']),
                ])
                ->action(function (array $data): void {
                    $path = Storage::disk('public')->path($data['file']);
                    $importer = new PenugasanImport();
                    \Maatwebsite\Excel\Facades\Excel::import($importer, $path);

                    $message = "Total baris: {$importer->total}, Berhasil: {$importer->imported}";

                    if (!empty($importer->errors)) {
                        $message .= "\n\n⚠️ Gagal:\n- " . implode("\n- ", array_slice($importer->errors, 0, 5));
                        if (count($importer->errors) > 5) {
                            $message .= "\n...dan " . (count($importer->errors) - 5) . " error lainnya.";
                        }
                    }

                    \Filament\Notifications\Notification::make()
                        ->title('Import Penugasan')
                        ->body($message)
                        ->success()
                        ->send();
                }),
        ];
    }

}