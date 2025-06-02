<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Surat Pemesanan - SPBL</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            margin: 40px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #000;
            padding: 5px;
            text-align: left;
        }
        .no-border td {
            border: none;
        }
        .text-center {
            text-align: center;
        }
        .text-right {
            text-align: right;
        }
        .bold {
            font-weight: bold;
        }
        .logo {
            height: 50px;
        }
        .header-table td {
            vertical-align: top;
        }
        .title {
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            margin: 10px 0;
        }
        .subtitle {
            text-align: center;
            margin-bottom: 10px;
        }
        .keterangan {
            height: 60px;
            vertical-align: top;
        }
        .no-border-bottom td {
            border-bottom: none;
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

<table class="no-border header-table">
    <tr>
        <td width="15%">
            <img src="/images/Logo_PLN.png" alt="Logo" class="logo">
        </td>
        <td width="85%">
            <strong>PT. PLN (PERSERO) PUSHARLIS</strong><br>
            Unit Pelaksana Produksi dan Workshop I<br>
            Jl. Pulorida Merak 42456<br>
            Telp. (0254) 571625, Fax. (0254) 571273
        </td>
    </tr>
</table>

<p class="title">SURAT PEMESANAN</p>
<p class="subtitle">{{ $spbl->nama_spbl }}</p>

<table class="no-border">
    <tr><td width="30%">Nomor</td><td>: {{ $spbl->no_spbl }}</td></tr>
    <tr><td>Tanggal</td><td>: {{ $spbl->tanggal_spbl }}</td></tr>
    <tr><td>Kepada</td><td>: <strong>{{ $spbl->vendor->nama_vendor }}</strong><br>Perkantoran Mega Sunter Blok 32B</td></tr>
</table>

<br>

<table>
    <thead>
        <tr class="text-center">
            <th width="5%">No</th>
            <th>Uraian</th>
            <th width="8%">Volume</th>
            <th width="7%">Satuan</th>
            <th width="12.5%">Harga Satuan (Rp.)</th>
            <th width="12.5%">Harga Total (Rp.)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="6"><strong>Material</strong></td>
        </tr>
        @foreach($spbl->details as $item)
        <tr>
            <td class="text-center">1</td>
            <td>{{ $item->material->nama_material }}</td>
            <td class="text-center">{{ number_format($item->qty, 0, ',', '.') }}</td>
            <td class="text-center">{{ $item->material->satuan }}</td>
            <td class="text-right">{{ number_format($item->harga, 0, ',', '.') }}</td>
            <td class="text-right">{{ number_format($item->harga*$item->qty, 0, ',', '.')}}</td>
        </tr>
        @endforeach
        <tr>
            <td colspan="5" class="text-right bold">JUMLAH</td>
            <td class="text-right bold">{{ number_format($spbl->nilai_spbl, 0, ',', '.') }}</td>
        </tr>
        <tr>
            <td colspan="5" class="text-right bold">PPN</td>
            <td class="text-right bold">{{ number_format($spbl->nilai_ppn, 0, ',', '.') }}</td>
        </tr>
        <tr>
            <td colspan="5" class="text-right bold">GRAND TOTAL</td>
            <td class="text-right bold">{{ number_format($spbl->nilai_spbl + $spbl->nilai_ppn, 0, ',', '.') }}</td>
        </tr>

    </tbody>
</table>

<br>

<table class="no-border">
    <tr>
        <td class="bold">Keterangan :</td>
    </tr>
    <tr class="keterangan">
        <td></td>
    </tr>
    <tr>
        <td class="bold">Terbilang :</td>
    </tr>
    <tr>
        <td>{{ ucfirst(terbilang($spbl->nilai_spbl + $spbl->nilai_ppn)) }} Rupiah</td>
    </tr>
</table>

<br>

<table class="no-border">
    <tr>
        <td class="bold">Persyaratan Pengadaan :</td>
    </tr>
    <tr>
        <td>
            1. Harga sudah termasuk PPN dan pajak-pajak atau pungutan lainnya.<br>
            2. Barang/Jasa diterima/selesai paling lambat tanggal 09 Mei 2025.<br>
            3. Barang harus diterima dalam kondisi baik dan tidak cacat.<br>
            4. Keterlambatan dapat dikenakan denda 1 o/oo per hari kalender keterlambatan.<br>
            5. Pembayaran dilakukan dengan melampirkan dokumen:
            <ul>
                <li>Invoice</li>
                <li>Faktur Pajak</li>
                <li>Kwitansi Pembayaran</li>
            </ul>
        </td>
    </tr>
</table>

</body>
</html>
