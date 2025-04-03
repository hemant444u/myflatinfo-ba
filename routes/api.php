<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CustomerController;
use App\Http\Controllers\Api\VendorController;
use App\Http\Controllers\TruthScreenController;

// Route::prefix('customer')->group(function () {
    Route::post('login',[CustomerController::class,'login']);
    Route::post('send-otp',[CustomerController::class,'send_otp']);
    Route::post('resend-otp',[CustomerController::class,'resend_otp']);
    Route::post('forget-password',[CustomerController::class,'forget_password']);
    Route::post('verify-otp',[CustomerController::class,'verify_otp']);

    Route::post('get-setting',[CustomerController::class,'get_setting']);
    Route::post('get-logo',[CustomerController::class,'get_logo']);
    Route::post('onboarding',[CustomerController::class,'onboarding']);
    
    Route::middleware(['auth:api'])->group(function (){
        
        Route::post('update-password',[CustomerController::class,'update_password']);
        
        Route::post('change-password',[CustomerController::class,'change_password']);
        
        Route::post('get-flats',[CustomerController::class,'get_flats']);
        Route::post('select-flat',[CustomerController::class,'select_flat']);
        
        Route::middleware(['flat'])->group(function (){
            Route::post('get-ads',[CustomerController::class,'get_ads']);
            Route::post('profile',[CustomerController::class,'profile']);
            Route::post('update-profile',[CustomerController::class,'update_profile']);
            Route::post('get-noticeboards',[CustomerController::class,'get_noticeboards']);
            Route::post('get-events',[CustomerController::class,'get_events']);
            Route::post('get-classifieds',[CustomerController::class,'get_classifieds']);
            Route::post('my-classifieds',[CustomerController::class,'my_classifieds']);
            Route::post('create-classified',[CustomerController::class,'create_classified']);
            Route::post('update-classified',[CustomerController::class,'create_classified']);
            Route::post('delete-classified-photo',[CustomerController::class,'delete_classified_photo']);
            Route::post('delete-classified',[CustomerController::class,'delete_classified']);
            Route::post('get-departments',[CustomerController::class,'get_departments']);
            Route::post('get-staff-directory',[CustomerController::class,'get_staff_directory']);
            Route::post('raise-an-issue',[CustomerController::class,'raise_an_issue']);
            Route::post('user-issues',[CustomerController::class,'user_issues']);
            Route::post('add-comment',[CustomerController::class,'add_comment']);
            Route::post('add-reply',[CustomerController::class,'add_reply']);
            Route::post('get-facilities',[CustomerController::class,'get_facilities']);
            Route::post('get-facility-timings',[CustomerController::class,'get_facility_timings']);
            Route::post('book-facility',[CustomerController::class,'book_facility']);
            Route::post('my-bookings',[CustomerController::class,'my_bookings']);
            
            Route::post('create-own-vehicle',[CustomerController::class,'create_vehicle']);
            Route::post('update-own-vehicle',[CustomerController::class,'create_vehicle']);
            Route::post('delete-own-vehicle',[CustomerController::class,'delete_vehicle']);
            
            Route::post('create-visitor',[CustomerController::class,'create_visitor']);
            Route::post('update-visitor',[CustomerController::class,'create_visitor']);
            Route::post('create-gate-pass',[CustomerController::class,'create_gate_pass']);
            Route::post('my-visitor-in-out-history',[CustomerController::class,'my_visitor_in_out_history']);
            Route::post('add-family-member',[CustomerController::class,'create_family_member']);
            Route::post('update-family-member',[CustomerController::class,'create_family_member']);
            Route::post('delete-family-member',[CustomerController::class,'delete_family_member']);
            Route::post('my-family-members',[CustomerController::class,'my_family_members']);
            Route::post('get-visitors',[CustomerController::class,'get_visitors']);
            Route::post('get-vehicles',[CustomerController::class,'get_vehicles']);
            Route::post('get-my-parcels',[CustomerController::class,'get_my_parcels']);
            Route::post('take-parcel-action',[CustomerController::class,'take_parcel_action']);
            Route::post('take-visitor-action',[CustomerController::class,'take_visitor_action']);
            
        });
        //Route::post('create-razorpay-order', [CustomerController::class,'create_razorpay_order']);
        //Route::post('verify-razorpay-signature', [CustomerController::class,'verify_razorpay_signature']);
            
        //Route::post('get-notifications', [CustomerController::class,'get_notifications']);
        //Route::post('read-notification', [CustomerController::class,'read_notification']);
        
        
        // guards route
        
        Route::post('get-gates',[CustomerController::class,'get_gates']);
        Route::post('select-gate',[CustomerController::class,'select_gate']);
        Route::middleware(['gate'])->group(function (){
            Route::post('get-building-flats',[CustomerController::class,'get_building_flats']);
            Route::post('get-building-visitors',[CustomerController::class,'get_building_visitors']);
            Route::post('get-building-vehicles',[CustomerController::class,'get_building_vehicles']);
            Route::post('create-vehicle',[CustomerController::class,'create_vehicle']);
            Route::post('update-vehicle',[CustomerController::class,'create_vehicle']);
            Route::post('delete-vehicle',[CustomerController::class,'delete_vehicle']);
            Route::post('visitor-in-out',[CustomerController::class,'visitor_in_out']);
            Route::post('visitor-in-out-history',[CustomerController::class,'visitor_in_out_history']);
            Route::post('vehicle-in-out',[CustomerController::class,'vehicle_in_out']);
            Route::post('vehicle-in-out-history',[CustomerController::class,'vehicle_in_out_history']);
            Route::post('search-flat',[CustomerController::class,'search_flat']);
            Route::post('create-unplanned-visitor',[CustomerController::class,'create_visitor']);
            Route::post('resend-visitor-request',[CustomerController::class,'resend_visitor_request']);
            Route::post('get-flat-parcels',[CustomerController::class,'get_flat_parcels']);
            Route::post('create-parcel',[CustomerController::class,'create_parcel']);
            Route::post('update-parcel',[CustomerController::class,'create_parcel']);
            Route::post('resend-recieve-request',[CustomerController::class,'resend_recieve_request']);
        });
        
        // guards route
        
        Route::post('my-departments',[CustomerController::class,'my_departments']);
        Route::post('select-department',[CustomerController::class,'select_department']);
        Route::post('get-issues',[CustomerController::class,'get_issues']);
        Route::post('update-issue-status',[CustomerController::class,'update_issue_status']);
    });
    
    
// });




