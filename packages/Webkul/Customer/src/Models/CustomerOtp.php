<?php

namespace Webkul\Customer\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Webkul\Customer\Contracts\CustomerOtp as CustomerOtpContract;

class CustomerOtp extends Model implements CustomerOtpContract
{
    use HasFactory;

    protected $table = 'customer_otps';

    protected $fillable = [
        'customer_id',
        'mobile',
        'otp',
        'expires_at',
        'is_used',
    ];

    protected $casts = [
        'expires_at' => 'datetime',
        'is_used' => 'boolean',
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
}