<?php

namespace App\Filament\Widgets;

use Filament\Widgets\Widget;

class AppTaglineWidget extends Widget
{
    protected static string $view = 'filament.widgets.app-tagline-widget';

    protected int | string | array $columnSpan = 'full';

    protected static ?int $sort = -100; // Supaya muncul di atas
}
