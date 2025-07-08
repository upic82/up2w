<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddJenisToHpeTable extends Migration
{
    public function up(): void
    {
        Schema::table('hpe', function (Blueprint $table) {
            $table->string('jenis')->default('HPE')->after('no_hpe');
        });
    }

    public function down(): void
    {
        Schema::table('hpe', function (Blueprint $table) {
            $table->dropColumn('jenis');
        });
    }
}
