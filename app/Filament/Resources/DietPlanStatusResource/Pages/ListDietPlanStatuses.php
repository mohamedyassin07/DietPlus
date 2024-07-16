<?php

namespace App\Filament\Resources\DietPlanStatusResource\Pages;

use App\Filament\Resources\DietPlanStatusResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListDietPlanStatuses extends ListRecords
{
    protected static string $resource = DietPlanStatusResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
