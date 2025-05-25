<?php

namespace App\Filament\Resources\DkmjResource\Pages;

use App\Filament\Resources\DkmjResource;
use Filament\Resources\Pages\Page;
use Illuminate\Contracts\View\View;
use Filament\Actions\Action;

class Dkmj extends Page
{
    protected static string $resource = DkmjResource::class;

    protected static string $view = 'filament.resources.dkmj-resource.pages.dkmj';

}
