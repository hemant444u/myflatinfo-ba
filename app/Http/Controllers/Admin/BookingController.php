<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Booking;
use App\Models\Building;
use App\Models\Facility;
use \Auth;

class BookingController extends Controller
{

    public function index(Request $request)
    {
        $user = Auth::User();
        $building = $user->building;
        $query = Booking::where('building_id', $building->id);
        // Filter by model and model_id
        if ($request->filled('facility_id')) {
            $query->where('facility_id', $request->facility_id);
        }

        // Filter by from_date and to_date
        if ($request->filled('from_date')) {
            $query->whereDate('date', '>=', $request->from_date);
        }

        if ($request->filled('to_date')) {
            $query->whereDate('date', '<=', $request->to_date);
        }

        $bookings = $query->orderBy('date','desc')->get();
        $facilities = $building->facilities;
        return view('admin.booking.index',compact('bookings','facilities'));
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show($id)
    {
        //
    }
    
    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id, Request $request)
    {
        //
    }
}
