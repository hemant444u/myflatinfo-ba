<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ClassifiedPhoto extends Model
{
    use HasFactory;
    
    public function classified()
    {
        return $this->belongsTo('App\Models\Classified')->withTrashed();
    }
    
    public function getPhotoAttribute($value)
    {
        return asset('public/images/classifieds/'.$value);
    }
    
    public function getPhotoFilenameAttribute()
    {
        return $this->attributes['photo'];
    }
    
}
