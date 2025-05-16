<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Cache;

class Ad extends Model
{
    use HasFactory;

    public function getImageAttribute($value)
    {
        return Cache::remember("signed_url_{$value}", now()->addMinutes(10), function () use ($value) {
            return Storage::disk('s3')->temporaryUrl($value, now()->addMinutes(10)); // Expires in 10 min
        });
    }
    
    public function getImageFilenameAttribute()
    {
        return $this->attributes['image'] ?? null;
    }
    
    
}
