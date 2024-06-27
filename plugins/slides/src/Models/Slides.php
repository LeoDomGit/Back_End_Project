<?php

namespace Leo\Slides\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Slides extends Model
{
    use HasFactory;
    protected $table='slides';
    protected $fillable=['id','name','slug','url','status','desktop','mobile','created_at','updated_at'];

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }
}
