<div class="space-y-4">
    <div class="bg-white rounded-lg shadow p-4">
        <div class="flex justify-between items-center mb-4">
            <h3 class="font-bold text-lg">Informasi Penugasan</h3>
        </div>
        <div class="grid grid-cols-2 gap-4 mb-4">
            <div>
                <p class="text-sm text-gray-500">No. Penugasan</p>
                <p class="font-medium">{{ $penugasan->no_amp }}</p>
            </div>
            <div>
                <p class="text-sm text-gray-500">Nama Penugasan</p>
                <p class="font-medium">{{ $penugasan->nama_penugasan }}</p>
            </div>
            <div>
                <p class="text-sm text-gray-500">Nilai Penugasan</p>
                <p class="font-medium">Rp {{ number_format($penugasan->nilai_penugasan, 0, ',', '.') }}</p>
            </div>
            <div>
                <p class="text-sm text-gray-500">Total Actual</p>
                <p class="font-medium">Rp {{ number_format($totalSpbl + $totalHpe, 0, ',', '.') }}</p>
            </div>
        </div>
    </div>

    <div class="space-y-6">
    <!-- Tabel Material -->
    <div class="bg-white rounded-lg shadow overflow-hidden">
        <h3 class="px-4 py-3 bg-gray-100 font-semibold">Daftar Material</h3>
        <table class="min-w-full divide-y divide-gray-200">
            <thead class="bg-gray-50">
                <tr>
                    <th class="px-4 py-2 text-left">Material</th>
                    <th class="px-4 py-2 text-left">Satuan</th>
                    <th class="px-4 py-2 text-right">Qty DKMJ</th>
                    <th class="px-4 py-2 text-right">Qty SPBL</th>
                    <th class="px-4 py-2 text-right">Qty HPE</th>
                    <th class="px-4 py-2 text-right">Sisa</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                @foreach($material_details as $item)
                <tr>
                    <td class="px-4 py-2">{{ $item['nama_material'] }}</td>
                    <td class="px-4 py-2">{{ $item['satuan'] }}</td>
                    <td class="px-4 py-2 text-right">{{ number_format($item['qty_dkmj'], 2) }}</td>
                    <td class="px-4 py-2 text-right">{{ number_format($item['qty_spbl'], 2) }}</td>
                    <td class="px-4 py-2 text-right">{{ number_format($item['qty_hpe'], 2) }}</td>
                    <td class="px-4 py-2 text-right font-semibold {{ $item['sisa'] < 0 ? 'text-red-500' : 'text-green-500' }}">
                        {{ number_format($item['sisa'], 2) }}
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <!-- Tabel SPBL dan HPE (existing code) -->
    @if(count($spbls) > 0)
    <div class="bg-white rounded-lg shadow overflow-hidden">
        <h3 class="px-4 py-3 bg-gray-100 font-semibold">Daftar SPBL ({{ count($spbls) }})</h3>
        <!-- ... existing SPBL table code ... -->
    </div>
    @endif
