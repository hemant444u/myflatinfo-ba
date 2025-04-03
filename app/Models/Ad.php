<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Ad extends Model
{
    use HasFactory;
    
    public function building()
    {
        return $this->belongsTo('App\Models\Building');
    }
    
    public function getImageAttribute($value)
    {
        return asset('public/images/ads/'.$value);
    }
    
    
}
