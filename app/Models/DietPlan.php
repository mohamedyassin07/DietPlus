<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DietPlan extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'user_id',
        'meals_schedule',
        'status_id',
        'deadline',
    ];

    protected $casts = [
        'meals_schedule' => 'array',
        'deadline' => 'date',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function status()
    {
        return $this->belongsTo(DietPlanStatus::class);
    }
}
