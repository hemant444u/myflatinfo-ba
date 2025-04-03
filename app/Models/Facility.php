<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Facility extends Model
{
    use HasFactory,SoftDeletes;
    
    public function building()
    {
        return $this->belongsTo('App\Models\Building')->withTrashed();
    }
    
    public function timings()
    {
        return $this->hasMany('App\Models\Timing')->withTrashed();
    }
    
    public function bookings()
    {
        return $this->hasMany('App\Models\Booking')->withTrashed();
    }
    
    public function getIconAttribute($value)
    {
        return asset('public/images/facilities/'.$value);
    }
    
    
}
