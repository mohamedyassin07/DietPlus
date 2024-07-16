<?php

namespace App\Filament\Resources\SubscriptionStatusResource\Pages;

use App\Filament\Resources\SubscriptionStatusResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSubscriptionStatus extends EditRecord
{
    protected static string $resource = SubscriptionStatusResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
