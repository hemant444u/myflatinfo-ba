<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class VisitorInout extends Model
{
    use HasFactory,SoftDeletes;
    
    public function visitor()
    {
        return $this->belongsTo('App\Models\Visitor')->withTrashed();
    }
    
}
