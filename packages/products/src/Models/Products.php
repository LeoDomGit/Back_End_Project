<?php

namespace Leo\Products\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Leo\Brands\Models\Brands;
use Leo\Carts\Models\Carts;
use Leo\Categories\Models\Categories;

class Products extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table='products';
    
    protected $fillable = [
       'id', 'name', 'slug', 'status','content','price','in_stock','discount','idCate','idBrand', 'created_at','updated_at'
    ];
    
    public function categories (){
        return $this->belongsTo(Categories::class,'idCate');
    }

    public function brands (){
        return $this->belongsTo(Brands::class,'idBrand');
    }

    public function gallery (){
        return $this->hasMany(Gallery::class,'id_parent');
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }
    public function carts()
    {
        return $this->hasMany(Carts::class, 'id_product');
    }
}
