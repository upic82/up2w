@if ($dkmj->approval_status === 'approved_final')
    @php
        $am = \App\Models\User::find($dkmj->approved_by_am);
        $manager = \App\Models\User::find($dkmj->approved_by_manager);
    @endphp
@endif

<!DOCTYPE html>
<html>
<head>
    <title>Cetak DKMJ</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 1cm; font-size: 12px }
        .header { text-align: center; margin-bottom: 20px }
        .title { font-weight: bold; font-size: 16px }
        .no-dkmj { margin-bottom: 10px }
        table { width: 100%; border-collapse: collapse; margin-bottom: 15px }
        th, td { border: 1px solid #000; padding: 5px }
        .info-table { width: 100%; margin-bottom: 15px }
        .info-table td { padding: 3px 0 }
        .signature { margin-top: 50px; width: 100% }
        .signature td { width: 50%; vertical-align: top }
        .text-center { text-align: center }
        .page-break { page-break-after: always }
        @media print {
            @page { size: A4; margin: 1cm }
            body { margin: 0 }
        }
    </style>
    <script>
        window.onload = function() {
            window.print();
            setTimeout(function() {
                window.close();
            }, 1000);
        }
    </script>
</head>
<body>
    <div class="header">
        <div class="title">DAFTAR KEBUTUHAN MATERIAL DAN JASA (DKMJ)</div>
        <div class="no-dkmj">Nomor : {{ $dkmj->no_dkmj }}</div>
    </div>

    <!-- Informasi Utama -->
    <table class="info-table" border="0">
        <tr>
            <td width="25%">Penugasan</td>
            <td> : </td>
            <td>{{ $dkmj->penugasan->nama_penugasan }}</td>
        </tr>
        <tr>
            <td>Nomor Surat</td>
            <td> : </td>
            <td>{{ $dkmj->penugasan->no_surat_penugasan }}</td>
        </tr>
        <tr>
            <td>Tanggal Penugasan</td>
            <td> : </td>
            <td>{{ $dkmj->penugasan->tanggal_penugasan }}</td>
        </tr>
        <tr>
            <td>Batas Waktu</td>
            <td> : </td>
            <td>{{ $dkmj->penugasan->batas_waktu_penugasan }}</td>
        </tr>
        <tr>
            <td>Nilai Penugasan</td>
            <td> : </td>
            <td>Rp {{ $dkmj->penugasan->nilai_penugasan }}</td>
        </tr>
        <tr>
            <td>AMP ID</td>
            <td> : </td>
            <td>{{ $dkmj->penugasan->no_amp }}</td>
        </tr>
        <tr>
            <td>Nomor WBS</td>
            <td> : </td>
            <td>{{ $dkmj->penugasan->no_wbs }}</td>
        </tr>
        <tr>
            <td>Nomor WO</td>
            <td> : </td>
            <td>{{ $dkmj->workOrder->no_wo }}</td>
        </tr>
        <tr>
            <td>Tanggal WO</td>
            <td> : </td>
            <td>{{ $dkmj->workOrder->tanggal_wo }}</td>
        </tr>
    </table>

    <!-- Daftar Material -->
    <table>
        <thead>
            <tr>
                <th width="5%">NO</th>
                <th width="40%">NAMA BARANG/JASA</th>
                <th width="35%">SPESIFIKASI</th>
                <th width="10%">QTY</th>
                <th width="10%">SATUAN</th>
            </tr>
        </thead>
        <tbody>
            @foreach($dkmj->details as $item)
            <tr>
                <td>1</td>
                <td>{{ $item->material->nama_material }}</td>
                <td>{{ $item->spesifikasi }}</td>
                <td>{{ $item->qty }}</td>
                <td>{{ $item->material->satuan }}</td>
            </tr>
            
            @endforeach
                
        </tbody>
    </table>

    <!-- Tanda Tangan -->
    <table class="signature">
        <tr>
            <td class="text-center">
                Menyetujui,<br><br>
                @isset($manager)
                    @if ($manager?->signature_path)
                        <img src="{{ asset('storage/signatures/' . basename($manager->signature_path)) }}" height="60"><br>
                    @else
                        <br><br><br>
                    @endif
                @endisset
                <u>{{ $dkmj->managerApprover?->name ?? '-' }}</u><br>
                Manager
            </td>
            <td class="text-center">
                {{ $dkmj->kota_unit }}, {{ \Carbon\Carbon::parse($dkmj->tanggal_dkmj)->translatedFormat('d F Y') }}<br><br>
                Disusun Oleh,<br><br>
                @isset($am)
                    @if ($am?->signature_path)
                        <img src="{{ public_path($am->signature_path) }}" height="60"><br>
                    @else
                        <br><br><br>
                    @endif
                @endisset
                <u>{{ $dkmj->assistantManagerApprover?->name ?? '-' }}</u><br>
                Asman Produksi
            </td>
        </tr>
    </table>    

</body>
</html>