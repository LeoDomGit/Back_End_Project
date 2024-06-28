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
        Schema::create('hoa_don', function (Blueprint $table) {
            $table->id();
            $table->string('name',255);
            $table->string('phone',10);
            $table->string('address',255);
            $table->string('email',255);
            $table->string('note',255)->nullable();
            $table->boolean('status')->default(0);
            $table->timestamps();
        });
        if (Schema::hasTable('hoa_don')) {
            Schema::create('hoa_don_chi_tiet', function (Blueprint $table) {
                $table->id();
                $table->unsignedBigInteger('id_hoa_don');
                $table->unsignedBigInteger('id_product');
                $table->unsignedInteger('quantity');
                $table->timestamps();
                $table->foreign('id_hoa_don')->references('id')->on('hoa_don');
                $table->foreign('id_product')->references('id')->on('products');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('hoa_don');
    }
};
