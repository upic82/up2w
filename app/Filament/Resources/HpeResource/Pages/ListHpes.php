<?php

namespace App\Filament\Resources\HpeResource\Pages;

use App\Filament\Resources\HpeResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListHpes extends ListRecords
{
    protected static string $resource = HpeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()
                ->hidden(),
        ];
    }
    
}
