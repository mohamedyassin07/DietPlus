<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Models\User;
use Filament\Forms;
use Filament\Tables;
use Filament\Resources\Resource;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\DateTimePicker;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\DeleteAction;
use Illuminate\Support\Facades\Hash;
use Illuminate\Database\Eloquent\Builder;

class UserResource extends Resource
{
    protected static ?string $model = User::class;

    protected static ?string $navigationIcon = 'heroicon-o-user';

    public static function form(Forms\Form $form): Forms\Form
    {
        return $form
            ->schema([
                TextInput::make('name')->required(),
                Select::make('user_type')
                    ->options([
                        'Admin' => 'Admin',
                        'Employee' => 'Employee',
                        'Customer' => 'Customer',
                    ])->required(),
                TextInput::make('email')->email()->required(),
                TextInput::make('password')
                    ->password()
                    ->dehydrateStateUsing(fn ($state) => Hash::make($state))
                    ->dehydrated(fn ($state) => filled($state)),
                DateTimePicker::make('email_verified_at')
                    ->label('Email Verified At'),
                FileUpload::make('image')
                    ->avatar(),
            ]);
    }

    public static function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('name')->sortable()->searchable(),
                TextColumn::make('email')->sortable()->searchable(),
                TextColumn::make('user_type')->sortable(),
                ImageColumn::make('image')->label('Avatar'),
                TextColumn::make('email_verified_at')->dateTime()->label('Email Verified At'),
            ])
            ->filters([
                Filter::make('user_roles')
                    ->label('User Roles')
                    ->form([
                        Select::make('roles')
                            ->multiple()
                            ->options([
                                'Admin' => 'Admin',
                                'Employee' => 'Employee',
                                'Customer' => 'Customer',
                            ]),
                    ])
                    ->query(function (Builder $query, array $data) {
                        if (empty($data['roles'])) {
                            return;
                        }

                        $query->where(function ($query) use ($data) {
                            foreach ($data['roles'] as $role) {
                                $query->orWhere('user_type', $role);
                            }
                        });
                    }),
            ])
            ->actions([
                EditAction::make(),
                DeleteAction::make(),
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
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
