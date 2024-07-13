<?php

namespace Leo\Services\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Services extends Model
{
    protected $table='services';
    protected $fillable=['id','name','price','slug','highlighted','id_collections','compare_price','discount','summary','image','content','status','created_at','updated_at'];
    use HasFactory;
    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }
    public function scopeHighlight($query)
    {
        return $query->where('highlighted', 1);
    }
}
