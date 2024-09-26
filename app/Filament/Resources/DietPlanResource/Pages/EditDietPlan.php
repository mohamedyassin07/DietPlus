<?php

namespace App\Filament\Resources\DietPlanResource\Pages;

use App\Filament\Resources\DietPlanResource;
use Filament\Actions\Action;
use Filament\Resources\Pages\EditRecord;
use App\Models\User;
use Filament\Notifications\Notification;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\MarkdownEditor;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Components\Wizard\Step;
use Illuminate\Contracts\View\View;
use Livewire\Component;
use Illuminate\Http\Request;

class EditDietPlan extends EditRecord
{
    protected static string $resource = DietPlanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Action::make('generate_plan')
                ->icon('heroicon-m-clipboard')
                ->label('Generate New Plan')
                ->action(function ( Component $livewire , $record  , Action $action ) {
                    $this->generatePlan( $livewire, $record, $action );
                })
                ->color('info')
                // ->requiresConfirmation()
                // ->modalHeading('Delete the current plan and generate a new one.')
                // ->modalDescription(' ')
                // ->modalSubmitActionLabel('Yes, Generate'),
        ];
    }

    public function generatePlan( $livewire, $record, $action )
    {
        $data = $livewire->form->getState();
        //dd( $data, $record->deadline, $record->id , $action );

        Notification::make()
            ->title( 'Generating new plan...')
            ->body( 'simulate it done')
            ->info()
            ->send();

        //$this->redirect($this->getResource()::getUrl(['edit'], ['record' => $this->record->getKey()]));
    }
}
