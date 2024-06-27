<?php

namespace Leo\Customers\Providers;

use Illuminate\Support\ServiceProvider;

class CustomersServiceProvider extends ServiceProvider
{
    public function boot()
    {
        $this->loadRoutesFrom(__DIR__.'/../../routes/web.php');
        $this->publishes([
            __DIR__.'/../../database/migrations' => database_path('migrations'),
        ], 'migrations');
        $this->loadViewsFrom(__DIR__.'/../../resources/views/mail', 'user-views');
    }

    public function register()
    {
    }
}