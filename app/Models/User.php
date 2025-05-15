<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Cache;
use \Str;

use \DB;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes;

    protected $hidden = [
        'password', 'remember_token','api_token','device_token','otp',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    
    public function sent_notifications()
    {
        return $this->hasMany('App\Models\Notification','from_id');
    }
    
    public function getNameAttribute()
    {
        return "{$this->first_name} {$this->last_name}";
    }
    
    public function getPhotoAttribute($value)
    {
        if($value != ''){
            return Cache::remember("signed_url_{$value}", now()->addMinutes(10), function () use ($value) {
                return Storage::disk('s3')->temporaryUrl($value, now()->addMinutes(10)); // Expires in 10 min
            });
        }else{
            if($this->gender == 'Male'){
                return asset('images/profiles/male.png');
            }
            if($this->gender == 'Female'){
                return asset('images/profiles/female.jpeg');
            }
        }
    }
    
    public function buildings()
    {
        return $this->hasMany('App\Models\Building');
    }
    
    public function departments()
    {
        return $this->hasMany('App\Models\BuildingUser')->with('role')->withTrashed();
    }
    
    public function department()
    {
        return $this->belongsTo('App\Models\BuildingUser')->with('role')->withTrashed();
    }
    
    public function building()
    {
        return $this->belongsTo('App\Models\Building');
    }
    
    public function flat()
    {
        return $this->belongsTo('App\Models\Flat');
    }
    
    public function city()
    {
        return $this->belongsTo('App\Models\City');
    }
    
    public function gate()
    {
        return $this->belongsTo('App\Models\Gate');
    }
    
    public function getPhotoFilenameAttribute()
    {
        return $this->attributes['photo'];
    }
    
    
    private function generateUniqueString($length = 8)
    {
        $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}
