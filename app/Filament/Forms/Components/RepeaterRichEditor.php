<?php

namespace App\Filament\Forms\Components;

use Filament\Forms\Components\Field;
use Filament\Forms\Components\RichEditor;

class RepeaterRichEditor extends Field
{
    protected string $view = 'filament.forms.components.repeater-rich-editor';

    // Tambahkan constructor ini
    public function __construct(string $name)
    {
        $this->name($name); // Panggil method name() dari parent
    }

    public static function make(string $name): static
    {
        return app(static::class, ['name' => $name]); // Perbaiki instantiasi
    }
}