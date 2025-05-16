<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

use \Auth;
use Carbon\Carbon;

class FlatMiddleware
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
        if($user->flat_id == ''){
            abort(response()->json(
            [
                'error' => 'flat is not selected',
                'redirect' => 'select_flat_screen',
            ], 422));
        }

        if($user->flat && $user->flat->status != 'Active'){
            abort(response()->json(
            [
                'error' => 'flat is not Active',
                'redirect' => 'select_flat_screen',
            ], 422));
        }
        if($user->flat && $user->flat->building && $user->flat->building->status != 'Active'){
            abort(response()->json(
            [
                'error' => 'Building is not Active',
                'redirect' => 'select_flat_screen',
            ], 422));
        }

        if ($user->flat && $user->flat->building && $user->flat->building->valid_till < Carbon::now()) {
            abort(response()->json(
                [
                    'error' => 'Building validity is expired',
                    'redirect' => 'select_flat_screen',
                ], 422));
        }
        
        return $next($request);
    }
}
