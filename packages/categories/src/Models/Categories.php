<?php

namespace Leo\Categories\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Leo\Products\Models\Products;

class Categories extends Model
{
    use HasFactory;
    protected $table='categories';
    protected $fillable=['id','name','slug','id_parent','status','created_at','updated_at'];
    
    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }
    public function products(){
        return $this->hasMany(Products::class,'idCate');
    }
}
