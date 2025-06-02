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
        <div class="title">SURAT PEMESANAN</div>
        <div class="no-dkmj">Nomor : {{ $spbl->no_spbl }}</div>
    </div>

    <!-- Informasi Utama -->
    <table class="info-table" border="0">
        <tr>
            <td width="25%">Nama Pengadaan</td>
            <td> : </td>
            <td>{{ $spbl->nama_spbl }}</td>
        </tr>
        
        <tr>
            <td>Tanggal SPBL</td>
            <td> : </td>
            <td>{{ $spbl->tanggal_spbl }}</td>
        </tr>
        
        <tr>
            <td>Vendor</td>
            <td> : </td>
            <td>{{ $spbl->vendor->nama_vendor }}</td>
        </tr>
        <tr>
            <td>Alamat Vendor</td>
            <td> : </td>
            <td>{{ $spbl->vendor->alamat }}</td>
        </tr>
        
    </table>

    <!-- Daftar Material -->
    <table>
        <thead>
            <tr>
                <<th width="5%">NO</th>
                <th width="45%">NAMA BARANG/JASA</th>
                <th width="8%">QTY</th>
                <th width="7%">SATUAN</th>
                <th width="17.5%">HARGA SATUAN</th>
                <th width="17.5%">HARGA TOTAL</th>


            </tr>
        </thead>
        <tbody>
            @foreach($spbl->details as $item)
            <tr>
                <td>1</td>
                <td>{{ $item->material->nama_material }}</td>
                <td>{{ $item->qty }}</td>
                <td>{{ $item->material->satuan }}</td>
                <td>{{ $item->harga }}</td>
                <td>{{ $item->harga*$item->qty }}</td>
            </tr>
            
            @endforeach
                
        </tbody>
    </table>

    <!-- Tanda Tangan -->
    <table class="signature">
        <tr>
            <td class="text-center">
                Menyetujui,<br><br><br><br>
                <u>{{ $spbl->approved_by }}</u><br>
                Manager
            </td>
            <td class="text-center">
                Cilegon, {{ $spbl->tanggal_spbl }}<br><br>
                Disusun Oleh,<br><br><br><br>
                <u>{{ $spbl->disusun_by }}</u><br>
                Asman Produksi
            </td>
            
        </tr>
    </table>
</body>
</html>