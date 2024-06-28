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
        if (!Schema::hasTable('carts')) {
            Schema::create('carts', function (Blueprint $table) {
                $table->id();
                $table->unsignedBigInteger('id_product');
                $table->unsignedBigInteger('id_customer');
                $table->unsignedInteger('quantity');
                $table->timestamps();
                $table->foreign('id_customer')->references('id')->on('customers');
                $table->foreign('id_product')->references('id')->on('products');
            });            
        }

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('carts');
    }
};
