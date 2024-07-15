<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserQuizResource\Pages;
use App\Models\UserQuiz;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Components\Builder;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Builder\Block;
use Filament\Resources\Form;
use Filament\Resources\Resource;
use Filament\Resources\Table;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Actions\EditAction;
use Filament\Tables\Actions\DeleteAction;

class UserQuizResource extends Resource
{
    protected static ?string $model = UserQuiz::class;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';

    // Set the order of the resource in the navigation
    protected static ?int $navigationSort = 2;

    public static function form(Forms\Form $form): Forms\Form
    {
        return $form
            ->schema([
                Select::make('user_id')
                    ->label('User')
                    ->relationship('user', 'name')
                    ->options(function () {
                        return User::where('user_type', 'customer')->pluck('name', 'id');
                    })
                    ->columnSpanFull()
                    ->required(),
                Builder::make('quiz_data')
                    ->label('Quiz Data')
                    ->columnSpanFull()
                    ->minItems(1)
                    ->maxItems(1)
                    ->schema([
                        Block::make('template_1')
                            ->schema([
                                TextInput::make('birth_year')->label('Birth Year'),
                                TextInput::make('weight')->label('Weight'),
                                TextInput::make('weight_targeted')->label('Weight Targeted'),
                                TextInput::make('height')->label('Height'),
                                TextInput::make('sex')->label('Sex'),
                                TextInput::make('health_status')->label('Health Status'),
                                TextInput::make('physical_activity')->label('Physical Activity'),
                                TextInput::make('eating_habits')->label('Eating Habits'),
                                TextInput::make('nutritional_goals')->label('Nutritional Goals'),
                                TextInput::make('psychological_state')->label('Psychological State'),
                            ]),
                        Block::make('template_2')
                            ->schema([
                                TextInput::make('birth_year')->label('Birth Year'),
                                TextInput::make('weight')->label('Weight'),
                                TextInput::make('weight_targeted')->label('Weight Targeted'),
                                TextInput::make('height')->label('Height'),
                                TextInput::make('sex')->label('Sex'),
                                TextInput::make('health_status')->label('Health Status'),
                                TextInput::make('physical_activity')->label('Physical Activity'),
                                TextInput::make('eating_habits')->label('Eating Habits'),
                                TextInput::make('nutritional_goals')->label('Nutritional Goals'),
                                TextInput::make('psychological_state')->label('Psychological State'),
                            ]),
                    ]),
            ]);
    }

    public static function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                TextColumn::make('user.name')
                    ->label('User')
                    ->sortable()
                    ->searchable(),
                TextColumn::make('quiz_data')
                    ->label('Template')
                    ->getStateUsing(function (UserQuiz $record) {
                        $quizData = $record->quiz_data;
                        return is_array($quizData) && count($quizData) > 0 ? $quizData[0]['type'] : 'N/A';
                    }),
                TextColumn::make('created_at')
                    ->label('Created At')
                    ->sortable(),
            ])
            ->filters([
                SelectFilter::make('user_id')
                    ->relationship('user', 'name')
                    ->label('User'),
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
            'index' => Pages\ListUserQuizzes::route('/'),
            'create' => Pages\CreateUserQuiz::route('/create'),
            'edit' => Pages\EditUserQuiz::route('/{record}/edit'),
        ];
    }
}
