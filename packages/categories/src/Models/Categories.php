<?php

namespace Leo\Categories\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categories extends Model
{
    use HasFactory;
    protected $table='categories';
    protected $fillable=['id','name','slug','status','created_at','updated_at'];
}
