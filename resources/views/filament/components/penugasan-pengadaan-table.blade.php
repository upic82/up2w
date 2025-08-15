<table class="min-w-full divide-y divide-gray-200 border border-gray-300 rounded-md shadow-sm">
    <thead class="bg-gray-100">
        <tr>
            <th scope="col" class="px-4 py-2 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                Jenis
            </th>
            <th scope="col" class="px-4 py-2 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                No. Dokumen
            </th>
            <th scope="col" class="px-4 py-2 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                Judul Pengadaan
            </th>
            <th scope="col" class="px-4 py-2 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                Tanggal
            </th>
            <th scope="col" class="px-4 py-2 text-right text-xs font-semibold text-gray-700 uppercase tracking-wider">
                Nilai (Rp)
            </th>
        </tr>
    </thead>
    <tbody class="bg-white divide-y divide-gray-200">
        @forelse ($pengadaans as $item)
            <tr class="hover:bg-gray-50">
                <td class="px-4 py-2 whitespace-nowrap text-sm text-gray-800 font-medium capitalize">
                    {{ $item['jenis'] }}
                </td>
                <td class="px-4 py-2 whitespace-nowrap text-sm text-gray-800">
                    {{ $item['no'] }}
                </td>
                <td class="px-4 py-2 whitespace-nowrap text-sm text-gray-800">
                    {{ $item['nama'] }} <br>
                    {{ $item['vendor'] }}
                </td>
                <td class="px-4 py-2 whitespace-nowrap text-sm text-gray-600">
                    {{ $item['tanggal'] }}
                </td>
                <td class="px-4 py-2 whitespace-nowrap text-sm text-gray-800 font-semibold text-right">
                    {{ number_format($item['nilai'], 0, ',', '.') }}
                </td>
            </tr>
        @empty
            <tr>
                <td colspan="4" class="px-4 py-6 text-center text-gray-400 italic">
                    Data tidak ada.
                </td>
            </tr>
        @endforelse
    </tbody>
</table>
