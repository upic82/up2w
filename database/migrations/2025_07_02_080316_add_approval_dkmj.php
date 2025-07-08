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
        Schema::table('dkmj', function (Blueprint $table) {
            
            $table->enum('approval_status', [
                'draft',
                'pending_tl',
                'approved_tl',
                'pending_am',
                'approved_am',
                'pending_m',
                'approved_final'
            ])->default('draft');
            $table->foreignId('approved_by_tl')->nullable()->constrained('users');
            $table->foreignId('approved_by_am')->nullable()->constrained('users');
            $table->foreignId('approved_by_manager')->nullable()->constrained('users');
           
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
