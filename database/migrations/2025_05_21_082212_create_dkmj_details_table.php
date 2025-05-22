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
        Schema::create('dkmj_detail', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('no_dkmj');
            $table->unsignedBigInteger('no_material');
            $table->string('satuan', 20)->nullable();
            $table->integer('qty')->nullable();
            $table->string('spesifikasi', 255)->nullable();

            // Foreign key ke tabel dkmj
            $table->foreign('no_dkmj')->references('ID')->on('dkmj')->onDelete('cascade');

            // Foreign key ke material
            $table->foreign('no_material')->references('ID')->on('material')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dkmj_detail');
    }
};