</div>

    
    <div class="bg-white rounded-lg shadow p-4">
        <h3 class="font-bold text-lg mb-4">Daftar SPBL ({{ $spbls->count() }})</h3>
        
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">No. DKMJ</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">No. SPBL</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama SPBL</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Vendor</th>
                        <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Nilai Total</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @forelse($spbls as $spbl)
                        <tr>
                            <td class="px-6 py-4 whitespace-nowrap">{{ $spbl->dkmj->no_dkmj ?? '-' }}</td>
                            <td class="px-6 py-4 whitespace-nowrap">{{ $spbl->no_spbl }}</td>
                            <td class="px-6 py-4 whitespace-nowrap">{{ $spbl->nama_spbl }}</td>
                            <td class="px-6 py-4 whitespace-nowrap">{{ $spbl->vendor->nama_vendor ?? '-' }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-right">Rp {{ number_format($spbl->grand_total, 0, ',', '.') }}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5" class="px-6 py-4 text-center text-gray-500">Tidak ada data SPBL</td>
                        </tr>
                    @endforelse
                </tbody>
                @if($spbls->isNotEmpty())
                    <tfoot>
                        <tr class="bg-gray-50 font-semibold">
                            <td colspan="4" class="px-6 py-4 text-right">Total SPBL:</td>
                            <td class="px-6 py-4 text-right">Rp {{ number_format($totalSpbl, 0, ',', '.') }}</td>
                        </tr>
                    </tfoot>
                @endif
            </table>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow p-4">
        <h3 class="font-bold text-lg mb-4">Daftar HPE ({{ $hpes->count() }})</h3>
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">No. DKMJ</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">No. HPE</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama HPE</th>
                        <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Nilai Total</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @forelse($hpes as $hpe)
                        <tr>
                            <td class="px-4 py-2 whitespace-nowrap font-medium">{{ $hpe->dkmj->no_dkmj ?? '-' }}</td>
                            <td class="px-4 py-2 whitespace-nowrap font-medium">{{ $hpe->no_hpe }}</td>
                            <td class="px-4 py-2 whitespace-nowrap font-medium">{{ $hpe->nama_hpe }}</td>
                            <td class="px-4 py-2 whitespace-nowrap font-medium text-right">Rp {{ number_format($hpe->grand_total, 0, ',', '.') }}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="4" class="px-6 py-4 text-center text-gray-500">Tidak ada data HPE</td>
                        </tr>
                    @endforelse
                </tbody>
                @if($hpes->isNotEmpty())
                    <tfoot>
                        <tr class="bg-gray-50 font-semibold">
                            <td colspan="3" class="px-6 py-4 text-right">Total HPE:</td>
                            <td class="px-6 py-4 text-right">Rp {{ number_format($totalHpe, 0, ',', '.') }}</td>
                        </tr>
                    </tfoot>
                @endif
            </table>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow p-4">
        <h3 class="font-bold text-lg mb-4">Daftar Kontrak ({{ $kontraks->count() }})</h3>
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">No. DKMJ</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">No. HPE</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama HPE</th>
                        <th class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Nilai Total</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @forelse($kontraks as $kontrak)
                        <tr>
                            <td class="px-4 py-2 whitespace-nowrap font-medium">{{ $kontrak->hpe->no_hpe ?? '-' }}</td>
                            <td class="px-4 py-2 whitespace-nowrap font-medium">{{ $kontrak->no_kontrak }}</td>
                            <td class="px-4 py-2 whitespace-nowrap font-medium">{{ $kontrak->judul_kontrak }}</td>
                            <td class="px-4 py-2 whitespace-nowrap font-medium text-right">Rp {{ number_format($kontrak->grand_total, 0, ',', '.') }}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="4" class="px-6 py-4 text-center text-gray-500">Tidak ada data Kontrak</td>
                        </tr>
                    @endforelse
                </tbody>
                @if($hpes->isNotEmpty())
                    <tfoot>
                        <tr class="bg-gray-50 font-semibold">
                            <td colspan="3" class="px-6 py-4 text-right">Total Kontrak:</td>
                            <td class="px-6 py-4 text-right">Rp {{ number_format($totalKontrak, 0, ',', '.') }}</td>
                        </tr>
                    </tfoot>
                @endif
            </table>
        </div>
    </div>

    <div class="bg-white rounded-lg shadow p-4">
        <div class="grid grid-cols-3 gap-4">
            <div class="col-span-2">
                <p class="font-semibold">Ringkasan Pengadaan</p>
                <p class="text-sm text-gray-600">Total nilai penugasan vs actual pengadaan</p>
            </div>
            <div class="space-y-2">
                <div class="flex justify-between">
                    <span>Nilai Penugasan:</span>
                    <span class="font-medium">Rp {{ number_format($penugasan->nilai_penugasan, 0, ',', '.') }}</span>
                </div>
                <div class="flex justify-between">
                    <span>Total Actual:</span>
                    <span class="font-medium">Rp {{ number_format($totalSpbl + $totalHpe, 0, ',', '.') }}</span>
                </div>
                <div class="flex justify-between border-t pt-2">
                    <span>Sisa Saldo:</span>
                    <span class="font-medium {{ ($penugasan->nilai_penugasan - ($totalSpbl + $totalHpe)) < 0 ? 'text-red-600' : 'text-green-600' }}">
                        Rp {{ number_format($penugasan->nilai_penugasan - ($totalSpbl + $totalHpe), 0, ',', '.') }}
                    </span>
                </div>
            </div>
        </div>
    </div>
</div>