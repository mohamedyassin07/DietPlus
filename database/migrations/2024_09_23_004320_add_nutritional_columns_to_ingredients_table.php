<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddNutritionalColumnsToIngredientsTable extends Migration
{
    public function up()
    {
        Schema::table('ingredients', function (Blueprint $table) {
            $table->float('quantity')->after('unit_id');          // الكمية
            $table->float('calories')->after('quantity');         // السعرات الحرارية
            $table->float('fats')->after('calories');             // الدهون
            $table->float('protein')->after('fats');              // البروتين
            $table->float('carbohydrates')->after('protein');     // الكربوهيدرات
        });
    }

    public function down()
    {
        Schema::table('ingredients', function (Blueprint $table) {
            // Dropping the columns in case of rollback
            $table->dropColumn(['quantity', 'calories', 'fats', 'protein', 'carbohydrates']);
        });
    }
}
