<?php

namespace App\Filament\Resources\UserQuizResource\Pages;

use App\Filament\Resources\UserQuizResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListUserQuizzes extends ListRecords
{
    protected static string $resource = UserQuizResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
