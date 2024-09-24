<?php

namespace App\Filament\Resources;

use App\Filament\Resources\FoodRestrictionResource\Pages;
use App\Filament\Resources\FoodRestrictionResource\RelationManagers;
use App\Models\FoodRestriction;
use Filament\Forms;
use Filament\Tables;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Select;

class FoodRestrictionResource extends Resource
{
    protected static ?string $model = FoodRestriction::class;

    protected static ?string $navigationIcon = 'heroicon-o-shield-exclamation';
    protected static ?int $navigationSort = 35;
    protected static ?string $navigationGroup = 'Plans';


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('name')
                    ->required()
                    ->maxLength(255),
                Select::make('level')
                    ->options([
                        'low' => 'Low',
                        'medium' => 'Medium',
                        'high' => 'High',
                    ])
                    ->required(),
                Textarea::make('description')
                    ->maxLength(255)
                    ->columnSpan('full')
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('name')->sortable()->searchable(),
                TextColumn::make('level')->sortable()->searchable(),
            ])
            ->filters([

            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListFoodRestrictions::route('/'),
            'create' => Pages\CreateFoodRestriction::route('/create'),
            'edit' => Pages\EditFoodRestriction::route('/{record}/edit'),
        ];
    }
}
