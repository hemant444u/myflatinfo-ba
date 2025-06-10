<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

use \Auth;
use Carbon\Carbon;

class NoticeboardMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        $user = Auth::User();
        $building = $user->Building;
        if ($building && $building->hasPermission('feature.noticeboard')) {
            return $next($request);
        }
        return redirect('permission-denied')->with('error','Permission denied !');
    }
}
