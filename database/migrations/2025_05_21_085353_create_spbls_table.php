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
        Schema::create('spbl', function (Blueprint $table) {
            $table->id(); // ID (Primary Key)
            $table->string('no_spbl')->unique();
            $table->unsignedBigInteger('no_dkmj'); // foreign key ke dkmj
            $table->date('tanggal_spbl');
            $table->decimal('nilai_spbl', 18, 2);
            $table->decimal('nilai_ppn', 18, 2);
            $table->string('disusun_by');
            $table->text('persyaratan_pengadaan')->nullable();
            $table->unsignedBigInteger('no_vendor');
            $table->string('approved_by')->nullable();
            $table->timestamp('approved_at')->nullable();
            $table->string('created_by')->nullable();
            $table->string('updated_by')->nullable();
            $table->timestamps();

            // Foreign key constraint (opsional, jika ada tabel dkmj dan vendor)
            $table->foreign('no_dkmj')->references('id')->on('dkmj')->onDelete('cascade');
            $table->foreign('no_vendor')->references('id')->on('vendor')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('spbl');
    }
};
