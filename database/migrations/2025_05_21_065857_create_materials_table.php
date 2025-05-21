<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('material', function (Blueprint $table) {
            $table->id(); // Kolom ID primary key otomatis
            $table->string('nama_material');
            $table->string('satuan');
            $table->string('created_by')->nullable();
            $table->string('update_by')->nullable();
            $table->timestamps(); // Tambahkan created_at dan updated_at otomatis
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('material');
    }
};
