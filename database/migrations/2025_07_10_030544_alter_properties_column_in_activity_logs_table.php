<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('activity_logs', function (Blueprint $table) {
            // Untuk MySQL/PostgreSQL
            if (Schema::hasColumn('activity_logs', 'properties')) {
                $table->json('properties')->nullable()->change();
            }
            
            // Alternatif untuk semua database
            // $table->dropColumn('properties');
            // $table->json('properties')->nullable();
        });
    }

    public function down()
    {
        Schema::table('activity_logs', function (Blueprint $table) {
            // Untuk MySQL/PostgreSQL
            $table->text('properties')->nullable()->change();
            
            // Alternatif untuk semua database
            // $table->dropColumn('properties');
            // $table->text('properties')->nullable();
        });
    }
};