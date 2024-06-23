<?php

namespace Leo\Products\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gallery extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table='gallery';
    
    protected $fillable = [
        'image', 'id_parent','status','created_at','updated_at'
    ];
}
