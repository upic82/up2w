<?php

namespace App\Filament\Resources\DkmjResource\Pages;

use App\Filament\Resources\DkmjResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListDkmjs extends ListRecords
{
    protected static string $resource = DkmjResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
