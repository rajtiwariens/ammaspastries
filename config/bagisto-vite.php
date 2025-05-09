<?php

return [
    /*
    |--------------------------------------------------------------------------
    | Bagisto Vite Configuration
    |--------------------------------------------------------------------------
    |
    | Please add your Vite registry here to seamlessly support the `bagisto_assets` function.
    |
    */

    'viters' => [
        'admin' => [
            'hot_file'                 => 'admin-default-vite.hot',
            'build_directory'          => 'themes/admin/default/build',
            'package_assets_directory' => 'src/Resources/assets',
        ],

        'shop' => [
            'hot_file'                 => 'shop-default-vite.hot',
            'build_directory'          => 'themes/shop/default/build',
            'package_assets_directory' => 'src/Resources/assets',
        ],

        'installer' => [
            'hot_file'                 => 'installer-default-vite.hot',
            'build_directory'          => 'themes/installer/default/build',
            'package_assets_directory' => 'src/Resources/assets',
        ],
        'blog' => [
            'hot_file'                 => 'blog-vite.hot',
            'build_directory'          => 'themes/blog/build',
            'package_assets_directory' => 'src/Resources/assets',
        ],
        'reward' => [
        'hot_file'                 => 'reward-vite.hot',
        'build_directory'          => 'themes/reward/build',
        'package_assets_directory' => 'src/Resources/assets',
    ],

    ],
];
