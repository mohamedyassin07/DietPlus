<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserRestriction extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'user_id',
        'restriction_id',
    ];

    // Define the relationship with User model
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // Define the relationship with FoodRestriction model
    public function restriction()
    {
        return $this->belongsTo(FoodRestriction::class);
    }
}
