<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class IssuePhoto extends Model
{
    use HasFactory,SoftDeletes;
    
    public function issue()
    {
        return $this->belongsTo('App\Models\Issue')->withTrashed();
    }
    
    public function getPhotoAttribute($value)
    {
        return asset('public/images/issues/'.$value);
    }
    
}
