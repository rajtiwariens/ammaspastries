<?php

namespace Webkul\Blog\Http\Controllers\Shop;

use Illuminate\Routing\Controller;
use Webkul\Blog\Repositories\PostRepository;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;

class BlogController extends Controller
{
    use DispatchesJobs, ValidatesRequests;
    
    public function __construct(protected PostRepository $postRepository){}

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        $blogs = $this->postRepository->with(['author'])->all();

        return view('blog::shop.index', compact('blogs'));
    }
}
