<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRecipesTable extends Migration
{
    public function up()
    {
        Schema::create('recipes', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('category');
            $table->float('calories');
            $table->float('fats');
            $table->float('protein');
            $table->float('carbohydrates');
            $table->json('ingredients')->nullable();
            $table->text('preparation_method');
            $table->string('image_path')->nullable();
        });
    }

    public function down()
    {
        Schema::dropIfExists('recipes');
    }
}
