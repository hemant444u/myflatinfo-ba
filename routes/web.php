<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\NotificationController;
use App\Http\Controllers\Admin\SupportController;
use App\Http\Controllers\Auth\ForgotPasswordController;
use App\Http\Controllers\Auth\AdminForgotPasswordController;

use App\Http\Controllers\Admin\CityController;
use App\Http\Controllers\Admin\BuildingController;
use App\Http\Controllers\Admin\EventController;
use App\Http\Controllers\Admin\NoticeboardController;
use App\Http\Controllers\Admin\ClassifiedController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\PermissionController;
use App\Http\Controllers\Admin\BlockController;
use App\Http\Controllers\Admin\FlatController;
use App\Http\Controllers\Admin\IssueController;
use App\Http\Controllers\Admin\FacilityController;
use App\Http\Controllers\Admin\TimingController;
use App\Http\Controllers\Admin\VisitorController;
use App\Http\Controllers\Admin\VehicleController;
use App\Http\Controllers\Admin\PaymentController;
use App\Http\Controllers\Admin\CommentController;
use App\Http\Controllers\Admin\MaintenanceController;
use App\Http\Controllers\Admin\GuardController;
use App\Http\Controllers\Admin\EssentialController;
use App\Http\Controllers\Admin\FundController;
use App\Http\Controllers\Admin\GateController;
use App\Http\Controllers\Admin\ExpenseController;

Route::get('clear-cache',function(){
    //\Artisan::call('storage:link');
    //\Artisan::call('vendor:publish --provider="Fruitcake\Cors\CorsServiceProvider');
    \Artisan::call('config:clear');
    \Artisan::call('cache:clear');
    \Artisan::call('view:clear');
    \Artisan::call('route:clear');
    \Artisan::call('config:cache');
});


Route::middleware('guest')->group(function () {

	Route::get('/',[AdminController::class, 'index'])->name('login');
	Route::post('/login',[AdminController::class, 'login']);
	Route::post('/verifyotp',[AdminController::class, 'verifyotp']);
	
	Route::get('forget-password', [AdminForgotPasswordController::class, 'showForgetPasswordForm']);
	Route::post('forget-password', [AdminForgotPasswordController::class, 'submitForgetPasswordForm']);
    Route::get('reset-password/{token}', [AdminForgotPasswordController::class, 'showResetPasswordForm']);
    Route::post('reset-password', [AdminForgotPasswordController::class, 'submitResetPasswordForm']);
});

Route::post('/save-token',[AdminController::class, 'save_token'])->name('save.token');

