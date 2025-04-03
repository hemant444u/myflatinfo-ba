<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Event extends Model
{
    use HasFactory,SoftDeletes;
    
    public function building()
    {
        return $this->belongsTo('App\Models\Building')->withTrashed();
    }
    
    public function payments()
    {
        return $this->hasMany('App\Models\Payment')->withTrashed();
    }
    
    public function getImageAttribute($value)
    {
        return asset('public/images/events/'.$value);
    }

}
