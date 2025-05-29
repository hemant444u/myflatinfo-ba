<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Flat extends Model
{
    use HasFactory,SoftDeletes;
    
    public function flat()
    {
        return $this->belongsTo('App\Models\Flat')->withTrashed();
    }
    
    public function parking()
    {
        return $this->belongsTo('App\Models\Parking')->withTrashed();
    }
    
    
}
