<?php

namespace KhanhDuy\Bookings\Models;

use App\Models\User;
use Leo\Customers\Models\Customers;
use Leo\Services\Models\Services;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Booking extends Model
{
    use HasFactory;

    protected $table = 'bookings';
    protected $fillable = ['id_user', 'id_customer', 'id_service ', 'time', 'end_time', 'created_at', 'updated_at'];

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user', 'id');
    }

    public function customer()
    {
        return $this->belongsTo(Customers::class, 'id_customer', 'id');
    }

    public function service()
    {
        return $this->belongsTo(Services::class, 'id_service', 'id');
    }
}
