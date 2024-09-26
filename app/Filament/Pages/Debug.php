<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\DietPlan;

class Debug extends Page
{
    protected static string $view = 'filament.pages.debug'; 
    protected static ?string $navigationIcon = 'heroicon-o-cog';
    protected static ?int $navigationSort = 1000;
    protected static ?string $navigationGroup = 'Super Admin';


    public function content(){
        $id = isset( $_GET['diet_plan_id'] ) ? (int)trim($_GET['diet_plan_id']) : 3;
        $diet_plan = DietPlan::find($id);

        if( !$diet_plan ){
            dd('Diet Plan not found' );
        }

        $diet_plan->generate();
    }
}