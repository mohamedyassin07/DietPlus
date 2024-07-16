<?php

namespace App\Filament\Resources\FoodRestrictionResource\Pages;

use App\Filament\Resources\FoodRestrictionResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListFoodRestrictions extends ListRecords
{
    protected static string $resource = FoodRestrictionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
