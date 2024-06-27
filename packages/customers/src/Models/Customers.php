<?php

namespace Leo\Customers\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Customers extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table='customers';
    protected $fillable=['id','name','address','password','phone','email','status','email_verified_at','created_at','updated_at'];
    
    public function cart(){
        return $this->hasMany(Customers::class);
    }
}
