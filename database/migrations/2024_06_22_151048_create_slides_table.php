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
        if (!Schema::hasTable('slides')) {
            Schema::create('slides', function (Blueprint $table) {
                $table->id();
                $table->string('name',255);
                $table->string('slug',255);
                $table->string('url',255)->nullable();
                $table->boolean('status')->default(0);
                $table->string('desktop',255);
                $table->string('mobile',255);
                $table->timestamps();
            });
        }

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('slides');
    }
};
