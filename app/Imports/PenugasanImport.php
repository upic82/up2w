<?php
namespace App\Imports;

use App\Models\Penugasan;
use App\Models\Customer;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\File;
use Carbon\Carbon;

class PenugasanImport implements ToCollection, WithHeadingRow
{
    public int $imported = 0;
    public int $total = 0;
    public array $errors = [];

    public function collection(Collection $rows)
    {
        foreach ($rows as $index => $row) {
            $this->total++;

            try {
                //$customer = Customer::where('nama_customer', trim($row['customer']))->first();
                $inputCustomer = trim($row['customer']);
                $customer = Customer::where('nama_customer', $inputCustomer)->first();

                if (!$customer) {
                    // Lakukan pencarian fuzzy jika pencocokan langsung tidak ketemu
                    $allCustomers = Customer::all();
                    $maxSimilarity = 0;
                    $closestCustomer = null;

                    foreach ($allCustomers as $c) {
                        similar_text(strtolower($inputCustomer), strtolower($c->nama_customer), $percent);
                        if ($percent > $maxSimilarity) {
                            $maxSimilarity = $percent;
                            $closestCustomer = $c;
                        }
                    }

                    if ($maxSimilarity >= 80 && $closestCustomer) {
                        // Kita anggap ini cocok, tampilkan juga di log bahwa ini fuzzy
                        $this->errors[] = "Baris " . ($index + 2) . ": Customer '{$inputCustomer}' tidak ditemukan, tapi dicocokkan dengan '{$closestCustomer->nama_customer}' (kemiripan: " . round($maxSimilarity) . "%).";
                        $customer = $closestCustomer;
                    } else {
                        $this->errors[] = "Baris " . ($index + 2) . ": Customer '{$inputCustomer}' tidak ditemukan dan tidak ada yang mendekati.";
                        continue;
                    }
                }


                if (!$customer) {
                    $this->errors[] = "Baris " . ($index + 2) . ": Customer '{$row['customer']}' tidak ditemukan.";
                    continue;
                }

                $tanggal_mulai = Carbon::parse($row['started'])->format('Y-m-d');
                $tanggal_akhir = Carbon::parse($row['deadline'])->format('Y-m-d');

                try {
                    $release_date = Carbon::createFromFormat('d-m-y, H:i', trim($row['released_date']))->format('Y-m-d H:i:s');
                    $last_update_excel = Carbon::createFromFormat('d-m-y, H:i', trim($row['last_update']))->format('Y-m-d H:i:s');
                } catch (\Exception $e) {
                    $this->errors[] = "Baris " . ($index + 2) . ": Format tanggal salah pada Released Date atau Last Update.";
                    continue;
                }

                $no_amp_clean = preg_replace('/\D/', '', $row['penugasan']);

                if (empty($no_amp_clean)) {
                    $this->errors[] = "Baris " . ($index + 2) . ": No AMP tidak valid atau kosong.";
                    continue;
                }

                $existing = Penugasan::where('no_amp', $no_amp_clean)->first();

                if ($existing) {
                    if ($existing->last_update && Carbon::parse($existing->last_update)->equalTo($last_update_excel)) {
                        continue; // Tidak berubah, lewati
                    }

                    $existing->update([
                        'nama_penugasan' => $row['description'],
                        'tanggal_penugasan' => $tanggal_mulai,
                        'batas_waktu_penugasan' => $tanggal_akhir,
                        'nilai_penugasan' => (float) preg_replace('/[^0-9.]/', '', $row['value']),
                        'no_wbs' => $row['wbs_number'] ?? null,
                        'status_penugasan' => $row['status'],
                        'id_customer' => $customer->id,
                        'status_progress' => $row['actual'],
                        'release_date' => $release_date,
                        'last_update' => $last_update_excel,
                        'updated_by' => auth()->user()?->name ?? 'import_user',
                    ]);
                } else {
                    Penugasan::create([
                        'no_amp' => $no_amp_clean,
                        'nama_penugasan' => $row['description'],
                        'tanggal_penugasan' => $tanggal_mulai,
                        'batas_waktu_penugasan' => $tanggal_akhir,
                        'nilai_penugasan' => (float) preg_replace('/[^0-9.]/', '', $row['value']),
                        'no_wbs' => $row['wbs_number'] ?? null,
                        'status_penugasan' => $row['status'],
                        'id_customer' => $customer->id,
                        'status_progress' => $row['actual'],
                        'release_date' => $release_date,
                        'last_update' => $last_update_excel,
                        'created_by' => auth()->user()?->name ?? 'import_user',
                        'updated_by' => auth()->user()?->name ?? 'import_user',
                    ]);
                }

                $this->imported++;
            } catch (\Exception $e) {
                $this->errors[] = "Baris " . ($index + 2) . ": " . $e->getMessage();
            }
        }

        $this->saveLog();
    }

    protected function saveLog(): void
    {
        $timestamp = now()->format('Ymd_His');
        $logPath = storage_path("logs/imports");
        $logFile = $logPath . "/penugasan_import_{$timestamp}.log";

        if (!File::exists($logPath)) {
            File::makeDirectory($logPath, 0755, true);
        }

        $skipped = $this->total - $this->imported - count($this->errors);
        $logContent = "Import Penugasan - " . now()->toDateTimeString() . "\n";
        $logContent .= "Total baris    : {$this->total}\n";
        $logContent .= "Berhasil       : {$this->imported}\n";
        $logContent .= "Dilewati       : {$skipped}\n";
        $logContent .= "Gagal          : " . count($this->errors) . "\n\n";
        $logContent .= implode("\n", $this->errors);

        File::put($logFile, $logContent);
    }
}
