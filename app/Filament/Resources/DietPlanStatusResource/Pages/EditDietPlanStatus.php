<?php

namespace App\Filament\Resources\DietPlanStatusResource\Pages;

use App\Filament\Resources\DietPlanStatusResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditDietPlanStatus extends EditRecord
{
    protected static string $resource = DietPlanStatusResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
