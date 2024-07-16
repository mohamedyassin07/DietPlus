<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFoodsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('foods', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedBigInteger('category_id')->nullable();
            $table->string('unit', 50);
            $table->unsignedBigInteger('restriction_id')->nullable();
            $table->float('calories');
            $table->float('fats');
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('category_id')->references('id')->on('food_categories')->onDelete('set null');
            $table->foreign('restriction_id')->references('id')->on('food_restrictions')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('foods');
    }
}