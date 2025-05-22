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
        Schema::create('penugasan', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('no_amp')->unique();
            $table->string('nama_penugasan');
            $table->string('no_surat_penugasan')->nullable();
            $table->date('tanggal_penugasan')->nullable();
            $table->date('batas_waktu_penugasan')->nullable();
            $table->decimal('nilai_penugasan', 20, 2)->nullable();
            $table->string('no_wbs')->nullable();
            $table->string('pic_ren')->nullable();
            $table->string('pic_mek')->nullable();
            $table->string('status_penugasan')->nullable(); // sementara/tetap
            $table->unsignedBigInteger('customer'); // foreign key
            $table->string('status_progress')->nullable(); // on progress, BAPP, dll
            $table->string('created_by')->nullable();
            $table->string('updated_by')->nullable();
            $table->timestamps();

            // Foreign key ke tabel customer
            $table->foreign('customer')->references('id')->on('customer')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('penugasan');
    }
};
