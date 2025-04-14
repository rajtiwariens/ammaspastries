<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Shop\CustomCartController;
use App\Http\Controllers\Shop\CustomHomeController;
use App\Http\Controllers\Admin\ContactController;
use Debugbar;

Route::get('/checkout/cart', [CustomCartController::class, 'index'])->name('shop.checkout.cart.index');
Route::post('/api/checkout/cart', [CustomCartController::class, 'store'])->name('shop.api.checkout.cart.store');


    Route::post('contact-us/store-send-mail', [CustomHomeController::class, 'storeContactUsSendMail'])
        ->name('shop.home.contact_us.store_send_mail');


Route::get('/debug-test', function () {
    Debugbar::addMessage('Test message from clean route!');
    return view('debug-test');
});
Route::group(['middleware' => ['web', 'admin'], 'prefix' => config('app.admin_url')], function () {
    Route::get('/contact-list', [ContactController::class, 'index'])->name('admin.contact.index');
});