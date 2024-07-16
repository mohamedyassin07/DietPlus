<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PaymentResource\Pages;
use App\Models\Payment;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\DatePicker;

class PaymentResource extends Resource
{
    protected static ?string $model = Payment::class;

    protected static ?string $navigationIcon = 'heroicon-o-currency-dollar';
    protected static ?int $navigationSort = 5;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('user_id')
                    ->relationship('user', 'name', fn ($query) => $query->where('user_type', 'customer'))
                    ->required(),
                TextInput::make('amount')
                    ->required()
                    ->numeric(),
                Select::make('method')
                    ->options([
                        'stripe' => 'Stripe',
                        'paypal' => 'PayPal',
                        'bank_transfer' => 'Bank Transfer',
                        'offline' => 'Offline',
                    ])
                    ->required(),
                Select::make('status')
                    ->options([
                        'pending' => 'Pending',
                        'completed' => 'Completed',
                        'failed' => 'Failed',
                        'refunded' => 'Refunded',
                    ])
                    ->required(),
                Hidden::make('currency')
                    ->default('DEFAULT'),
                DatePicker::make('date')
                    ->required()
                    ->label('Date'), // خانة التاريخ
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')->sortable(),
                TextColumn::make('user.name')->label('User Name')->sortable()->searchable(),
                TextColumn::make('amount')->sortable(),
                TextColumn::make('method')->sortable(),
                TextColumn::make('status')->sortable(),
                TextColumn::make('date')->label('Date')->dateTime()->sortable(),
            ])
            ->filters([
                SelectFilter::make('method')
                    ->options([
                        'stripe' => 'Stripe',
                        'paypal' => 'PayPal',
                        'bank_transfer' => 'Bank Transfer',
                        'offline' => 'Offline',
                    ]),
                SelectFilter::make('status')
                    ->options([
                        'pending' => 'Pending',
                        'completed' => 'Completed',
                        'failed' => 'Failed',
                        'refunded' => 'Refunded',
                    ]),
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
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPayments::route('/'),
            'create' => Pages\CreatePayment::route('/create'),
            'edit' => Pages\EditPayment::route('/{record}/edit'),
        ];
    }
}
