<?php

namespace Leo\Roles\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Leo\Users\Models\User;

class Roles extends Model
{
    use HasFactory;
    protected $table='roles';
    protected $fillable = [	'id','name','guard_name','created_at','updated_at'];	

    public function users()
    {
        return $this->hasMany(User::class, 'idRole');
    }
}
