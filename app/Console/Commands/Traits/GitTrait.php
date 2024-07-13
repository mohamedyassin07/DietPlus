<?php

namespace App\Console\Commands\Traits;

trait GitTrait
{
    protected $commit;

    protected function checkCommit()
    {
        $this->commit = $this->argument('commit') ? $this->argument('commit') : false;
        if (!$this->commit) {
            $this->error('No commit specified.');
            die();
        }
    }

    protected function backupDatabase()
    {
        $dbName = env('DB_DATABASE');
        $dbUser = env('DB_USERNAME');
        $dbPass = env('DB_PASSWORD');
        $dbHost = env('DB_HOST');

        // Set the timezone to UTC and add 3 hours
        $datetime = new \DateTime('now', new \DateTimeZone('UTC'));
        $datetime->modify('+3 hours');
        $timestamp = $datetime->format('H-i-s__d-m-y');

        // Create the backup directory structure
        $backupDir = storage_path('backups');
        if (!is_dir($backupDir)) {
            mkdir($backupDir, 0775, true);
        }
        $backupPath = $backupDir . '/' . $this->commit . '__' . $timestamp . '.sql';

        // 1. Create the SQL backup file
        $command = "mysqldump --user={$dbUser} --password={$dbPass} --host={$dbHost} {$dbName} > \"{$backupPath}\"";
        $result = null;
        $output = null;
        exec($command, $output, $result);
        if ($result !== 0) {
            die('Backup failed.');
        }

        echo 'Backup created successfully.' . PHP_EOL;
    }

    protected function gitCommit()
    {
        // Execute git add *
        $result = null;
        $output = null;
        exec('git add *', $output, $result);
        if ($result !== 0) {
            die('Failed to add files to Git.');
        }

        // Execute git commit
        exec("git commit -m \"{$this->commit}\"", $output, $result);
        if ($result !== 0) {
            die('Commit failed.');
        }
    }

    protected function gitPush()
    {
        // Execute git push
        $result = null;
        $output = null;
        exec('git fetch origin', $output, $result);
        if ($result !== 0) {
            die('Fetch failed.');
        }

        $result = null;
        $output = null;
        exec('git rebase origin/main', $output, $result);
        if ($result !== 0) {
            die('Rebase failed.');
        }

        exec('git push origin HEAD:main', $output, $result);
        if ($result !== 0) {
            die('Push failed.');
        }

    }

    protected function importDatabase($sqlFilePath)
    {
        $dbName = env('DB_DATABASE');
        $dbUser = env('DB_USERNAME');
        $dbPass = env('DB_PASSWORD');
        $dbHost = env('DB_HOST');

        // Check database connection
        $connection = @mysqli_connect($dbHost, $dbUser, $dbPass, $dbName);
        if (!$connection) {
            $this->error('Cannot connect to the database. Please check your database credentials.');
            return false;
        }
        mysqli_close($connection);

        // Prepare the command
        $command = "mysql --user={$dbUser} --password={$dbPass} --host={$dbHost} {$dbName}";

        // Use proc_open to execute the command
        $process = proc_open($command, [
            0 => ["file", $sqlFilePath, "r"], // stdin is the SQL file
            1 => ["pipe", "w"], // stdout is a pipe that the child will write to
            2 => ["pipe", "w"], // stderr is a pipe that the child will write to
        ], $pipes);

        if (is_resource($process)) {
            $output = stream_get_contents($pipes[1]);
            $errorOutput = stream_get_contents($pipes[2]);

            fclose($pipes[1]);
            fclose($pipes[2]);

            $result = proc_close($process);

            if ($result !== 0) {
                $this->error('Database import failed. ' . $errorOutput);
                return false;
            }
        } else {
            $this->error('Failed to open process for database import.');
            return false;
        }

        return true;
    }
}
