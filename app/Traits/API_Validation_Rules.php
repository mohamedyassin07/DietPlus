<?php

namespace App\Traits;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

trait API_Validation_Rules
{
    public function request_compatibility()
    {
        $methods = [
            'list' => [
                'method' => 'GET',
                'auth'  => true,
                'data_req' => false,
                'id'    => false
            ],
            'fields' => [
                'method' => 'GET',
                'auth'  => false,
                'data_req' => false,
                'id'    => false
            ],
            'add' => [
                'method' => 'POST',
                'auth'  => true,
                'data_req' => true,
                'id'    => false
            ],
            'edit' => [
                'method' => 'POST',
                'auth'  => true,
                'data_req' => true,
                'id'    => true
            ],
            'delete' => [
                'method' => 'DELETE',
                'auth'  => true,
                'data_req' => false,
                'id'    => true
            ],
            'show' => [
                'method' => 'GET',
                'auth'  => true,
                'data_req' => false,
                'id'    => true
            ],
            'register' => [
                'method' => 'POST',
                'auth'  => false,
                'data_req' => true,
                'id'    => false
            ],
            'login' => [
                'method' => 'POST',
                'auth'  => false,
                'data_req' => true,
                'id'    => false
            ],
            'password_reset' => [
                'method' => 'POST',
                'auth'  => false,
                'data_req' => true,
                'id'    => false
            ],
            'send_otp' => [
                'method' => 'POST',
                'auth'  => false,
                'data_req' => true,
                'id'    => false
            ],
            'verify_otp' => [
                'method' => 'POST',
                'auth'  => false,
                'data_req' => true,
                'id'    => false
            ],
            'reset_password' => [
                'method' => 'POST',
                'auth'  => false,
                'data_req' => true,
                'id'    => false
            ],
            'change_password' => [
                'method' => 'POST',
                'auth'  => true,
                'data_req' => true,
                'id'    => false
            ],
            'check_token' => [
                'method' => 'POST',
                'auth'  => true,
                'data_req' => false,
                'id'    => false
            ],
        ];

        if (! isset($methods[$this->action]) || ! method_exists($this, $this->action) ) {
            return [
                'message' => 'Action { ' . str_replace('_', '-', $this->action) . ' } not supported'
            ];
        }

        if ($methods[$this->action]['auth'] && ! $this->request->header('Authorization')) {
            return [
                'message' => 'Authorization token is required',
                'code' => 401
            ];
        }

        if (! $this->set_model($this->endpoint)) {
            return [
                'message' => 'Model { '.$this->endpoint.' }not found',
                'code' => 404
            ];
        }

        if ($this->request->method() !== $methods[$this->action]['method']) {
            return [
                'message' => 'Method { ' . $this->request->method() . ' } not allowed for { ' . $this->action . ' } action',
                'code' => 405
            ];
        }

        if ($methods[$this->action]['id'] && ! $this->id) {
            return [
                'message' => 'URL paremater { ID } is required'
            ];
        }

        if (!$methods[$this->action]['id'] && $this->id) {
            return [
                'message' => 'URL paremater { ID } is not supported for action { ' . $this->action . ' }',
                'code' => 405
            ];
        }

        if( $methods[$this->action]['auth'] ){
            $this->user = Auth::guard('sanctum')->user();
            if (! $this->user) {
                return [
                    'message' => 'Invalid or expired token',
                    'code' => 401
                ];
            }    
        }

        // this generate the errors if exists
        if( $methods[$this->action]['data_req'] && ! $this->validated_data() ){
            return [
                'message' => $this->errors,
                'code' => 401
            ];                
        }

        return true;
    }

    public static function get_validations_rules( $model )
    {
        $password_rules = 'sometimes|string|min:8|max:255';

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
                'phone' => 'sometimes|nullable|string|regex:/^\+\d{12}$/|unique:users,phone',
                'password' => $password_rules,
                'user_type' => 'sometimes|in:Admin,Employee,Customer',
                'image' => 'nullable|image|max:2048',
            ],
            'user-restrictions' => [
                'user_id' => 'required|exists:users,id',
                'restriction_id' => 'required|exists:food_restrictions,id',
            ],
            'login' => [
                'email' => 'required|email',
                'password' => $password_rules,
            ],
            'send_otp' => [
                'email' => 'required|email',
            ],
            'verify_otp' => [
                'email' => 'required|email',
                'otp' => 'required|numeric',
            ],
            'reset_password' => [
                'email' => 'required|email',
                'otp' => 'required|numeric',
                'new_password' => $password_rules,
            ],
            'change_password' =>[
                'current_password' => $password_rules,
                'new_password' => $password_rules,
            ],
        ];

        return $rules[$model] ?? [];
    }

    public function validated_data()
    {
        $validator = Validator::make($this->request->all(), $this->fields());

        if ($validator->fails()) {
            $this->errors = $validator->errors()->all();
            return false;
        }

        return $this->validated_data = $validator->validated();
    }

}