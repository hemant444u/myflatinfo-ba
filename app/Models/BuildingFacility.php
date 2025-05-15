<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

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
    
}
