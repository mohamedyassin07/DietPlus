<?php

namespace App\Services;

class ErrorResponse
{
    public $errors = [];

    public static function add_error($errorKey)
    {
        return self::$errors[$errorKey] ?? [
            'code' => 500,
            'message' => 'Unknown error'
        ];
    }
}
