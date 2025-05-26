<?php

namespace App\Filament\Resources\SpblResource\Pages;

use App\Filament\Resources\SpblResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSpbl extends EditRecord
{
    protected static string $resource = SpblResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
