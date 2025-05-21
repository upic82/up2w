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
        Schema::create('hpe_detail', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('no_hpe');
            $table->unsignedBigInteger('no_material');
            $table->integer('qty');
            $table->string('satuan', 50);
            $table->decimal('harga', 18, 2);
            $table->timestamps();

            // Foreign keys
            $table->foreign('no_hpe')->references('id')->on('hpe')->onDelete('cascade');
            $table->foreign('no_material')->references('id')->on('material')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hpe_detail');
    }
};
