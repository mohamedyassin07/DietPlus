<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserRestrictionResource\Pages;
use App\Models\UserRestriction;
use Filament\Forms;
use Filament\Tables;
use Filament\Resources\Resource;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;

class UserRestrictionResource extends Resource
{
    protected static ?string $model = UserRestriction::class;

    protected static ?string $navigationIcon = 'heroicon-o-shield-exclamation';
    protected static ?int $navigationSort = 120;
    protected static ?string $navigationParentItem = 'Users';


    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('user_id')
                    ->relationship('user', 'name', function ($query) {
                        return $query->where('user_type', 'customer'); // عرض العملاء فقط
                    })
                    ->required(),
                Forms\Components\Select::make('restriction_id')
                    ->relationship('restriction', 'name')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('user.name')->label('User Name')->sortable()->searchable(),
                TextColumn::make('restriction.name')->label('Restriction Name')->sortable()->searchable(),
            ])
            ->filters([
                SelectFilter::make('user_id')->relationship('user', 'name'),
                SelectFilter::make('restriction_id')->relationship('restriction', 'name'),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListUserRestrictions::route('/'),
            'create' => Pages\CreateUserRestriction::route('/create'),
            'edit' => Pages\EditUserRestriction::route('/{record}/edit'),
        ];
    }
}
