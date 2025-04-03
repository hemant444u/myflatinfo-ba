<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;
use Illuminate\Database\Eloquent\SoftDeletes;
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
            return asset('public/images/profiles/'.$value);
        }else{
            if($this->gender == 'Male'){
                return asset('public/images/profiles/male.png');
            }
            if($this->gender == 'Female' && $value == ''){
                return asset('public/images/profiles/female.jpeg');
            }
        }
        return asset('public/images/profiles/male.png');
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
