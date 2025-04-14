<?php

namespace App\Http\Controllers\Shop;

use App\Http\Controllers\Controller;
use Webkul\Checkout\Http\Controllers\CartController;
use Illuminate\Http\Request;
use Webkul\Checkout\Facades\Cart;
use Illuminate\Support\Facades\Log;

class CustomCartController extends Controller
{
    public function store(Request $request)
    {  dd("test");
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1',
            'cake_name' => 'nullable|string|max:255',
            'cake_image' => 'nullable|image|max:2048',
        ]);

        Log::info('Request Data:', [
            'product_id' => $request->product_id,
            'quantity' => $request->quantity,
            'cake_name' => $request->cake_name,
            'has_file' => $request->hasFile('cake_image'),
            'file' => $request->file('cake_image') ? $request->file('cake_image')->getClientOriginalName() : 'No file',
        ]);

        $result = parent::store($request);

        if ($result->getData()->success) {
            $cart = Cart::getCart();
            $cartItem = $cart->items->where('product_id', $request->product_id)->first();

            if (!$cartItem) {
                Log::error('Cart item not found for product_id:', ['product_id' => $request->product_id]);
                return $result;
            }

            $additional = $cartItem->additional ?? [];

            if ($request->has('cake_name')) {
                $additional['cake_name'] = $request->cake_name;
                Log::info('Cake name added:', ['cake_name' => $additional['cake_name']]);
            }

            if ($request->hasFile('cake_image')) {
                try {
                    $imagePath = $request->file('cake_image')->store('cake_images', 'public');
                    $additional['cake_image'] = $imagePath;
                    Log::info('Image stored at:', ['path' => $imagePath]);
                } catch (\Exception $e) {
                    Log::error('Failed to store image:', ['error' => $e->getMessage()]);
                }
            }

            $cartItem->additional = $additional;
            $cartItem->save();

            Log::info('Cart item updated:', [
                'cart_item_id' => $cartItem->id,
                'additional' => $cartItem->additional,
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Item added to cart successfully.',
                'redirect' => route('shop.checkout.cart.index'),
            ]);
        }

        return $result;
    }

    public function index()
    {
        return view('shop::checkout.cart.index');
    }
}
