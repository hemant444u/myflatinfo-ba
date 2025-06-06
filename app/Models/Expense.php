<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Facility;
use App\Models\BuildingFacility;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Cache;
use \Auth;
class Expense extends Model
{
    use HasFactory;
    
    public function building()
    {
        return $this->belongsTo('App\Models\Building')->withTrashed();
    }
    
    public function user()
    {
        return $this->belongsTo('App\Models\User')->withTrashed();
    }

    public function getImageAttribute($value)
    {
        if($value != ''){
            return Cache::remember("signed_url_{$value}", now()->addMinutes(10), function () use ($value) {
                return Storage::disk('s3')->temporaryUrl($value, now()->addMinutes(10)); // Expires in 10 min
            });
        }
    }
    
    public function getImageFilenameAttribute()
    {
        return $this->attributes['image'] ?? null;
    }

    public function getModelNameAttribute()
    {
        // Prefix the model name with the App\Models\ namespace
        $class = 'App\\Models\\' . $this->model;

        if (class_exists($class)) {
            if($this->model == 'Booking'){
                $user = Auth::User();
                $building_facility = BuildingFacility::where('building_id',$user->building_id)->first();
                $instance = Facility::find($building_facility->facility_id);
            }else{
                $instance = $class::find($this->model_id);
                return $instance ? ($instance->name ?? $instance->title ?? $this->model_id) : $this->model_id;
            }
        }

        return 'N/A';
    }

}
