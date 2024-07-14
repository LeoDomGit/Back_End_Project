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
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_user')->nullable();
            $table->unsignedBigInteger('id_customer');
            $table->unsignedBigInteger('id_service');
            $table->dateTime('time');
            $table->dateTime('end_time');
            $table->timestamps();
        });

        Schema::table('bookings', function (Blueprint $table) {
            $table->foreign('id_user')->references('id')->on('users')->onDelete('set null');
            $table->foreign('id_customer')->references('id')->on('customers')->onDelete('cascade');
            $table->foreign('id_service')->references('id')->on('services')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bookings');

        Schema::table('bookings', function (Blueprint $table) {
            $table->dropForeign(['id_user']);
            $table->dropForeign(['id_customer']);
            $table->dropForeign(['id_service']);
        });
    }
};
