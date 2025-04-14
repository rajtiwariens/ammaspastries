<?php
namespace App\Http\Controllers\Admin;

use Webkul\Admin\Http\Controllers\Controller;
use App\DataGrids\Admin\ContactDataGrid;

class ContactController extends Controller
{
    public function index()
    {
        if (request()->ajax()) {
            return app(ContactDataGrid::class)->toJson();
        }

        return view('admin::contact.index');
    }
}

