<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Block extends Model
{
    use HasFactory,SoftDeletes;
    
    public function building()
    {
        return $this->belongsTo('App\Models\Building')->withTrashed();
    }
    
    public function flats()
    {
        return $this->hasMany('App\Models\Flat')->withTrashed();
    }
    
    public function gates()
    {
        return $this->hasMany('App\Models\Gate')->withTrashed();
    }
    
    public function guards()
    {
        return $this->hasMany('App\Models\Guard')->withTrashed();
    }
    
}
