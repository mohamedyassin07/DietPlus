<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DietPlanStatus extends Model
{
    use HasFactory, SoftDeletes;

    // The attributes that are mass assignable.
    protected $fillable = [
        'name',
    ];

    // Define any necessary relationships here
}
