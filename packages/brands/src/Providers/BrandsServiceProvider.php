<?php

namespace Leo\Brands\Providers;

use Illuminate\Support\ServiceProvider;

class BrandsServiceProvider extends ServiceProvider 
{
    public function boot()
    {
        $this->loadRoutesFrom(__DIR__.'/../../routes/web.php');

        $this->publishes([
            __DIR__.'/../../database/migrations' => database_path('migrations'),
        ], 'migrations');
    }

    public function register()
    {
    }
}