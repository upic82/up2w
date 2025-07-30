<div class="p-6 space-y-6">
    <div class="grid grid-cols-2 gap-4">
        <div>
            <h3 class="font-bold">Aktivitas</h3>
            <p>{{ $log->description }}</p>
        </div>
        <div>
            <h3 class="font-bold">Waktu</h3>
            <p>{{ $log->created_at->format('d/m/Y H:i:s') }}</p>
        </div>
    </div>

    <div class="border-t pt-4">
        <h3 class="font-bold mb-2">Detail Perubahan</h3>
        <div class="bg-gray-50 p-4 rounded">
            <pre class="text-sm">{{ json_encode($log->properties, JSON_PRETTY_PRINT) }}</pre>
        </div>
    </div>
</div>