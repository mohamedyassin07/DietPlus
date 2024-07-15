<?php

namespace App\Filament\Resources\UserQuizResource\Pages;

use App\Filament\Resources\UserQuizResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditUserQuiz extends EditRecord
{
    protected static string $resource = UserQuizResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
