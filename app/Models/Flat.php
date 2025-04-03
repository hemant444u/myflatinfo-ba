<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Flat extends Model
{
    use HasFactory,SoftDeletes;
    
    public function building()
    {
        return $this->belongsTo('App\Models\Building')->withTrashed();
    }
    
    public function block()
    {
        return $this->belongsTo('App\Models\Block')->withTrashed();
    }
    
    public function owner()
    {
        return $this->belongsTo('App\Models\User','owner_id')->withTrashed();
    }
    
    public function tanent()
    {
        return $this->belongsTo('App\Models\User','tanent_id')->withTrashed();
    }
    
    public function family_members()
    {
        return $this->hasMany('App\Models\FamilyMember');
    }
    
    public function parcels()
    {
        return $this->hasMany('App\Models\Parcel')->withTrashed();
    }
    
    public function vehicles()
    {
        return $this->hasMany('App\Models\Vehicle')->withTrashed();
    }
    
    public function visitors()
    {
        return $this->hasMany('App\Models\Visitor')->withTrashed();
    }
    
    public function visitor_inouts()
    {
        return $this->hasMany('App\Models\VisitorInout')->withTrashed();
    }
    
    public function maintenance_payments()
    {
        return $this->hasMany('App\Models\MaintenancePayment')->withTrashed();
    }
    
    public function essential_payments()
    {
        return $this->hasMany('App\Models\EssentialPayment')->withTrashed();
    }
    
}
