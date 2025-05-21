<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('kontrak', function (Blueprint $table) {
            $table->id();
            $table->string('no_kontrak')->unique();
            $table->unsignedBigInteger('no_hpe');
            $table->string('judul_kontrak');
            $table->date('tgl_kontrak_awal');
            $table->date('tgl_kontrak_akhir');
            $table->unsignedBigInteger('id_vendor');
            $table->decimal('nilai_kontrak', 18, 2);
            $table->decimal('nilai_ppn', 18, 2);
            $table->unsignedBigInteger('no_gl')->nullable();
            $table->unsignedBigInteger('no_pr')->nullable();
            $table->unsignedBigInteger('no_po')->nullable();
            $table->string('no_nota_dinas');
            $table->string('jenis_kontrak'); // PO/SPK/Kontrak
            $table->string('status_kontrak'); // draft/on progress/bapp/invoice/payment
            $table->string('created_by');
            $table->string('updated_by')->nullable();
            $table->timestamps();

            // Relasi
            $table->foreign('no_hpe')->references('id')->on('hpe')->onDelete('restrict');
            $table->foreign('id_vendor')->references('id')->on('vendor')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('kontrak');
    }
};
