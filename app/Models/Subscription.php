<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Subscription extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'user_id',
        'package_id',
        'payment_id',
        'diet_plan_id',
        'status_id',
        'deadline',
    ];

    // Relationships
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function package()
    {
        return $this->belongsTo(Package::class);
    }

    public function payment()
    {
        return $this->belongsTo(Payment::class);
    }

    public function dietPlan()
    {
        return $this->belongsTo(DietPlan::class);
    }

    public function status()
    {
        return $this->belongsTo(SubscriptionStatus::class);
    }
}
