<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Payment extends Model
{
    use HasFactory, SoftDeletes;

    // The attributes that are mass assignable
    protected $fillable = [
        'user_id',
        'amount',
        'currency',
        'method',
        'date',
        'status',
    ];

    /**
     * Get the user that owns the payment.
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function getCustomLabelAttribute()
    {
        return "{$this->user->name} - {$this->amount} - {$this->method} - {$this->created_at}";
    }

}
