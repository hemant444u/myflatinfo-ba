<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Visitor extends Model
{
    use HasFactory,SoftDeletes;
    
    public function building()
    {
        return $this->belongsTo('App\Models\Building')->withTrashed();
    }
    
    public function flat()
    {
        return $this->belongsTo('App\Models\Flat')->with(['owner','tanent'])->withTrashed();
    }
    
    public function block()
    {
        return $this->belongsTo('App\Models\Block')->withTrashed();
    }
    
    public function user()
    {
        return $this->belongsTo('App\Models\User')->withTrashed();
    }
    
    public function vehicles()
    {
        return $this->hasMany('App\Models\Vehicle')->withTrashed();
    }
    
    public function inouts()
    {
        return $this->hasMany('App\Models\VisitorInout')->withTrashed();
    }
    
    public function getHeadPhotoAttribute($value)
    {
        return asset('public/images/visitors/'.$value);
    }
    
}
