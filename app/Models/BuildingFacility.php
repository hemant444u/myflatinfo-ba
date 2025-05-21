<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Cache;

class BuildingFacility extends Model
{
    use HasFactory,SoftDeletes;

    protected $fillable = [
        'building_id',
        'facility_id',
    ];
    
    public function building()
    {
        return $this->belongsTo('App\Models\Building')->withTrashed();
    }
    
    public function facility()
    {
        return $this->belongsTo('App\Models\Facility')->withTrashed();
    }

    public function timings()
    {
        return $this->hasMany('App\Models\Timing')->withTrashed();
    }
    
    public function bookings()
    {
        return $this->hasMany('App\Models\Booking')->withTrashed();
    }

    public function buildings()
    {
        return $this->belongsToMany(Building::class, 'building_facilities', 'facility_id', 'building_id');
    }
    
    
}
