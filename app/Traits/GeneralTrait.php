<?php

namespace App\Traits;

trait GeneralTrait
{
    public static function internal_settings(){
        return [
            'keto' => [
                'meals' => [
                    'breakfast' => [
                        'name' => 'Breakfast',
                        'calories' => 400,
                        'fats' => 20,
                        'protein' => 20,
                        'carbohydrates' => 20,
                        'order' => 3,
                    ],
                    'snack' => [
                        'name' => 'Snack',
                        'calories' => 400,
                        'fats' => 20,
                        'protein' => 20,
                        'carbohydrates' => 20,
                        'order' => 2,
                    ],
                    'lunch' => [
                        'name' => 'Lunch',
                        'calories' => 400,
                        'fats' => 20,
                        'protein' => 20,
                        'carbohydrates' => 20,
                        'order' => 4,
                    ],
                    'dinner' => [
                        'name' => 'Dinner',
                        'calories' => 400,
                        'fats' => 20,
                        'protein' => 20,
                        'carbohydrates' => 20,
                        'order' => 1,
                    ],
                ],
                'day_calories_limits' => [
                    'over_calories' => 50,
                    'less_calories' => 50,
                ]
            ],
            'otp_validity_duration' => 60,
        ];
    }
}