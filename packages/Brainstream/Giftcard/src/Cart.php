<?php

namespace Brainstream\Giftcard;

use Webkul\Checkout\Cart as BaseCart;
use Brainstream\Giftcard\Traits\GiftCardOverrides;

class Cart extends BaseCart
{
    use GiftCardOverrides {
        GiftCardOverrides::setGiftCardCode as setGiftCardCodeOverride;
        GiftCardOverrides::removeGiftCardCode as removeGiftCardCodeOverride;
    }
}
