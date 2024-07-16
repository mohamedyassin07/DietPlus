<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DietPlan extends Model
{
    use HasFactory, SoftDeletes;

    // The attributes that are mass assignable.
    protected $fillable = [
        'user_id',
        'meals_schedule',
        'status_id',
        'deadline',
    ];

    // Define relationships
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function status()
    {
        return $this->belongsTo(DietPlanStatus::class);
    }

    public function setMealsScheduleAttribute($value)
    {
        $this->attributes['meals_schedule'] = json_encode($value);
    }

    public function getMealsScheduleAttribute($value)
    {
        return json_decode($value, true);
    }
}
