<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Block;
use App\Models\Building;
use App\Models\Flat;
use \Auth;

class FundController extends Controller
{

    public function society_fund()
    {
        $building = Auth::User()->building;
        return view('admin.fund.index',compact('building'));
    }
    
    public function get_expenses()
    {
        $building = Auth::User()->building;
        return view('partials.expenses',compact('building'));
    }
    public function get_maintenance_funds()
    {
        $building = Auth::User()->building;
        return view('partials.maintenance_funds',compact('building'));
    }
    public function get_event_funds()
    {
        $building = Auth::User()->building;
        return view('partials.event_funds',compact('building'));
    }
    public function get_corpus_funds()
    {
        $building = Auth::User()->building;
        return view('partials.corpus_funds',compact('building'));
    }
    public function get_reciepts()
    {
        $building = Auth::User()->building;
        return view('partials.reciepts',compact('building'));
    }


    
}
