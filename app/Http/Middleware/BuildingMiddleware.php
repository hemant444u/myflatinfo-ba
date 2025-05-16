<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

use \Auth;
use Carbon\Carbon;

class BuildingMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $user = Auth::User();
        if($user->building == ''){
            return redirect('/building-option')->with('error','Building is not selected');
        }

        if($user->building && $user->building->status != 'Active'){
            return redirect('/building-option')->with('error','Building is Inactive, Please select any others');
        }

        if($user->building && $user->building->valid_till < Carbon::now()){
            return redirect('/building-option')->with('error','Building valadity is expired, Please select any others');
        }
        
        return $next($request);
    }
}
