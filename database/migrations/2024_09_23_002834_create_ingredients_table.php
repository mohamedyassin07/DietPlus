<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateIngredientsTable extends Migration
{
    public function up()
    {
        Schema::create('ingredients', function (Blueprint $table) {
            $table->id();
            $table->string('name');  // اسم المكون
            $table->foreignId('unit_id')->constrained('units')->onUpdate('cascade');  // الربط مع جدول الوحدات
        });
    }

    public function down()
    {
        Schema::dropIfExists('ingredients');
    }
}
