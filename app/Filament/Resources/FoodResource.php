<?php

namespace App\Filament\Resources;

use App\Filament\Resources\FoodResource\Pages;
use App\Models\Food;
use Filament\Forms;
use Filament\Tables;
use Filament\Resources\Resource;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;

class FoodResource extends Resource
{
    protected static ?string $model = Food::class;
    protected static ?string $navigationIcon = 'heroicon-o-cake';
    protected static ?int $navigationSort = 8;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),
                Forms\Components\Select::make('category_id')
                    ->relationship('category', 'name')
                    ->nullable(),
                Forms\Components\TextInput::make('unit')
                    ->required()
                    ->maxLength(50),
                Forms\Components\Select::make('restriction_id')
                    ->relationship('restriction', 'name')
                    ->nullable(),
                Forms\Components\TextInput::make('calories')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('fats')
                    ->required()
                    ->numeric(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')->sortable()->searchable(),
                TextColumn::make('category.name')->label('Category')->sortable()->searchable(),
                TextColumn::make('unit')->sortable()->searchable(),
                TextColumn::make('restriction.name')->label('Restriction')->sortable()->searchable(),
                TextColumn::make('calories')->sortable()->searchable(),
                TextColumn::make('fats')->sortable()->searchable(),
            ])
            ->filters([
                SelectFilter::make('category_id')
                    ->relationship('category', 'name')
                    ->label('Category'),
                SelectFilter::make('restriction_id')
                    ->relationship('restriction', 'name')
                    ->label('Restriction'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            // Define any relations here
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListFoods::route('/'),
            'create' => Pages\CreateFood::route('/create'),
            'edit' => Pages\EditFood::route('/{record}/edit'),
        ];
    }
}
