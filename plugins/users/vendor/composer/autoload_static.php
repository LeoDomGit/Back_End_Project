<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitbfa6d011d96b2cc0225075a2e61368e2
{
    public static $prefixLengthsPsr4 = array (
        'L' => 
        array (
            'Leo\\Users\\' => 10,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Leo\\Users\\' => 
        array (
            0 => __DIR__ . '/../..' . '/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitbfa6d011d96b2cc0225075a2e61368e2::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitbfa6d011d96b2cc0225075a2e61368e2::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitbfa6d011d96b2cc0225075a2e61368e2::$classMap;

        }, null, ClassLoader::class);
    }
}
