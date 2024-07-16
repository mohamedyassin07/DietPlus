<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserPreferenceResource\Pages;
use App\Models\UserPreference;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\Select;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\DeleteAction;
use Filament\Tables\Actions\BulkAction;
use Illuminate\Support\Collection;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserPreferenceResource extends Resource
{
    protected static ?string $model = UserPreference::class;

    protected static ?string $navigationIcon = 'heroicon-o-heart';
    protected static ?int $navigationSort = 12;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('user_id')
                    ->relationship('user', 'name', fn ($query) => $query->where('user_type', 'customer'))
                    ->required(),
                Select::make('food_id')
                    ->relationship('food', 'name')
                    ->required(),
                Select::make('preference_level')
                    ->options([
                        '1' => '1',
                        '2' => '2',
                        '3' => '3',
                        '4' => '4',
                        '5' => '5',
                    ])
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('user.name')->label('User Name'),
                TextColumn::make('food.name')->label('Food Name'),
                TextColumn::make('preference_level')->label('Preference Level'),
            ])
            ->filters([
                SelectFilter::make('user_id')
                    ->relationship('user', 'name')
                    ->label('User'),
                SelectFilter::make('food_id')
                    ->relationship('food', 'name')
                    ->label('Food'),
                SelectFilter::make('preference_level')
                    ->options([
                        '1' => '1',
                        '2' => '2',
                        '3' => '3',
                        '4' => '4',
                        '5' => '5',
                    ])
                    ->label('Preference Level'),
            ])
            ->actions([
                EditAction::make(),
                DeleteAction::make()->action(function ($record) {
                    $record->delete();
                }),
            ])
            ->bulkActions([
                BulkAction::make('delete')
                    ->action(function (Collection $records) {
                        $records->each->delete();
                    }),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListUserPreferences::route('/'),
            'create' => Pages\CreateUserPreference::route('/create'),
            'edit' => Pages\EditUserPreference::route('/{record}/edit'),
        ];
    }
}
