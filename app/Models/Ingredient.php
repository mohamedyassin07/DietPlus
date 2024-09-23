<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ingredient extends Model
{
    public $timestamps = false;
    use HasFactory;

    protected $fillable = [
        'name',
        'unit_id',
        'quantity',
        'calories',
        'fats',
        'protein',
        'carbohydrates',
    ];

    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }
}
