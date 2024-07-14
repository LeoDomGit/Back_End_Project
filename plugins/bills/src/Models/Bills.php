<?php

namespace Leo\Bills\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bills extends Model
{
    use HasFactory;
    protected $table='hoa_don';
    protected $fillable=[
        'id','name','phone','address','note','status','created_at','updated_at'
    ];
    public function details()
    {
        return $this->hasMany(Bill_Detail::class, 'id_hoa_don');
    }
}
