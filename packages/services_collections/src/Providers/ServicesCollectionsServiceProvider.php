<?php

namespace Leo\ServicesCollections\Providers;

use Illuminate\Support\ServiceProvider;

class ServicesCollectionsServiceProvider extends ServiceProvider
{
    public function boot()
    {
        $this->loadRoutesFrom(__DIR__.'/../../routes/web.php');
        // $this->loadMigrationsFrom(__DIR__.'/../../database/migrations');
    }

    public function register()
    {
    }
}