Route::middleware('admin')->group(function () {
    
    Route::get('/building-option',[AdminController::class, 'building_option']);
    Route::get('/select-building/{id}',[AdminController::class, 'select_building']);

    Route::middleware('building')->group(function () {
        Route::get('/dashboard',[AdminController::class, 'dashboard']);
        Route::get('/profile',[AdminController::class, 'profile']);
        Route::post('/update-profile',[AdminController::class, 'update_profile']);
        Route::post('/change-password',[AdminController::class, 'change_password']);
        Route::get('/user',[AdminController::class, 'users']);
        Route::get('/user/{id}',[AdminController::class, 'show_user']);
        Route::post('/store-user',[AdminController::class, 'store_user']);
        Route::post('/delete-user',[AdminController::class, 'delete_user']);
        Route::post('/update-user-status',[AdminController::class, 'update_user_status']);
        Route::post('/get-user-by-email',[AdminController::class, 'get_user_by_email']);

        Route::resource('/guard', GuardController::class);
        Route::resource('/city', CityController::class);
        Route::resource('/role', RoleController::class);
        Route::resource('/permission', PermissionController::class);
        Route::get('/get-role-permissions/{id}', [RoleController::class, 'getRolePermissions'])->name('getRolePermissions');
        Route::post('/store-user-role',[RoleController::class, 'store_user_role']);
        Route::post('/delete-user-role',[RoleController::class, 'delete_user_role']);
        Route::get('/department/{role_slug}', [RoleController::class, 'get_deartments']);
        
        Route::resource('/buildings', BuildingController::class);
        Route::post('/update-building-status',[BuildingController::class, 'update_building_status']);
                
        Route::resource('/block', BlockController::class);
        Route::post('/update-block-status',[BlockController::class, 'update_block_status']);
        
        Route::post('/get-gates',[GateController::class, 'get_gates']);
        Route::resource('/gate', GateController::class);
        Route::post('/update-gate-status',[GateController::class, 'update_gate_status']);
        
        Route::resource('/flat', FlatController::class);
        Route::post('/update-flat-status',[FlatController::class, 'update_flat_status']);
        Route::get('/get-flats/{blockId}',[FlatController::class, 'getFlats']);
        
        Route::resource('/event', EventController::class);
        Route::post('/update-event-status',[EventController::class, 'update_event_status']);
        Route::resource('/payment', PaymentController::class);
        Route::resource('/noticeboard', NoticeboardController::class);
        Route::resource('/classified', ClassifiedController::class);
        Route::resource('/issue', IssueController::class);
        Route::post('/update-issue-status',[IssueController::class, 'update_issue_status']);
        Route::post('add-comment', [CommentController::class, 'addComment']);
        Route::post('add-reply', [CommentController::class, 'addReply']);

        Route::resource('/facility', FacilityController::class);
        Route::resource('/timing', TimingController::class);
        Route::resource('/visitor', VisitorController::class);
        Route::resource('/vehicles', VehicleController::class);
        Route::resource('/expense', ExpenseController::class);
        Route::get('/vehicle-inouts',[VehicleController::class, 'vehicle_inouts']);
        Route::resource('/maintenance', MaintenanceController::class);
        Route::post('/update-maintenance-status',[MaintenanceController::class, 'update_maintenance_status']);
        Route::post('/store-maintenance-payment',[MaintenanceController::class, 'store_maintenance_payment']);
        
        Route::resource('/essential', EssentialController::class);
        Route::post('/update-essential-status',[EssentialController::class, 'update_essential_status']);
        Route::post('/store-essential-payment',[EssentialController::class, 'store_essential_payment']);
        Route::get('/society-fund/expenses',[ExpenseController::class, 'index']);
        Route::get('/society-fund/maintenance',[FundController::class, 'get_maintenance_funds']);
        Route::get('/society-fund/event',[FundController::class, 'get_event_funds']);
        Route::get('/society-fund/corpus',[FundController::class, 'get_corpus_funds']);
        Route::get('/society-fund/reciepts',[FundController::class, 'get_reciepts']);
        
        Route::resource('/notification', NotificationController::class);
        Route::resource('/setting',SettingController::class);
        Route::get('/taxes',[SettingController::class, 'taxes']);
        Route::post('/update-taxes',[SettingController::class, 'update_taxes']);
        Route::get('/privacy-policy',[SettingController::class, 'privacy_policy']);
        Route::post('/update-privacy-policy',[SettingController::class, 'update_privacy_policy']);
        Route::get('/terms-conditions',[SettingController::class, 'terms_conditions']);
        Route::post('/update-terms-conditions',[SettingController::class, 'update_terms_conditions']);
        Route::get('/about-us',[SettingController::class, 'about_us']);
        Route::post('/update-about-us',[SettingController::class, 'update_about_us']);
        Route::get('/how-it-works',[SettingController::class, 'how_it_works']);
        Route::post('/update-how-it-works',[SettingController::class, 'update_how_it_works']);
        Route::get('/return-and-refund-policy',[SettingController::class, 'return_and_refund_policy']);
        Route::post('/update-return-and-refund-policy',[SettingController::class, 'update_return_and_refund_policy']);
        Route::get('/accidental-policy',[SettingController::class, 'accidental_policy']);
        Route::post('/update-accidental-policy',[SettingController::class, 'update_accidental_policy']);
        Route::get('/cancellation-policy',[SettingController::class, 'cancellation_policy']);
        Route::post('/update-cancellation-policy',[SettingController::class, 'update_cancellation_policy']);
        Route::get('/delete-account-policy',[SettingController::class, 'delete_account_policy']);
        Route::post('/update-delete-account-policy',[SettingController::class, 'update_delete_account_policy']);
        Route::get('/faqs',[SettingController::class, 'faqs']);
        Route::post('/update-faqs',[SettingController::class, 'update_faqs']);
    });
    
	Route::post('/logout',[AdminController::class, 'logout']);
});