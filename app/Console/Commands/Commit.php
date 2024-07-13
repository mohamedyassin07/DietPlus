<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Console\Commands\Traits\GitTrait;

class Commit extends Command
{
    use GitTrait;

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'commit {commit}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Backup the database and commit changes to Git';

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

        $this->info('Commit completed successfully');
    }
}
