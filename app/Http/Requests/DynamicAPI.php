<?php 
namespace App\Http\Requests;

use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\User as Auth;
use Illuminate\Support\Facades\Schema;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Support\Facades\Hash;


class DynamicAPI extends FormRequest
{

    public function handleRequest(Request $request, $model_name, $action = null, $id = null)
    {
        $model_class = $this->get_model_class($model_name);

        if (method_exists($this, $model_name . '_' . $action )) {
            $method = $model_name . '_' . $action;
            $model_class = $this->get_model_class('User');
        }elseif (!class_exists($model_class)) {
            return $this->response_error('Model not found', 404);
        }else{
            $method = $action;
        }

        $model = $this->get_model_instance($model_class);

        $validation = $this->request_validation( $request, $method, $id );
        if( $validation ){
            return $this->response_error( $validation['error'], $validation['error_code'] );
        }

        if( $id ){
            $record = $model::find($id);
            if( ! $record ){
                return $this->response_error( 'Record not found', 404 );
            }
        }else {
            $record = null;
        }

        $data = $this->$method( $request, $model, $record );
        return $this->response_data( $data );
    }

    public function get_model_class( $model_name ){
        return 'App\\Models\\' . ucfirst($model_name);
    }

    public function get_model_instance( $model_class ){
        return  $model_class::getModel();
    }

    public function request_validation( $request, $method , $id ){
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
            'update' => [
                'method' => 'PUT',
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
            'auth_register' => [
                'method' => 'POST',
                'id'    => false
            ],
            'auth_login' => [
                'method' => 'POST',
                'id'    => false
            ],
            'auth_logout' => [
                'method' => 'POST',
                'id'    => false
            ],
            'auth_password_reset' => [
                'method' => 'POST',
                'id'    => false
            ],
        ];

        if( ! isset($methods[$method])  ){
            return ['error' => 'Action{'.$request->method().'} not supported', 'error_code' => 404];
        }

        if( $request->method() != $methods[$method]['method'] ){
            return ['error' => 'Request method{'.$request->method().'} not allowed for this action{'.$method.'}', 'error_code' => 404];
        }

        if( $methods[$method]['id'] && ! $id ){
            return ['error' => 'ID is required', 'error_code' => 404];
        }

        if( ! $methods[$method]['id'] && $id ){
            return ['error' => 'ID is not supported for this action{'.$request->method().'}', 'error_code' => 404];
        }
    }

    public function response_data($data)
    {
        return response()->json(
            $data,
            200
        );
    }

    public function response_error($message, $code)
    {
        return response()->json([
            'errors' => [
                $code => [
                    $message
                ]
            ]
        ], $code);
    }
    
    public function list(Request $request, $model, $record ){

        $query = $model->query();

        if (1 > 2) {
            $query->where('user_id', $user_id);
        }
        
        return $query->paginate(10);
    }

    public function fields(Request $request, $model, $record ){

        $fillable_fields = $model->getFillable();
        $table = $model->getTable();
        $fields_with_types = [];

        foreach ($fillable_fields as $field) {
            $fields_with_types[] = [
                'field' => $field,
                'type'  => Schema::getColumnType($table, $field)
            ];
        }

        return $fields_with_types;
    }

    public function add(Request $request, $model, $record ){
        // create the record and return the record data
        return $model->create($request->all());
    }

    public function show(Request $request, $model, $record ){
        return $record->toArray();
    }

    public function update(Request $request, $model, $record ){
        // update the record and return the record data
        $record->update($request->all());
    }

    public function delete(Request $request, $model, $record ){
        // delete the record and return the record data
        $record->delete();
    }

    public function auth_register(Request $request, $model)
    {
        // التحقق من صحة البيانات
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
        ]);
    
        // إنشاء مستخدم جديد
        $user = $model::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => Hash::make($validatedData['password']), // تشفير كلمة المرور
        ]);
    
        // إنشاء token للمستخدم الجديد
        $token = $user->createToken('authToken')->plainTextToken;
    
        // إرجاع معلومات المستخدم و الـ token
        return response()->json([
            'user' => $user,
            'token' => $token,
        ], 201);
    }
    
    public function auth_login(Request $request, $model)
    {
        // التحقق من صحة البيانات
        $validatedData = $request->validate([
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);
    
        // البحث عن المستخدم بواسطة البريد الإلكتروني
        $user = $model::where('email', $validatedData['email'])->first();
    
        // التحقق من وجود المستخدم وتطابق كلمة المرور
        if (!$user || !Hash::check($validatedData['password'], $user->password)) {
            return $this->response_error('Invalid credentials', 401);
        }
    
        // إنشاء token للمستخدم
        $token = $user->createToken('authToken')->plainTextToken;
    
        // إرجاع معلومات المستخدم و الـ token
        return response()->json([
            'user' => $user,
            'token' => $token,
        ], 200);
    }
        public function rules()
    {
        return [];
    }


    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response()->json([
            'errors' => $validator->errors()
        ]));
    }
}