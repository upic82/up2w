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
        Schema::create('work_orders', function (Blueprint $table) {
            $table->id();
            $table->string('no_amp')->unique(); // relasi one-to-one, harus unik
            $table->string('no_wo');
            $table->string('kategori')->nullable();
            $table->text('technical_requirment')->nullable();
            $table->text('task_plan_schedule')->nullable();
            $table->text('material')->nullable();
            $table->text('method')->nullable();
            $table->text('machine_tools_usage')->nullable();
            $table->string('tanggal_wo')->nullable();
            $table->string('diterbitkan_oleh')->nullable();
            $table->date('tanggal_diterbitkan')->nullable();
            $table->string('dilaksanakan_oleh')->nullable();
            $table->string('dilaksanakan_tanggal')->nullable();
            $table->string('ditutup_oleh')->nullable();
            $table->date('ditutup_tanggal')->nullable();
            $table->string('user_created')->nullable();
            $table->timestamps();

            // Foreign key opsional jika kamu ingin validasi no_amp di DB level
            $table->foreign('no_amp')->references('no_amp')->on('penugasans')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('work_orders');
    }
};
