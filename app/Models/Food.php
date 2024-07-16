<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Food extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'category_id',
        'unit',
        'restriction_id',
        'calories',
        'fats',
    ];

    protected $table = 'foods';

    // Relationship with FoodCategory
    public function category()
    {
        return $this->belongsTo(FoodCategory::class, 'category_id');
    }

    // Relationship with FoodRestriction
    public function restriction()
    {
        return $this->belongsTo(FoodRestriction::class, 'restriction_id');
    }
}
