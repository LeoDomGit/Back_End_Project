<?php

namespace Leo\Roles\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Roles extends Model
{
    use HasFactory;
    protected $table='roles';
    protected $fillable = [	'id','name','guard_name','created_at','updated_at'];	

}
