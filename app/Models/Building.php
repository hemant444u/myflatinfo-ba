<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Building extends Model
{
    use HasFactory,SoftDeletes;
    
    public function user()
    {
        return $this->belongsTo('App\Models\User')->withTrashed();
    }

    public function users()
    {
        return $this->hasMany('App\Models\BuildingUser')->withTrashed();
    }

    public function builder()
    {
        return $this->belongsTo('App\Models\Builder')->withTrashed();
    }
    
    public function blocks()
    {
        return $this->hasMany('App\Models\Block')->withTrashed();
    }
    
    public function flats()
    {
        return $this->hasMany('App\Models\Flat')->withTrashed();
    }
    
    public function gates()
    {
        return $this->hasMany('App\Models\Gate')->withTrashed();
    }
    
    public function city()
    {
        return $this->belongsTo('App\Models\City')->withTrashed();
    }
    
    public function roles()
    {
        return $this->hasMany('App\Models\Role')->withTrashed();
    }
    
    public function noticeboards()
    {
        return $this->hasMany('App\Models\Noticeboard')->withTrashed();
    }
    
    public function events()
    {
        return $this->hasMany('App\Models\Event')->withTrashed();
    }
    
    public function classifieds()
    {
        return $this->hasMany('App\Models\Classified')->withTrashed();
    }
    
    public function issues()
    {
        return $this->hasMany('App\Models\Issue')->withTrashed();
    }
    
    public function facilities()
    {
        return $this->belongsToMany(Facility::class, 'building_facilities', 'building_id', 'facility_id')
                    ->withPivot('id','price','max_booking','per_user_max_booking','cancellation_type','cancellation_value','status','created_at','updated_at');
    }
    public function visitors()
    {
        return $this->hasMany('App\Models\Visitor')->withTrashed();
    }
    
    public function vehicles()
    {
        return $this->hasMany('App\Models\Vehicle')->withTrashed();
    }
    
    public function guards()
    {
        return $this->hasMany('App\Models\Guard')->withTrashed();
    }
    
    public function maintenances()
    {
        return $this->hasMany('App\Models\Maintenance')->withTrashed();
    }
    
    public function essentials()
    {
        return $this->hasMany('App\Models\Essential')->withTrashed();
    }
    
    public function visitor_inouts()
    {
        return $this->hasMany('App\Models\VisitorInout')->withTrashed();
    }
    
    public function vehicle_inouts()
    {
        return $this->hasMany('App\Models\VehicleInout')->withTrashed();
    }
    
    public function getImageAttribute($value)
    {
        return asset('public/images/buildings/'.$value);
    }
    
    public function departments()
    {
        return $this->hasMany('App\Models\Role')->withTrashed();
    }
    
    public function expenses()
    {
        return $this->hasMany('App\Models\Expense');
    }
    
}
