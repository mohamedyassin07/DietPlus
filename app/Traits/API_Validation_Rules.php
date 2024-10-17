<?php

namespace App\Traits;

trait API_Validation_Rules
{
    public static function get_validations_rules( $model )
    {
        $rules = [
            'diet-plans' => [
                'user_id' => 'required|exists:users,id',
                'status_id' => 'required|exists:diet_plan_statuses,id',
                'deadline' => 'required|date',
                'weight' => 'required|numeric',
                'meals_schedule' => 'required|array',
            ],
            'food-categories' => [
                'name' => 'required|string|max:255',
            ],
            'foods' => [
                'name' => 'required|string|max:255',
                'category_id' => 'nullable|exists:food_categories,id',
                'unit' => 'required|string|max:50',
                'restriction_id' => 'nullable|exists:food_restrictions,id',
                'calories' => 'required|numeric',
                'fats' => 'required|numeric',
            ],
            'food-restrictions' => [
                'name' => 'required|string|max:255',
                'level' => 'required|in:low,medium,high',
                'description' => 'nullable|string|max:255',
            ],
            'ingredients' => [
                'name' => 'required|string|max:255',
                'unit_id' => 'required|exists:units,id',
                'quantity' => 'required|numeric',
                'calories' => 'required|numeric',
                'fats' => 'required|numeric',
                'protein' => 'required|numeric',
                'carbohydrates' => 'required|numeric',
            ],
            'packages' => [
                'name' => 'required|string|max:255',
                'price' => 'required|numeric',
                'duration_in_days' => 'required|integer',
                'duration_as_string' => 'nullable|string|max:50',
                'sale_price' => 'nullable|numeric',
                'sale_price_deadline' => 'nullable|date',
            ],
            'payments' => [
                'user_id' => 'required|exists:users,id',
                'amount' => 'required|numeric',
                'method' => 'required|in:stripe,paypal,bank_transfer,offline',
                'status' => 'required|in:pending,completed,failed,refunded',
                'date' => 'required|date',
            ],
            'recipes' => [
                'name' => 'required|string|max:255',
                'category' => 'required|string',
                'preparation_method' => 'required|string',
                'image_path' => 'nullable|image|max:2048',
                'ingredients' => 'required|array',
                'ingredients.*.ingredient_id' => 'required|exists:ingredients,id',
                'ingredients.*.quantity' => 'required|numeric',
            ],
            'subscriptions' => [
                'user_id' => 'required|exists:users,id',
                'package_id' => 'required|exists:packages,id',
                'payment_id' => 'nullable|exists:payments,id',
                'diet_plan_id' => 'nullable|exists:diet_plans,id',
                'status_id' => 'required|exists:subscription_statuses,id',
                'deadline' => 'nullable|date',
            ],
            'units' => [
                'name' => 'required|string|max:255',
            ],
            'user-preferences' => [
                'user_id' => 'required|exists:users,id',
                'food_id' => 'required|exists:foods,id',
                'preference_level' => 'required|in:1,2,3,4,5',
            ],
            'user-quizzes' => [
                'user_id' => 'required|exists:users,id',
                'quiz_data' => 'required|array',
            ],
            'users' => [
                'name' => 'required|string|max:255',
                'email' => 'required|email|unique:users,email',
                'password' => 'required|min:8',
                'user_type' => 'required|in:Admin,Employee,Customer',
                'image' => 'nullable|image|max:2048',
            ],
            'user-restrictions' => [
                'user_id' => 'required|exists:users,id',
                'restriction_id' => 'required|exists:food_restrictions,id',
            ],
            'login' => [
                'email' => 'required|email',
                'password' => 'required|min:8',
            ],
            'send_otp' => [
                'email' => 'required|email',
            ],
        ];

        return $rules[$model] ?? [];
    }
}