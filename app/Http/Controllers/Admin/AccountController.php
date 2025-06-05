<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Expense;
use App\Models\Transaction;
use App\Models\BuildingFacility;
use App\Models\Event;
use App\Models\Essential;

use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;

class AccountController extends Controller
{

    public function income_and_expenditure()
    {
        $building = Auth::User()->building;
        $expenses = $building->expenses()
        ->when($request->from_date, function ($query) use ($request) {
            $query->whereDate('date', '>=', $request->from_date);
        })
        ->when($request->to_date, function ($query) use ($request) {
            $query->whereDate('date', '<=', $request->to_date);
        })
        ->get();
        return view('admin.account.income_and_expenditure',compact('expenses'));
    }

}
