<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SubscriptionResource\Pages;
use App\Models\Subscription;
use Filament\Forms;
use Filament\Tables;
use Filament\Resources\Resource;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\DatePicker;
use Filament\Tables\Filters\TrashedFilter;

class SubscriptionResource extends Resource
{
    protected static ?string $model = Subscription::class;

    protected static ?string $navigationIcon = 'heroicon-o-receipt-refund';
    protected static ?int $navigationSort = 25;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Select::make('user_id')
                    ->relationship('user', 'name', fn ($query) => $query->where('user_type', 'customer'))
                    ->required(),
                Select::make('package_id')
                    ->relationship('package', 'name')
                    ->required(),
                Select::make('payment_id')
                    ->label('Payment')
                    ->options(function () {
                        return \App\Models\Payment::where('status', 'completed')
                            ->get()
                            ->pluck('customLabel', 'id');
                    })
                    ->nullable(),
                Select::make('diet_plan_id')
                    ->relationship('dietPlan', 'label', fn ($query) => $query)
                    ->getOptionLabelFromRecordUsing(fn ($record) => ($record->user ? "{$record->user->name}" : 'DELETED USER') . " - {$record->deadline}")
                    ->nullable(),
                Select::make('status_id')
                    ->relationship('status', 'name')
                    ->required(),
                DatePicker::make('deadline')
                    ->nullable(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('user.name')->label('User Name')->sortable()->searchable(),
                TextColumn::make('package.name')->label('Package Name')->sortable()->searchable(),
                TextColumn::make('payment.custom_label')->label('Payment')->sortable(),
                TextColumn::make('status.name')->label('Status')->sortable()->searchable(),
                TextColumn::make('deadline')->label('Deadline')->date(),
            ])
            ->filters([
                TrashedFilter::make(),
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
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSubscriptions::route('/'),
            'create' => Pages\CreateSubscription::route('/create'),
            'edit' => Pages\EditSubscription::route('/{record}/edit'),
        ];
    }
}
