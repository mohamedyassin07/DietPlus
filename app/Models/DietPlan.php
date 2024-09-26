<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\GeneralTrait;

class DietPlan extends Model
{
    use HasFactory, SoftDeletes, GeneralTrait;

    protected $fillable = [
        'user_id',
        'meals_schedule',
        'status_id',
        'deadline',
        'weight'
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

    public function generate(){
        $settings = self::internal_settings();
        dump( $settings );
        $user = $this->user;
        $user_id = $this->user_id;
        $weight = $this->weight;
        $sex = 'male';
        $age = 25;
        $quiz = UserQuiz::where('user_id', $user_id )->first();
        if( $quiz ){
            $data = $height = $quiz->quiz_data[0]['data'];
            $height = $data['height'];
            $sex= $data['sex'];
            $age= now()->diffInYears($data['birth_year']);
            $activity = $data['physical_activity'];
        }else {
            dd("No quiz data found");
        }


        $bmr = ( 10 * $weight ) + ( 6.25 * $height ) - ( 5 * $age ) + ( $sex == 'male' ? 5 : -161 );
        $appropriate_activity_factors = [
            'sedentary' => 1.2,
            'lightly_active' => 1.375,
            'moderately_active' => 1.55,
            'very_active' => 1.725,
        ];

        $calories_needed = $bmr * $appropriate_activity_factors[$activity];

        $bmi = $weight / (($height/100) * ($height/100));
        if( $bmi < 18.5 ){
            dd( 'underweight, keto not suitable for you' );
        }

        $total_calories_needed = $calories_needed - ( $bmi >= 25 ? 800 : 0 );

        $fats   = $total_calories_needed * 0.7 / 9;
        $proteins= $total_calories_needed * 0.2 / 4;
        $carbs= $total_calories_needed * 0.1 / 4;
        $cubs_of_water = 30 * $weight / 240;
        $water_lettres = $cubs_of_water * .24;

        dump(
                [
                    'user_id' => $user_id,
                    'weight_from_new_plan' => $weight,
                    'sex' => $sex,
                    'age' => $age,
                    'height' => $height,
                    'activity' => $activity,
                    'bmr' => $bmr,
                    'calories_needed' => $calories_needed,
                    'bmi' => $bmi,
                    'total_calories_needed' => $total_calories_needed,
                    'fats' => $fats,
                    'proteins' => $proteins,
                    'carbs' => $carbs,
                    'cubs_of_water' => $cubs_of_water,
                    'water_lettres' => $water_lettres,
                    'total_calories_needed_min' => $total_calories_needed - 50,
                    'total_calories_needed_max' => $total_calories_needed + 50,
                ]
            );
    }
}
