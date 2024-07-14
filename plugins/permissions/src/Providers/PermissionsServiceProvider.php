<?php

namespace Leo\Permissions\Providers;

use Illuminate\Support\ServiceProvider;

class PermissionsServiceProvider extends ServiceProvider 
{
    public function boot()
    {
        $this->loadRoutesFrom(__DIR__.'/../../routes/web.php');

        // $this->publishes([
        //     __DIR__.'/../../database/migrations' => database_path('migrations'),
        // ], 'migrations');
    }

    public function register()
    {
    }
}