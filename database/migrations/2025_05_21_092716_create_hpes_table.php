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
        Schema::create('hpe', function (Blueprint $table) {
            $table->id(); // ID PK
            $table->string('no_hpe')->unique();
            $table->unsignedBigInteger('no_dkmj'); // foreign key ke DKMJ
            $table->date('tanggal_hpe');
            $table->decimal('nilai_hpe', 18, 2);
            $table->decimal('nilai_ppn', 18, 2);
            $table->string('disusun_oleh')->nullable();;
            $table->string('approved_by')->nullable();
            $table->date('approved_at')->nullable();
            $table->string('created_by')->nullable();
            $table->string('updated_by')->nullable();
            $table->timestamps();

            // Foreign key constraint ke DKMJ
            $table->foreign('no_dkmj')->references('id')->on('dkmj')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hpe');
    }
};
