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
        Schema::create('dkmj', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('no_amp');
            $table->string('no_dkmj', 100)->nullable();
            $table->string('disusun_oleh', 100)->nullable();
            $table->string('menyetujui', 100)->nullable();
            $table->string('tanggal_dkmj', 20)->nullable();
            $table->string('disetujui_tanggal', 20)->nullable();
            $table->string('kota_unit', 50)->nullable();
            $table->string('no_wbs', 50)->nullable();
            $table->string('created_by', 50)->nullable();
            $table->string('updated_by', 50)->nullable();
            $table->timestamps();
            $table->foreign('no_amp')->references('no_amp')->on('work_orders')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dkmj');
    }
};
