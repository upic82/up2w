<?php

namespace App\Filament\Resources\DkmjResource\Pages;

use Filament\Resources\Pages\ViewRecord;
use App\Filament\Resources\DkmjResource;

class ViewDkmj extends ViewRecord
{
    protected static string $resource = DkmjResource::class;

    protected function getHeaderActions(): array
    {
        return [
            \Filament\Actions\EditAction::make(),
        ];
    }
}