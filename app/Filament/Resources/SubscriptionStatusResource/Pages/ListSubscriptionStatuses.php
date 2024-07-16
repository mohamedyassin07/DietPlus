<?php

namespace App\Filament\Resources\SubscriptionStatusResource\Pages;

use App\Filament\Resources\SubscriptionStatusResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSubscriptionStatuses extends ListRecords
{
    protected static string $resource = SubscriptionStatusResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
