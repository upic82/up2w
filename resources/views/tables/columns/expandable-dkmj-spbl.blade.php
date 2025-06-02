<div x-data="{ open: false }">
    <button @click="open = !open" class="text-sm text-blue-600 underline">
        <span x-show="!open">Lihat SPBL</span>
        <span x-show="open">Sembunyikan</span>
    </button>

    <div x-show="open" class="mt-2 p-3 bg-gray-100 rounded">
        @php
            $spbls = collect($record->spbls ?? []);
        @endphp

        @if ($spbls->isEmpty())
            <div class="text-gray-500 italic">Belum ada SPBL</div>
        @else
            <table class="w-full text-sm">
                <thead>
                    <tr class="border-b">
                        <th class="text-left">No SPBL</th>
                        <th class="text-left">Tgl</th>
                        <th class="text-right">Nilai</th>
                        <th class="text-right">PPN</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($spbls as $spbl)
                        <tr class="border-b">
                            <td>{{ $spbl->no_spbl }}</td>
                            <td>{{ \Carbon\Carbon::parse($spbl->tgl_spbl)->format('d M Y') }}</td>
                            <td class="text-right">Rp {{ number_format($spbl->nilai_spbl, 0, ',', '.') }}</td>
                            <td class="text-right">Rp {{ number_format($spbl->nilai_ppn, 0, ',', '.') }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        @endif
    </div>
</div>
