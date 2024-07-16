<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DietPlanResource\Pages;
use App\Models\DietPlan;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Grid;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables;
use App\Models\User;
use App\Models\Food;

class DietPlanResource extends Resource
{
    protected static ?string $model = DietPlan::class;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?int $navigationSort = 10;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Grid::make(3)->schema([
                    Select::make('user_id')
                        ->label('Customer')
                        //->relationship('user', 'name')
                        ->options(User::where('user_type', 'customer')->pluck('name', 'id'))
                        ->required()
                        ->columnSpan(1),
                    Select::make('status_id')
                        //->relationship('status', 'name')
                        ->options(User::where('user_type', 'customer')->pluck('name', 'id'))
                        ->required()
                        ->columnSpan(1),
                    DatePicker::make('deadline')
                        ->columnSpan(1),
                ]),
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
                                        ->relationship('food', 'name')
                                        ->options(Food::pluck('name', 'id'))
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
                                        ->relationship('food', 'name')
                                        ->options(Food::pluck('name', 'id'))
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
                                        ->relationship('food', 'name')
                                        ->options(Food::pluck('name', 'id'))
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
                                        ->relationship('food', 'name')
                                        ->options(Food::pluck('name', 'id'))
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
                                        ->relationship('food', 'name')
                                        ->options(Food::pluck('name', 'id'))
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
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('user.name')->sortable()->searchable()->label('User Name'),
                TextColumn::make('status.name')->sortable()->searchable()->label('Status'),
                TextColumn::make('deadline')->date()->sortable(),
            ])
            ->filters([
                TrashedFilter::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
                Tables\Actions\ForceDeleteAction::make(),
                Tables\Actions\RestoreAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
                Tables\Actions\ForceDeleteBulkAction::make(),
                Tables\Actions\RestoreBulkAction::make(),
            ]);
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
