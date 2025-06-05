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
        return view('admin.account.income_and_expenditure',compact('building'));
    }

}
