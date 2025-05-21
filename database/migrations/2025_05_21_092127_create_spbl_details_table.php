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
        Schema::create('spbl_detail', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('no_material');
            $table->unsignedBigInteger('no_spbl');
            $table->integer('qty');
            $table->decimal('harga', 18, 2);
            $table->timestamps();

            // Foreign keys
            $table->foreign('no_spbl')->references('id')->on('spbl')->onDelete('cascade');
            $table->foreign('no_material')->references('id')->on('material')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('spbl_detail');
    }
};
