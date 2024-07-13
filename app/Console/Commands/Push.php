<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Console\Commands\Traits\GitTrait;

class Push extends Command
{
    use GitTrait;

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'push {commit}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Backup the database, commit changes to Git, and push to the repository';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        // Check and set commit argument
        $this->checkCommit();

        // Perform database backup
        $this->backupDatabase();

        // Perform Git commit
        $this->gitCommit();

        // Perform Git push
        $this->gitPush();

        $this->info('Push completed successfully');
    }
}
