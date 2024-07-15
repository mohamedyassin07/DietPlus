<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserQuiz extends Model
{
    use HasFactory, SoftDeletes;

    // The attributes that are mass assignable.
    protected $fillable = [
        'user_id',
        'quiz_data',
    ];

    // The attributes that should be cast.
    protected $casts = [
        'quiz_data' => 'array',
    ];

    // Define the relationship with the User model.
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
