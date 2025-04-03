<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class GatePass extends Model
{
    use HasFactory,SoftDeletes;
    
    public function building()
    {
        return $this->belongsTo('App\Models\Visitor')->withTrashed();
    }
    
    public function flat()
    {
        return $this->belongsTo('App\Models\Flat')->withTrashed();
    }
    
    public function user()
    {
        return $this->belongsTo('App\Models\User')->withTrashed();
    }
    
    public function visitor()
    {
        return $this->belongsTo('App\Models\Visitor')->withTrashed();
    }
    
    public function getImageAttribute($value)
    {
        return asset('public/images/gate_pass/'.$value);
    }
    
}
