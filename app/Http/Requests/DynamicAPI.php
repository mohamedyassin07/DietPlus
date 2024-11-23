<?php

namespace App\Http\Requests;

use Illuminate\Http\Request;
use Illuminate\Foundation\Http\FormRequest;
use App\Traits\API_Validation_Rules;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\PasswordResetToken;
use App\Traits\GeneralTrait;
use Illuminate\Support\Facades\Hash;

class DynamicAPI extends FormRequest
{
    use API_Validation_Rules, GeneralTrait;

    public $request;
    public $endpoint;
    public $action;
    public $model;
    public $id;
    public $record;
    public $validated_data;
    public $errors;
    public $user;

    public function handle_request(Request $request, $endpoint, $action = null, $id = null)
    {
        $this->request  = $request;
        $this->endpoint = $endpoint;
        $this->action   = str_replace('-', '_', $action);
        $this->id       = $id;

        $compatibility_check = $this->request_compatibility();
        if ($compatibility_check !== true) {
            $code = $compatibility_check['code'] ?? 400;
            return $this->response_error($compatibility_check['message'], $code);
        }

        if ($id) {
            $this->record = $this->model::find($id);
            if (! $this->record) {
                return $this->response_error('Record not found', 404);
            }
        }

        return $this->{$this->action}();
    }

    public function set_model($endpoint)
    {
        $model_class = 'App\\Models\\' . Str::studly(Str::singular($endpoint));
        if (! class_exists($model_class)) {
            return false;
        }

        return $this->model = new $model_class;
    }

    public function response_data($data, $code = 200)
    {
        return response()->json(['data' => $data], $code);
    }

    public function response_error($errors, $code = 400)
    {
        $errors = is_string($errors) ? [$errors] : $errors;
        return response()->json(['errors' => $errors], $code);
    }

    public function add()
    {
        $this->record = $this->model->create($this->validated_data);
        return $this->response_data($this->record);
    }

    public function register()
    {
        $this->request->merge(['user_type' => 'Customer']);
        return $this->add();
    }

    public function login()
    {
        if (!Auth::attempt([
            'email' => $this->request->input('email'),
            'password' => $this->request->input('password')
        ])) {
            return $this->response_error('Invalid credentials', 401);
        }

        $user = Auth::user();

        $token = $user->createToken('diet_plus_auth_token')->plainTextToken;

        return $this->response_data([
            'token' => $token,
            'user' => $user,
        ]);
    }

    public function send_otp()
    {
        $user = User::where('email', $this->validated_data['email'])->first();

        if (! $user) {
            return $this->response_error('User not found', 404);
        }

        $otp = rand(1000, 9999);
        PasswordResetToken::updateOrCreate(
            ['email' => $user->email],
            ['token' => $otp, 'created_at' => now()]
        );

        // TODO::send email
        // $resetLink = url('/password-reset?token=' . $otp);
        // Mail::to($user->email)->send(new PasswordResetMail($resetLink));

        // TODO::send otp to mobile

        // TODO::tries counter max 3 times or it will be blocked

        return $this->response_data([
            'user' => $user,
            'otp' => $otp,
            //'message' => 'Password reset email has been sent.',
        ]);
    }

    public function is_otp_verified( $delete = false ){
        $this->user = User::where('email', $this->validated_data['email'])->first();
        if (! $this->user ) {
            return $this->errors = ['User not found'];
        }

        $reset_token = PasswordResetToken::where('email', $this->user->email)
            ->where('token', $this->validated_data['otp'])
            ->first();

        if (! $reset_token) {
            return $this->errors = ['Invalid OTP'];
        }

        $otp_validity_duration = GeneralTrait::internal_settings()['otp_validity_duration'];
        if (now()->diffInMinutes($reset_token->created_at) > $otp_validity_duration) {
            return $this->errors = ['OTP has expired'];
        }

        if( $delete ){
            $reset_token->delete();
        }

        return true;
    }

    public function verify_otp()
    {
        if( $this->is_otp_verified() !== true ){
            return $this->response_error($this->errors, 400);
        }

        return ['user' =>$this->user ];
    }

    public function reset_password(){
        if( $this->is_otp_verified( true ) !== true ){
            return $this->response_error($this->errors, 400);
        }

        $this->user->update([
            'new_password' => $this->validated_data['new_password']
        ]);

        $token = $this->user->createToken('diet_plus_auth_token')->plainTextToken;

        return $this->response_data([
            'message' => 'Password reset successfully',
            'user' => $this->user,
            'token' => $token,
        ]);
    }

    public function change_password(){
        if (!Hash::check($this->validated_data['current_password'], $this->user->password)) {
            return $this->response_error('Current password field is incorrect', 400);
        }

        $this->user->update([
            'new_password' => $this->validated_data['new_password']
        ]);

        //TODO:: delete the current token or make it expired
        //TODO:: add  expires_at date
        $token = $this->user->createToken('diet_plus_auth_token')->plainTextToken;

        return $this->response_data([
            'message' => 'Password changed successfully',
            'user' => $this->user,
            'token' => $token,
        ]);
    }

    public function check_token(){
        return $this->response_data([
            'message' => 'Token is valid',
            'user' => $this->user,
        ]);
    }

    public function show()
    {
        return $this->response_data($this->record->toArray());
    }

    public function edit()
    {
        $this->record->update($this->validated_data);
        return $this->response_data($this->record->fresh());
    }

    public function delete()
    {
        $id = $this->record->id;
        $this->record->delete();

        return $this->response_data([
            'message' => 'Record deleted successfully',
            'deleted_id' => $id
        ]);
    }

    public function list()
    {
        $query = $this->model->query();

        $filters = $this->request->input('filters', []);
        foreach ($filters as $filter) {
            if (! isset($filter['field']) ||  ! isset($filter['operator']) ||  !isset($filter['value'])) {
                return $this->response_error('Every filter MUST contains: field,operator,value ', 404);
            }

            $field = $filter['field'];
            $operator = $filter['operator'];
            $value = $filter['value'];

            if (! in_array($field, $this->model->getFillable())) {
                return $this->response_error('This field {{' . $field . '}} not filterable', 404);
            }

            switch ($operator) {
                case '=':
                case '!=':
                case '>':
                case '<':
                case '>=':
                case '<=':
                    $query->where($field, $operator, $value);
                    break;
                case 'like':
                    $query->where($field, 'LIKE', "%$value%");
                    break;
                case 'between':
                    if (is_array($value) && count($value) == 2) {
                        $query->whereBetween($field, $value);
                    }
                    break;
                case 'in':
                    if (is_array($value)) {
                        $query->whereIn($field, $value);
                    }
                    break;
            }
        }

        $sortField = $this->request->input('sort_by', 'id');
        $sortDirection = $this->request->input('sort_direction', 'asc');
        if (in_array($sortField, $this->model->getFillable())) {
            $query->orderBy($sortField, $sortDirection);
        }

        $perPage = $this->request->input('per_page', 10);

        return $query->paginate($perPage);
    }

    public function fields()
    {
        $fields = self::get_validations_rules($this->action);
        if (! $fields) {
            $fields = self::get_validations_rules($this->endpoint);
        }
        return $fields;
    }
}