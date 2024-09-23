<?php

namespace App\Filament\Resources;

use App\Filament\Resources\IngredientResource\Pages;
use App\Filament\Resources\IngredientResource\RelationManagers;
use App\Models\Ingredient;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Fieldset;
use Filament\Tables\Columns\TextInputColumn;




class IngredientResource extends Resource
{
    protected static ?string $model = Ingredient::class;

    protected static ?string $navigationIcon = 'heroicon-o-cube';
    protected static ?int $navigationSort = 7;


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('name')
                    ->label('Ingredient Name')
                    ->required()
                    ->columnSpan(4),
                Select::make('unit_id')
                    ->label('Unit')
                    ->relationship('unit', 'name')
                    ->required()
                    ->columnSpan(4),
                TextInput::make('quantity')
                    ->numeric()
                    ->required()
                    ->columnSpan(4),
                Fieldset::make('Label')
                    ->columns(12)
                    ->label('Every Unit Contains')
                    ->schema([
                        TextInput::make('calories')
                            ->numeric()
                            ->default(0)
                            ->required()
                            ->columnSpan(3),
                        TextInput::make('fats')
                            ->numeric()
                            ->default(0)
                            ->required()
                            ->columnSpan(3),
                        TextInput::make('protein')
                            ->numeric()
                            ->default(0)
                            ->required()
                            ->columnSpan(3),
                        TextInput::make('carbohydrates')
                            ->numeric()
                            ->default(0)
                            ->required()
                            ->columnSpan(3),
                    ])
            ]
        )->columns(12);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')->label('Ingredient Name'),
                TextColumn::make('unit.name')->label('Unit'),
                TextColumn::make('calories'),
                TextColumn::make('fats'),
                TextColumn::make('carbohydrates'),
                TextColumn::make('protein'),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListIngredients::route('/'),
            'create' => Pages\CreateIngredient::route('/create'),
            'edit' => Pages\EditIngredient::route('/{record}/edit'),
        ];
    }
}
