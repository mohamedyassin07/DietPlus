<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('user_preferences', function (Blueprint $table) {
            $table->dropForeign('user_preferences_food_id_foreign');
        });
    }

    public function down()
    {
        Schema::table('user_preferences', function (Blueprint $table) {
            $table->foreign('recipe_id')->references('id')->on('foods')->onDelete('cascade');
        });
    }
};
