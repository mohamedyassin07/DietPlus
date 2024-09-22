<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DietPlanResource\Pages;
use App\Models\DietPlan;
use App\Models\Food;
use App\Models\User;
use Filament\Forms;
use Filament\Tables;
use Filament\Forms\Form;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Wizard;
use Filament\Forms\Components\Step;
use Filament\Tables\Table;
use Filament\Resources\Resource;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Support\Exceptions\Halt;
use Filament\Forms\Components\Actions\Action;
use Livewire\Component;
use Illuminate\Http\Request;
use Filament\Forms\Components\Builder;
use Filament\Forms\Components\Builder\Block;
use Filament\Forms\Components\Tabs;


class DietPlanResource extends Resource
{
    protected static ?string $model = DietPlan::class;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?int $navigationSort = 10;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Wizard::make([
                    // Step 1: Basic Information
                    Wizard\Step::make('Basic Information')
                        ->columns(3)
                        ->schema([
                                Select::make('user_id')
                                    ->label('User')
                                    ->relationship('user', 'name')
                                    ->options(User::where('user_type', 'Customer')->pluck('name', 'id'))
                                    ->required()
                                    ->columnSpan(1),
                                Select::make('status_id')
                                    ->relationship('status', 'name')
                                    ->required()
                                    ->columnSpan(1),
                                DatePicker::make('deadline')
                                    ->required()
                                    ->columnSpan(1),
                            
                        ]),

                    // Step 2: Meals Schedule
                    Wizard\Step::make('Meals Schedule')
                        ->schema([
                            Builder::make('meals_schedule')
                                ->label(false)
                                ->addActionLabel('Choose Diet Plan')
                                ->maxItems(1)
                                ->blockNumbers(false)
                                ->blocks([
                                    Block::make('Keto')
                                        ->maxItems(1)
                                        ->schema([
                                            Repeater::make('keto_day')
                                                ->addActionLabel('Add Another Day ')
                                                ->label(false)
                                                ->collapsible()
                                                ->cloneable()
                                                ->reorderableWithButtons()
                                                ->minItems(1)
                                                ->required()
                                                ->columnSpan('full')
                                                ->schema([
                                                    DatePicker::make('day_date')
                                                        ->label('Day Date')
                                                        ->live(onBlur: true)
                                                        ->required(),
                                                    Tabs::make('Meals')
                                                        ->tabs([
                                                            self::keto_meal_fields('breakfast', 'Breakfast'),
                                                            self::keto_meal_fields('snack_1', 'Snack 1'),
                                                            self::keto_meal_fields('lunch', 'Lunch'),
                                                            self::keto_meal_fields('snack_2', 'Snack 2'),
                                                            self::keto_meal_fields('dinner', 'Dinner'),
                                                        ])
                                                        ->columnSpan(2)




                                                ])
                                                ->itemLabel(fn(array $state): ?string => $state['day_date'] ?? 'New Day')
                                                ,
                                        ]),
                                ]),
                        ]),


                ])->skippable()
                    ->columnSpan(2)
                    ->persistStepInQueryString()
                    // ->nextAction(
                    //     function (Component $livewire, $record, Action $action) {
                    //         $action->label('GENERATE PLAN')->color('info');
                    //         $data = $livewire->form->getState();
                    //         //dd( $data, $record->deadline, $record->id );



                    //     }
                    // )
                    ,
            ]);
    }

    public static function table(Tables\Table $table): Tables\Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('user.name')
                    ->label('User'),
                Tables\Columns\TextColumn::make('status.name')
                    ->label('Status'),
                Tables\Columns\TextColumn::make('deadline')
                    ->date(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime(),
            ])
            ->filters([
                TrashedFilter::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
                Tables\Actions\ForceDeleteBulkAction::make(),
                Tables\Actions\RestoreBulkAction::make(),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            // Define relations here
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListDietPlans::route('/'),
            'create' => Pages\CreateDietPlan::route('/create'),
            'edit' => Pages\EditDietPlan::route('/{record}/edit'),
        ];
    }

    public static function keto_meal_fields($slug, $name)
    {
        return Tabs\Tab::make($name)
            ->schema([
                Repeater::make($slug)
                    ->label(false)
                    ->addActionLabel('Add to ' .  $name)
                    ->schema([
                        Grid::make(2)->schema([
                            Select::make('food_id')
                                ->label('Food')
                                ->options(Food::pluck('name', 'id')->toArray())
                                //->required()
                                ->columnSpan(1),
                            TextInput::make('quantity')
                                ->label('Quantity')
                                ->numeric()
                                //->required()
                                ->columnSpan(1),
                        ]),
                    ]),
            ]);
    }
}
