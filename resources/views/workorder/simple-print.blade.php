<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Work Order - {{ $workOrder->no_wo }}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            color: #000;
        }
        .title {
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 10px;
            text-transform: uppercase;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 8px;
        }
        th, td {
            vertical-align: top;
            padding: 4px 6px;
            border: 1px solid #000;
        }
        .no-border td, .no-border th {
            border: none;
        }
        .section-title {
            font-weight: bold;
            background: #f0f0f0;
            text-transform: uppercase;
        }
        .signature {
            height: 80px;
        }
        .logo {
            height: 50px;
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
        <td width="8%">
            <img src="/images/Logo_PLN.png" alt="Logo" class="logo">
        </td>
        <td width="84%">
            <strong>PT. PLN (PERSERO) PUSHARLIS</strong><br>
            Unit Pelaksana Produksi dan Workshop I<br>
            Jl. Pulorida Merak 42456<br>
            Telp. (0254) 571625, Fax. (0254) 571273
        </td>
         <td width="8%">
            <img src="/images/logo-k3.jpg" alt="Logo" class="logo">
        </td>
    </tr>
</table>
<table>
     <tr>
         <td width="70%">
            <div class="title">WORK ORDER (WO)</div>
        </td>
         <td width="30%">
            No. Dokumen FR.03-PT.14.TEK<br>
            Revisi 02 <br>
            Tanggal 14 Juli 2020 <br>
            Halaman 1 dari 1
        </td>
    </tr>
</table>

<table>
   
    <tr>
        <td style="width: 25%;">No</td>
        <td>{{ $workOrder->no_wo }}</td>
    </tr>
    <tr>
        <td>Penugasan</td>
        <td>{{ $workOrder->penugasan->nama_penugasan ?? '-' }}</td>
    </tr>
    <tr>
        <td>Nomor Surat</td>
        <td>{{ $workOrder->penugasan->nomor_surat ?? '-' }}</td>
    </tr>
    <tr>
        <td>Tanggal Penugasan</td>
        <td>{{ $workOrder->penugasan->tanggal_penugasan?->format('d F Y') ?? '-' }}</td>
    </tr>
    <tr>
        <td>Batas Waktu Penugasan</td>
        <td>{{ $workOrder->penugasan->batas_waktu?->format('d F Y') ?? '-' }}</td>
    </tr>
    <tr>
        <td>Nilai Penugasan</td>
        <td>Rp {{ number_format($workOrder->penugasan->nilai_penugasan ?? 0, 0, ',', '.') }}</td>
    </tr>
    <tr>
        <td>AMP ID</td>
        <td>{{ $workOrder->penugasan->amp_id ?? '-' }}</td>
    </tr>
    <tr>
        <td>Kategori</td>
        <td>{{ $workOrder->penugasan->kategori ?? '-' }}</td>
    </tr>
    <tr>
        <td>Nomor WBS</td>
        <td>{{ $workOrder->penugasan->no_wbs ?? '-' }}</td>
    </tr>
</table>

{{-- TECHNICAL REQUIREMENT --}}
<table>
    <tr>
        <th class="section-title">Working Item</th>
        <th class="section-title">Remarks</th>
    </tr>
    <tr>
        <th class="section-title">Technical Requirement</th>
        <th class="section-title"></th>
    </tr>
    <tr>
    <td>
        {!! $workOrder->technical_requirment ?? '' !!}
    </td>
    <td></td>
    </tr>
{{-- TASK PLAN & SCHEDULE --}}
     <tr>
        <th class="section-title">Task Plan & Schedule</th>
        <th class="section-title"></th>
    </tr>
    <tr>
        <td>
            {!! $workOrder->task_plan_schedule ?? '' !!}
        </td>
        <td></td>
    </tr>


{{-- MATERIAL --}}
    <tr>
        <th class="section-title">Material</th>
        <th class="section-title"></th>
    </tr>
    <tr>
        <td>
            {!! $workOrder->material ?? '' !!}
        </td>
        <td></td>
    </tr>
{{-- METHOD --}}
    <tr>
        <th class="section-title">Method (Internal/Eksternal)</th>
        <th class="section-title"></th>
    </tr>
    <tr>
        <td>
            {!! $workOrder->method ?? '' !!}
        </td>
        <td></td>
    </tr>
{{-- MACHINE & TOOLS --}}
    <tr>
        <th class="section-title">Machine & Tools Usage</th>
        <th class="section-title"></th>
    </tr>
    <tr>
        <td>
            {!! $workOrder->machine_tools_usage ?? '' !!}
        </td>
        <td></td>
    </tr>
</table>



<table>
    
</table>

{{-- SIGNATURE SECTION --}}
<table class="no-border" style="margin-top:20px;">
    <tr>
        <td class="no-border" style="width: 33%; text-align:center;">
            <div>DITERBITKAN OLEH</div>
            <div class="signature"></div>
            <div>{{ $workOrder->diterbitkan_oleh ?? '' }}</div>
        </td>
        <td class="no-border" style="width: 33%; text-align:center;">
            <div>DILAKSANAKAN OLEH</div>
            <div class="signature"></div>
            <div>{{ $workOrder->dilaksanakan_oleh ?? '' }}</div>
        </td>
        <td class="no-border" style="width: 33%; text-align:center;">
            <div>DITUTUP OLEH</div>
            <div class="signature"></div>
            <div>{{ $workOrder->ditutup_oleh ?? '' }}</div>
        </td>
    </tr>
</table>

</body>
</html>
