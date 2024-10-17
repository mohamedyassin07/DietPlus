<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PasswordResetTokenResource\Pages;
use App\Filament\Resources\PasswordResetTokenResource\RelationManagers;
use App\Models\PasswordResetToken;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DateTimePicker;


class PasswordResetTokenResource extends Resource
{

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $model = PasswordResetToken::class;
    protected static ?string $navigationLabel = 'Password Reset Tokens';
    protected static ?string $navigationParentItem = 'Users';
    protected static ?int $navigationSort = 140;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('email')
                    ->label('Email')
                    ->required()
                    ->email()
                    ->unique('password_reset_tokens', 'email'),
                TextInput::make('token')
                    ->label('Token')
                    ->required(),
                DateTimePicker::make('created_at')
                    ->label('Created At')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('email')->label('Email'),
                Tables\Columns\TextColumn::make('token')->label('Token'),
                Tables\Columns\TextColumn::make('created_at')->label('Created At'),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
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
            'index' => Pages\ListPasswordResetTokens::route('/'),
            'create' => Pages\CreatePasswordResetToken::route('/create'),
        ];
    }
}
