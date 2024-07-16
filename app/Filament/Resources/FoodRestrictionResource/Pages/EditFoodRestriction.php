<?php

namespace App\Filament\Resources\FoodRestrictionResource\Pages;

use App\Filament\Resources\FoodRestrictionResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditFoodRestriction extends EditRecord
{
    protected static string $resource = FoodRestrictionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
