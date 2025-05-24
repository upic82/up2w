<?php

namespace App\Filament\Resources\DkmjResource\Pages;

use App\Filament\Resources\DkmjResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditDkmj extends EditRecord
{
    protected static string $resource = DkmjResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
