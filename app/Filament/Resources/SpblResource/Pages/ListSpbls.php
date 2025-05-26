<?php

namespace App\Filament\Resources\SpblResource\Pages;

use App\Filament\Resources\SpblResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSpbls extends ListRecords
{
    protected static string $resource = SpblResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
