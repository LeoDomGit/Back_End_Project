<?php

namespace Leo\Bookings\Models;

use App\Events\BookingCreated;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Leo\Customers\Models\Customers;
use Leo\Services\Models\Services;
use Leo\Users\Models\User;

class Bookings extends Model
{
    use HasFactory;

    protected $fillable = ['id_user', 'id_customer', 'id_service', 'time', 'end_time', 'created_at', 'updated_at'];

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

    public function customer()
    {
        return $this->belongsTo(Customers::class, 'id_customer');
    }

    public function service()
    {
        return $this->belongsTo(Services::class, 'id_service');
    }

    protected static function booted()
    {
        static::created(function ($booking) {
            event(new BookingCreated($booking));
        });
    }
}
