<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Console\Commands\Traits\GitTrait;
use Illuminate\Support\Facades\File;


class Restore extends Command
{
    use GitTrait;

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'restore {commit}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Restore the files to a specific Git commit and import the database from a backup';

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

        // 1. Force checkout the specified commit, ignoring any local changes
        $result = null;
        $output = null;
        exec("git checkout -f {$this->commit}", $output, $result);
        if ($result !== 0) {
            $this->error('Failed to checkout the specified commit.');
            die;
        }

        // 2. Find the latest backup file
        $backupDir = storage_path('backups');
        $files = glob($backupDir . '/*.sql');
        if (empty($files)) {
            $this->error('No backup files found.');
            die;
        }
        usort($files, function ($a, $b) {
            return filemtime($b) - filemtime($a);
        });
        $latestBackup = $files[0];

        // 3. Copy the latest backup to the temporary directory
        $temporaryBackupDir = $backupDir . '/backups_temporary';
        if (!is_dir($temporaryBackupDir)) {
            mkdir($temporaryBackupDir, 0775, true);
        }

        $tempSqlPath = $temporaryBackupDir . '/' . basename($latestBackup);
        copy($latestBackup, $tempSqlPath);

        // Check file permissions
        if (!is_readable($tempSqlPath)) {
            $this->error('Backup file is not readable.');
            die;
        }

        if (!is_writable($temporaryBackupDir)) {
            $this->error('Backup directory is not writable.');
            die;
        }

        // 4. Import the SQL file into the database
        if (!$this->importDatabase($tempSqlPath)) {
            die;
        }

        // 5. Delete the temporary SQL file
        if (file_exists($tempSqlPath)) {
            unlink($tempSqlPath);
        }

        // 6. Delete the temporary directory
        if (File::isDirectory($temporaryBackupDir)) {
            File::deleteDirectory($temporaryBackupDir);
        }

        $this->info('Restored successfully');
    }
}
