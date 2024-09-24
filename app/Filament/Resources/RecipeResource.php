<?php

namespace App\Filament\Resources;

use App\Filament\Resources\RecipeResource\Pages;
use App\Filament\Resources\RecipeResource\RelationManagers;
use App\Models\Recipe;
use App\Models\Ingredient;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Split;


class RecipeResource extends Resource
{
    protected static ?string $model = Recipe::class;

    protected static ?string $navigationIcon = 'heroicon-o-cake';
    protected static ?int $navigationSort = 8;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Split::make([
                    Section::make([
                        TextInput::make('name')
                            ->columnSpan(6)
                            ->required()
                            ->maxLength(255),
                        TextInput::make('category')
                            ->columnSpan(6)
                            ->required()
                            ->maxLength(255),
                        TextInput::make('calories')
                            ->columnSpan(6)
                            ->readOnly()
                            ->placeholder('Wait For Calculate')
                            ->reactive(),
                        TextInput::make('fats')
                            ->columnSpan(6)
                            ->readOnly()
                            ->placeholder('Wait For Calculate')
                            ->reactive(),
                        TextInput::make('protein')
                            ->columnSpan(6)
                            ->readOnly()
                            ->placeholder('Wait For Calculate')
                            ->reactive(),
                        TextInput::make('carbohydrates')
                            ->columnSpan(6)
                            ->readOnly()
                            ->placeholder('Wait For Calculate')
                            ->reactive(),
                        RichEditor::make('preparation_method')
                            ->toolbarButtons([
                                'attachFiles',
                                //'blockquote',
                                'bold',
                                'bulletList',
                                //'codeBlock',
                                'h2',
                                'h3',
                                //'italic',
                                'link',
                                'orderedList',
                                'redo',
                                //'strike',
                                //'underline',
                                'undo',
                            ])
                            ->required()
                            ->columnSpanFull(),
                        FileUpload::make('image_path')
                            ->columnSpanFull()
                            ->image(),

                    ])->columnSpan(6)
                        ->columns(12),

                    Section::make([

                        Repeater::make('ingredients')
                            ->columns(12)
                            ->defaultItems(4)
                            ->afterStateUpdated(function ($state, Forms\Set $set, Forms\Get $get) {
                                $wait_for_calculate = '';
                                $set('calories', $wait_for_calculate);
                                $set('fats', $wait_for_calculate);
                                $set('protein', $wait_for_calculate);
                                $set('carbohydrates', $wait_for_calculate);

                                $ingredients = $get('ingredients') ?? [];

                                $totalCalories = 0;
                                $totalFats = 0;
                                $totalProtein = 0;
                                $totalCarbohydrates = 0;

                                foreach ($ingredients as $ingredient) {
                                    $ingredientModel = Ingredient::find($ingredient['ingredient_id']);
                                    if ($ingredientModel) {
                                        $quantity = $ingredient['quantity'] ? (int) $ingredient['quantity'] : 0;

                                        $totalCalories += $ingredientModel->calories / $ingredientModel->quantity  * $quantity;
                                        $totalFats += $ingredientModel->fats  / $ingredientModel->quantity * $quantity;
                                        $totalProtein += $ingredientModel->protein  / $ingredientModel->quantity  * $quantity;
                                        $totalCarbohydrates += $ingredientModel->carbohydrates  / $ingredientModel->quantity  * $quantity;
                                    }
                                }
                                if ($totalCalories === 0) {
                                    return;
                                }

                                $set('calories', round($totalCalories, 2));
                                $set('fats', round($totalFats, 2));
                                $set('protein', round($totalProtein, 2));
                                $set('carbohydrates', round($totalCarbohydrates, 2));
                            })
                            ->schema([
                                TextInput::make('quantity')
                                    ->label('Quantity')
                                    ->numeric()
                                    ->required()
                                    ->reactive()
                                    ->columnSpan(3),
                                Select::make('ingredient_id')
                                    ->label('Ingredient')
                                    ->searchable()
                                    ->columnSpan(9)
                                    ->options(function () {
                                        return Ingredient::with('unit')->get()->mapWithKeys(function ($ingredient) {
                                            return [$ingredient->id => "{$ingredient->unit->name} من {$ingredient->name}"];
                                        });
                                    })
                                    ->reactive()
                                    ->required()
                            ])
                            ->label('Ingredients')
                            ->required(),
                    ]),
                ])
                    ->columns(12)
                    ->columnSpanFull(),
            ]);
    }



    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('category'),
                Tables\Columns\TextColumn::make('calories')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('fats')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('protein')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('carbohydrates')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\ImageColumn::make('image_path'),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
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
            'index' => Pages\ListRecipes::route('/'),
            'create' => Pages\CreateRecipe::route('/create'),
            'edit' => Pages\EditRecipe::route('/{record}/edit'),
        ];
    }
}
