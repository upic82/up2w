<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('vendor', function (Blueprint $table) {
            $table->id(); // otomatis membuat bigIncrements('id')
            $table->string('nama_vendor');
            $table->string('alamat');
            $table->string('created_by')->nullable();
            $table->string('update_by')->nullable();
            $table->timestamps(); // created_at dan updated_at
        });
    }

    public function down()
    {
        Schema::dropIfExists('vendor');
    }
};
