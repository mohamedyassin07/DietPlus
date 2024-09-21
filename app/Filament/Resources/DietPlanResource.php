<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DietPlanResource\Pages;
use App\Models\DietPlan;
use App\Models\Food;
use App\Models\User;
use Filament\Forms;
use Filament\Tables;
use Filament\Forms\Form;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Wizard;
use Filament\Forms\Components\Step;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Support\Exceptions\Halt;
use Filament\Forms\Components\Actions\Action;
use Livewire\Component;
use Illuminate\Http\Request;


class DietPlanResource extends Resource
{
    protected static ?string $model = DietPlan::class;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?int $navigationSort = 10;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Wizard::make([
                    // Step 1: Basic Information
                    Wizard\Step::make('Basic Information')
                                            ->schema([
                            Grid::make(3)->schema([
                                Select::make('user_id')
                                    ->label('User')
                                    ->relationship('user', 'name')
                                    ->options(User::where('user_type', 'Customer')->pluck('name', 'id'))
                                    ->required()
                                    ->columnSpan(1),
                                Select::make('status_id')
                                    ->relationship('status', 'name')
                                    ->required()
                                    ->columnSpan(1),
                                DatePicker::make('deadline')
                                    ->required()
                                    ->columnSpan(1),
                            ]),
                        ]),

                    // Step 2: Meals Schedule
                    Wizard\Step::make('Meals Schedule')
                
                
                    ->afterValidation(function ( $data1 , $data2 ) {
                        
                        dd( 'after val step 2' );

                        if (true) {
                            throw new Halt();
                        }
                
                    })

                        ->schema([
                            Repeater::make('meals_schedule')
                                ->cloneable()
                                ->reorderableWithButtons()
                                ->schema([
                                    DatePicker::make('day_date')
                                        ->label('Day Date')
                                        ->required(),
                                    Repeater::make('breakfast')
                                        ->label('Breakfast')
                                        ->schema([
                                            Grid::make(2)->schema([
                                                Select::make('food_id')
                                                    ->label('Food')
                                                    ->options(Food::pluck('name', 'id')->toArray())
                                                    ->required()
                                                    ->columnSpan(1),
                                                TextInput::make('quantity')
                                                    ->label('Quantity')
                                                    ->numeric()
                                                    ->required()
                                                    ->columnSpan(1),
                                            ]),
                                        ]),
                                    Repeater::make('snack_1')
                                        ->label('Snack 1')
                                        ->schema([
                                            Grid::make(2)->schema([
                                                Select::make('food_id')
                                                    ->label('Food')
                                                    ->options(Food::pluck('name', 'id')->toArray())
                                                    ->required()
                                                    ->columnSpan(1),
                                                TextInput::make('quantity')
                                                    ->label('Quantity')
                                                    ->numeric()
                                                    ->required()
                                                    ->columnSpan(1),
                                            ]),
                                        ]),
                                    Repeater::make('lunch')
                                        ->label('Lunch')
                                        ->schema([
                                            Grid::make(2)->schema([
                                                Select::make('food_id')
                                                    ->label('Food')
                                                    ->options(Food::pluck('name', 'id')->toArray())
                                                    ->required()
                                                    ->columnSpan(1),
                                                TextInput::make('quantity')
                                                    ->label('Quantity')
                                                    ->numeric()
                                                    ->required()
                                                    ->columnSpan(1),
                                            ]),
                                        ]),
                                    Repeater::make('snack_2')
                                        ->label('Snack 2')
                                        ->schema([
                                            Grid::make(2)->schema([
                                                Select::make('food_id')
                                                    ->label('Food')
                                                    ->options(Food::pluck('name', 'id')->toArray())
                                                    ->required()
                                                    ->columnSpan(1),
                                                TextInput::make('quantity')
                                                    ->label('Quantity')
                                                    ->numeric()
                                                    ->required()
                                                    ->columnSpan(1),
                                            ]),
                                        ]),
                                    Repeater::make('dinner')
                                        ->label('Dinner')
                                        ->schema([
                                            Grid::make(2)->schema([
                                                Select::make('food_id')
                                                    ->label('Food')
                                                    ->options(Food::pluck('name', 'id')->toArray())
                                                    ->required()
                                                    ->columnSpan(1),
                                                TextInput::make('quantity')
                                                    ->label('Quantity')
                                                    ->numeric()
                                                    ->required()
                                                    ->columnSpan(1),
                                            ]),
                                        ]),
                                ])
                                ->minItems(1)
                                ->required()
                                ->columnSpan('full'),
                        ]),
                ])->skippable()
                ->columnSpan(2)
                ->persistStepInQueryString()
                ->nextAction(
                    function (Component $livewire , $record  , Action $action ){
                        $action->label('GENERATE PLAN')->color('info');
                        //$data = $livewire->form->getState();
                        //dd( $data, $record->deadline, $record->id );



                    }
                )
,
            ]);
    }

    public static function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('user.name')
                    ->label('User'),
                Tables\Columns\TextColumn::make('status.name')
                    ->label('Status'),
                Tables\Columns\TextColumn::make('deadline')
                    ->date(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime(),
            ])
            ->filters([
                TrashedFilter::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
                Tables\Actions\ForceDeleteBulkAction::make(),
                Tables\Actions\RestoreBulkAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            // Define relations here
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListDietPlans::route('/'),
            'create' => Pages\CreateDietPlan::route('/create'),
            'edit' => Pages\EditDietPlan::route('/{record}/edit'),
        ];
    }
}