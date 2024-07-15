<?php

namespace App\Filament\Resources\UserQuizResource\Pages;

use App\Filament\Resources\UserQuizResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateUserQuiz extends CreateRecord
{
    protected static string $resource = UserQuizResource::class;
}
