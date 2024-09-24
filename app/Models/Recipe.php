<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Recipe extends Model
{
    use HasFactory;
    public $timestamps = false;

    protected $fillable = [
        'name', 'category', 'preparation_method', 'calories', 'fats', 'protein', 'carbohydrates', 'image_path', 'ingredients',
    ];

    protected $casts = [
        'ingredients' =>'array',
    ];
}
