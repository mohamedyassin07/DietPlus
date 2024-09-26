<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserQuizResource\Pages;
use App\Models\UserQuiz;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Components\Builder;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Radio;
use Filament\Forms\Components\Checkbox;
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
    protected static ?string $navigationParentItem = 'Users';
    protected static ?int $navigationSort = 130;

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
                        Block::make('keto')
                            ->columns(2)
                            ->schema([
                                DateTimePicker::make('date')
                                    ->label('التاريخ')
                                    ->default(now()),
                                TextInput::make('birth_year')
                                    ->label('ما هو عام ميلادك؟')
                                    ->numeric()
                                    ->required()
                                    ->minValue(1930)
                                    ->maxValue(2020),
                                TextInput::make('weight')
                                    ->label('ما هو وزنك الحالي؟')
                                    ->numeric()
                                    ->minValue(25)
                                    ->maxValue(300),

                                TextInput::make('weight_targeted')
                                    ->label('ما هو الوزن المستهدف؟')
                                    ->numeric()
                                    ->minValue(25)
                                    ->maxValue(300),

                                TextInput::make('height')
                                    ->label('ما هو طولك ؟؟')
                                    ->numeric()
                                    ->required()
                                    ->minValue(90)
                                    ->maxValue(200),
                                Select::make('sex')
                                    ->label('ما هو جنسك؟')
                                    ->required()
                                    ->options([
                                        'male' => 'ذكر',
                                        'female' => 'أنثى',
                                    ]),
                                Select::make('diet_goal')
                                    ->label('ما هو هدفك الأساسي من الدايت؟')
                                    ->options([
                                        'lose_weight' => 'خسارة الوزن',
                                        'fit_body' => 'جسم رشيق',
                                        'healthy_habits' => 'تبني عادات صحية',
                                    ]),
                                Select::make('eating_habits')
                                    ->label('ما هو أفضل وصف لعاداتك الغذائية؟')
                                    ->options([
                                        'needs_improvement' => 'يحتاج نظامي الغذائي إلى تحسين',
                                        'some_healthy_habits' => 'لدي بعض العادات الصحية',
                                        'mostly_healthy' => 'أنا أتناول طعام صحي في أغلب الأوقات',
                                    ]),
                                Select::make('daily_routine')
                                    ->label('كيف يكون يومك المعتاد؟')
                                    ->options([
                                        'office' => 'في المكتب',
                                        'mostly_home' => 'أغلب الأوقات في المنزل',
                                        'long_walks' => 'المشي لمسافات طويلة',
                                        'physical_work' => 'عمل بدني شاق',
                                    ]),
                                Select::make('physical_activity')
                                    ->label('ما مدى نشاطك البدني؟')
                                    ->required()
                                    ->options([
                                        'sedentary' => 'لا أمارس أي نشاط بدني',
                                        'lightly_active' => 'تمارين خفيفة (1-2 يوم/ بالأسبوع)',
                                        'moderately_active' => 'تمارين متوسطة (3-5 أيام/ بالأسبوع)',
                                        'very_active' => 'تمارين شاقة (6-7 أيام/ بالأسبوع)',
                                    ]),
                                Select::make('sleep_hours')
                                    ->label('كم عدد ساعات نومك المعتادة؟')
                                    ->options([
                                        'less_than_5' => 'أقل من 5 ساعات',
                                        '5_to_6' => '6-5 ساعات',
                                        '7_to_8' => '8-7 ساعات',
                                        'more_than_8' => 'أكثر من 8 ساعات',
                                    ]),
                                Select::make('water_intake')
                                    ->label('كم تشربين من الماء يوميًا؟')
                                    ->options([
                                        'only_coffee_tea' => 'فقط القهوة والشاي',
                                        'less_than_2_cups' => 'أقل من كوبين',
                                        '2_to_6_cups' => '6-2 أكواب',
                                        'more_than_6_cups' => 'أكثر من 6 أكواب',
                                    ]),
                                Select::make('health_conditions')
                                    ->label('هل ينطبق عليك أي مما يلي؟')
                                    ->multiple()
                                    ->options([
                                        'pcos' => 'متلازمة تكيس المبايض',
                                        'metabolic_disorders' => 'اضطرابات التمثيل الغذائي',
                                        'cancer' => 'السرطان',
                                        'kidney_disease' => 'أمراض الكلى أو مشاكلها',
                                        'liver_gallbladder_disease' => 'أمراض الكبد والمرارة أو مشاكلها',
                                        'pancreas_disease' => 'أمراض أو مشاكل البنكرياس',
                                        'thyroid_issues' => 'مشاكل الغدة الدرقية',
                                        'digestive_disorders' => 'اضطرابات الجهاز الهضمي',
                                        'pregnant_breastfeeding' => 'حامل أو أقوم بالرضاعة الطبيعية',
                                        'diabetes_type_1' => 'مرض السكري من النوع الأول',
                                        'eating_disorders' => 'اضطرابات غذائية',
                                        'vegan' => 'النباتيين',
                                        'diabetes_type_2' => 'مرض السكري من النوع الثاني',
                                        'heart_disease_stroke' => 'أمراض القلب والسكتة الدماغية',
                                        'other' => 'مشاكل أخرى',
                                        'none' => 'لا شيء مما سبق',
                                    ])
                                    ->afterStateUpdated(function ($state, callable $set) {
                                        // Check if any selected condition matches the critical health conditions
                                        $criticalConditions = [
                                            'pcos',
                                            'metabolic_disorders',
                                            'cancer',
                                            'kidney_disease',
                                            'liver_gallbladder_disease',
                                            'pancreas_disease',
                                            'thyroid_issues',
                                            'digestive_disorders',
                                            'pregnant_breastfeeding',
                                            'diabetes_type_1',
                                            'eating_disorders',
                                            'vegan',
                                            'diabetes_type_2',
                                            'heart_disease_stroke'
                                        ];

                                        if (array_intersect($state ?? [], $criticalConditions)) {
                                            $set('exit_message', 'عذًرا، نظام الكيتو لا يتوافق مع حالتك الصحية، سنقوم بتطوير أنظمة غذائية تتناسب مع حالتك الصحية في المستقبل القريب. يمكنك مراسلتنا ومتابعتنا على مواقع التواصل الاجتماعي للاستفادة من النصائح والمعلومات التغذوية والصحية الشيقة. نتمنى لك دوام الصحة والعافية.');
                                        } else {
                                            $set('exit_message', null);
                                        }
                                    }),
                                TextInput::make('exit_message')
                                    ->columnSpan(2)
                                    ->label('رسالة الخروج')
                                    ->visible(fn($get) => $get('exit_message'))
                                    ->disabled(),
                                Select::make('food_allergies')
                                    ->label('هل لديك حساسية تجاه هذه الأطعمة؟')
                                    ->multiple()
                                    ->options([
                                        'egg' => 'البيض',
                                        'fish' => 'السمك',
                                        'shrimp' => 'الجمبري',
                                        'cow_milk' => 'حليب الأبقار',
                                        'peanut' => 'الفول السوداني',
                                        'nuts' => 'المكسرات',
                                        'wheat' => 'القمح',
                                        'gluten' => 'الغلوتين',
                                        'none' => 'لا شيء مما سبق',
                                    ]),
                                Select::make('meats')
                                    ->label('اللحوم')
                                    ->options([
                                        'poultry' => 'دواجن',
                                        'beef' => 'لحم البقر',
                                        'lamb' => 'لحم الضأن',
                                        'veal' => 'لحم العجل',
                                        'fish' => 'الأسماك',
                                        'seafood' => 'المأكولات البحرية',
                                        'turkey' => 'تيركي',
                                    ])
                                    ->multiple()
                                    ->minItems(3),
                                Select::make('vegetables')
                                    ->label('الخضار')
                                    ->options([
                                        'green_vegetables' => 'الخضار الخضراء',
                                        'broccoli' => 'بروكولي',
                                        'mushroom' => 'مشروم',
                                        'eggplant' => 'باذنجان',
                                        'tomato' => 'بندورة',
                                        'spinach' => 'سبانخ',
                                        'cabbage' => 'ملفوف',
                                        'cauliflower' => 'قرنبيط',
                                        'zucchini' => 'كوسا',
                                    ])
                                    ->multiple()
                                    ->minItems(7),
                                Select::make('other_foods')
                                    ->label('أطعمة أخرى')
                                    ->options([
                                        'egg' => 'بيض',
                                        'cheese' => 'أجبان',
                                        'olive' => 'زيتون',
                                        'coconut' => 'جوز هند',
                                        'milk' => 'حليب',
                                        'yogurt' => 'زبادي',
                                        'avocado' => 'أفوكادو',
                                        'nuts_seeds' => 'مكسرات وبذور',
                                        'peanut_butter' => 'زبدة الفول السوداني',
                                        'almond_butter' => 'زبدة اللوز',
                                        'pistachio_butter' => 'زبدة الفستق',
                                    ])
                                    ->multiple()
                                    ->minItems(6),
                                Select::make('weight_gain_factors')
                                    ->label('هل أدت أي من الأحداث الحياتية التالية إلى زيادة وزنك في السنوات القليلة الماضية؟')
                                    ->options([
                                        'marriage' => 'الزواج',
                                        'pregnancy_childbirth' => 'الحمل والولادة',
                                        'work_lifestyle' => 'طبيعة العمل أو نمط حياة العائلة',
                                        'financial_issues' => 'مشاكل مالية',
                                        'injury_disability' => 'إصابة أو إعاقة',
                                        'stress_psychological' => 'الضغوطات أو المشاكل النفسية',
                                        'post_treatment_medication' => 'مضاعفات ما بعد العلاج أو تناول الأدوية',
                                        'none' => 'لا شيء مما سبق',
                                    ]),
                                Select::make('weight_loss_motivation')
                                    ->label('ما هو الدافع لديك لإنقاص وزنك؟')
                                    ->options([
                                        'curiosity' => 'لدي فضول لتجربة حمية الكيتو',
                                        'determined_to_lose_weight' => 'أنا مصممة على خسارة جزء من وزني',
                                        'won’t_stop_till_goal' => 'لن أتوقف حتى أحقق وزني الذي أسعى للوصول إليه',
                                    ]),
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
