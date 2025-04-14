<?php

namespace Webkul\Blog\Repositories;

use Webkul\Core\Eloquent\Repository;

class PostRepository extends Repository
{
    /**
    * Specify the Model class name
    */
    function model(): string
    {
        return 'Webkul\Blog\Contracts\Post';
    }
}
