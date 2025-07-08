<x-filament::page>
    <form wire:submit.prevent="import">
        {{ $this->form }}
        <x-filament::button type="submit" class="mt-4">
            Import
        </x-filament::button>
    </form>
</x-filament::page>
