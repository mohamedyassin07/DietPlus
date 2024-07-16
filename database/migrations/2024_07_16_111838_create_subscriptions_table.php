<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(): void
    {
        Schema::create('subscriptions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('package_id');
            $table->unsignedBigInteger('payment_id')->nullable();
            $table->unsignedBigInteger('diet_plan_id')->nullable();
            $table->unsignedBigInteger('status_id');
            $table->date('deadline')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('package_id')->references('id')->on('packages');
            $table->foreign('payment_id')->references('id')->on('payments');
            $table->foreign('diet_plan_id')->references('id')->on('diet_plans');
            $table->foreign('status_id')->references('id')->on('subscription_statuses');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down(): void
    {
        Schema::dropIfExists('subscriptions');
    }
};
