<div x-data="{ isOpen: false }">
    <!-- Tampilkan preview -->
    <div class="prose max-w-none p-2 border rounded bg-gray-50 mb-2" 
         x-html="$wire.get('{{ $getStatePath() }}')"></div>
    
    <x-filament::button 
        type="button" 
        x-on:click="isOpen = true"
        size="sm"
        icon="heroicon-o-pencil"
    >
        Edit Spesifikasi
    </x-filament::button>

    <x-filament::modal x-show="isOpen">
        <x-slot name="heading">
            Edit Spesifikasi
        </x-slot>

        <div class="p-4">
            @php
                $richEditor = RichEditor::make($getStatePath())
                    ->label('')
                    ->required($isRequired())
                    ->disableToolbarButtons($getDisabledToolbarButtons())
                    ->extraInputAttributes(['style' => 'min-height: 300px']);
            @endphp

            {{ $richEditor }}
        </div>

        <x-slot name="footer">
            <x-filament::button type="button" x-on:click="isOpen = false" color="gray">
                Batal
            </x-filament::button>
            <x-filament::button type="button" x-on:click="isOpen = false">
                Simpan
            </x-filament::button>
        </x-slot>
    </x-filament::modal>
</div>