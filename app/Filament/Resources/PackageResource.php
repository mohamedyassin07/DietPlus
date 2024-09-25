<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PackageResource\Pages;
use App\Models\Package;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\DeleteBulkAction;

class PackageResource extends Resource
{
    protected static ?string $model = Package::class;
    protected static ?string $navigationIcon = 'heroicon-o-folder';
    protected static ?string $navigationParentItem = 'Subscriptions';
    protected static ?int $navigationSort = 410;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('price')
                    ->numeric()
                    ->required(),
                Forms\Components\TextInput::make('duration_in_days')
                    ->numeric()
                    ->required(),
                Forms\Components\TextInput::make('duration_as_string')
                    ->maxLength(50),
                Forms\Components\TextInput::make('sale_price')
                    ->numeric()
                    ->nullable(),
                Forms\Components\DatePicker::make('sale_price_deadline')
                    ->label('Sale Price Deadline')
                    ->nullable()
                    ->visible(fn ($get) => $get('sale_price') !== null),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')->sortable()->searchable(),
                TextColumn::make('price')->sortable()->searchable(),
                TextColumn::make('duration_in_days')->sortable()->searchable(),
                TextColumn::make('duration_as_string')->sortable()->searchable(),
                TextColumn::make('sale_price')->sortable()->searchable(),
                TextColumn::make('sale_price_deadline')->sortable()->searchable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                EditAction::make(),
            ])
            ->bulkActions([
                DeleteBulkAction::make(),
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
            'index' => Pages\ListPackages::route('/'),
            'create' => Pages\CreatePackage::route('/create'),
            'edit' => Pages\EditPackage::route('/{record}/edit'),
        ];
    }
}
