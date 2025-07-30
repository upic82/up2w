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
        Schema::create('activity_logs', function (Blueprint $table) {
        $table->id();
        $table->string('log_name')->default('transaction');
        $table->text('description');
        $table->string('event')->nullable();
        $table->morphs('subject'); // Polymorphic relation
        $table->foreignId('causer_id')->nullable()->constrained('users');
        $table->json('properties')->nullable();
        $table->ipAddress('ip_address')->nullable();
        $table->string('user_agent')->nullable();
        $table->timestamps();
});
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('activity_logs');
    }
};
