<?php

namespace Leo\Carts\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Leo\Customers\Models\Customers;
use Leo\Products\Models\Products;

class Carts extends Model
{
    use HasFactory;

    protected $fillable = [
        'id_customer',
        'id_product',
        'quantity',
        'created_at',
        'updated_at',
    ];

    public function customer()
    {
        return $this->belongsTo(Customers::class, 'id_customer');
    }

    public function products()
    {
        return $this->belongsTo(Products::class, 'id_product');
    }
}
