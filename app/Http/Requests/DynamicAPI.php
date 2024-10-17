<?php

namespace App\Http\Requests;

use Illuminate\Http\Request;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Validator;
use App\Traits\API_Validation_Rules;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\PasswordResetToken;
use Illuminate\Support\Facades\Mail;
use App\Mail\PasswordResetMail;
use App\Traits\GeneralTrait;

class DynamicAPI extends FormRequest
{
    use API_Validation_Rules , GeneralTrait;

    public $request;
    public $endpoint;
    public $action;
    public $model;
    public $record;
    public $id;
    public $validated_data;
    public $errors;

    public function handleRequest(Request $request, $endpoint, $action = null, $id = null)
    {
        if (! $this->set_model($endpoint)) {
            return $this->response_error('Model not found', 404);
        }

        $action = str_replace('-', '_', $action);
        if (! method_exists($this, $action)) {
            return $this->response_error('Invalid action', 404);
        }

        $this->endpoint = $endpoint;
        $this->request = $request;
        $this->action = $action;
        $this->id = $id;

        $compatibility_check = $this->request_compatibility();
        if ($compatibility_check !== true) {
            return $this->response_error($compatibility_check, 404);
        }

        if ($id) {
            $this->record = $this->model::find($id);
            if (! $this->record) {
                return $this->response_error('Record not found', 404);
            }
        }

        // TODO::CHECK THIS
        $data = $this->$action();
        return $data;
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

    public function validated_data()
    {
        $validator = Validator::make($this->request->all(), $this->fields());

        if ($validator->fails()) {
            $this->errors = $validator->errors()->all();
            return false;
        }

        return $this->validated_data = $validator->validated();
    }

    public function add()
    {
        if (! $this->validated_data()) {
            return $this->response_error($this->errors, 400);
        }

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
        if (! $this->validated_data()) {
            return $this->response_error($this->errors, 400);
        }

        if (!Auth::attempt([
            'email' => $this->request->input('email'),
            'password' => $this->request->input('password')
        ])) {
            return $this->response_error('Invalid credentials', 401);
        }

        $user = Auth::user();

        $token = $user->createToken('auth_token')->plainTextToken;

        return $this->response_data([
            'token' => $token,
            'user' => $user,
        ]);
    }

    public function send_otp()
    {
        if (! $this->validated_data()) {
            return $this->response_error($this->errors, 400);
        }

        $user = User::where('email', $this->validated_data['email'])->first();

        if (! $user) {
            return $this->response_error('User not found', 404);
        }

        $otp = rand(1000, 9999);
        $passwordResetToken = PasswordResetToken::updateOrCreate(
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

    public function verify_otp()
    {
        if (! $this->validated_data()) {
            return $this->response_error($this->errors, 400);
        }

        $user = User::where('email', $this->validated_data['email'])->first();
        if (! $user) {
            return $this->response_error('User not found', 404);
        }

        $passwordResetToken = PasswordResetToken::where('email', $user->email)
            ->where('token', $this->validated_data['otp'])
            ->first();

        if (! $passwordResetToken) {
            return $this->response_error('Invalid OTP', 400);
        }
        
        $otp_validity_duration = GeneralTrait::internal_settings()['otp_validity_duration'];
        if (now()->diffInMinutes($passwordResetToken->created_at) > $otp_validity_duration) {
            return $this->response_error('OTP has expired', 400);
        }

        $token = $user->createToken('auth_token')->plainTextToken;

        $passwordResetToken->delete();

        return $this->response_data([
            'user' => $user,
            'token' => $token,
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

    public function request_compatibility()
    {
        $methods = [
            'list' => [
                'method' => 'GET',
                'id'    => false
            ],
            'fields' => [
                'method' => 'GET',
                'id'    => false
            ],
            'add' => [
                'method' => 'POST',
                'id'    => false
            ],
            'edit' => [
                'method' => 'POST',
                'id'    => true
            ],
            'delete' => [
                'method' => 'DELETE',
                'id'    => true
            ],
            'show' => [
                'method' => 'GET',
                'id'    => true
            ],
            'register' => [
                'method' => 'POST',
                'id'    => false
            ],
            'login' => [
                'method' => 'POST',
                'id'    => false
            ],
            'logout' => [
                'method' => 'POST',
                'id'    => false
            ],
            'password_reset' => [
                'method' => 'POST',
                'id'    => false
            ],
            'send_otp' => [
                'method' => 'POST',
                'id'    => false
            ],
            'verify_otp' => [
                'method' => 'POST',
                'id'    => false
            ]
        ];

        if (! isset($methods[$this->action])) {
            return 'Action{ ' . $this->action . ' } not supported';
        }

        if ($this->request->method() !== $methods[$this->action]['method']) {
            return 'Method { ' . $this->request->method() . ' } not allowed for { ' . $this->action . ' } action';
        }

        if ($methods[$this->action]['id'] && ! $this->id) {
            return 'URL paremater { ID } is required';
        }

        if (!$methods[$this->action]['id'] && $this->id) {
            return 'URL paremater { ID } is not supported for action { ' . $this->action . ' }';
        }

        return true;
    }
}
