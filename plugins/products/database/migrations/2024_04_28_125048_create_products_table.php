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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('name',255);
            $table->string('slug',255);
            $table->unsignedBigInteger('price');
            $table->unsignedInteger('discount')->default(0);
            $table->text('content');
            $table->boolean('status')->default(0);
            $table->unsignedBigInteger('idCate');
            $table->unsignedBigInteger('idBrand');
            $table->unsignedBigInteger('in_stock');
            $table->timestamps();
            $table->foreign('idCate')->references('id')->on('categories');
            $table->foreign('idBrand')->references('id')->on('brands');
        });
        Schema::create('gallery', function (Blueprint $table) {
            $table->id();
            $table->string('image',255);
            $table->unsignedBigInteger('id_parent')->nullable(true);
            $table->foreign('id_parent')->references('id')->on('products');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
    }
};
