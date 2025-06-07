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

    public function income_and_expenditure(Request $request)
    {
        $building = Auth::User()->building;
        $transactionsQuery = Transaction::where('building_id', $building->id);

        // Filter by model and model_id
        if ($request->filled('model')) {
            $transactionsQuery->where('model', $request->model);

            if ($request->filled('model_id')) {
                $transactionsQuery->where('model_id', $request->model_id);
            }
        }

        // Filter by from_date and to_date
        if ($request->filled('from_date')) {
            $transactionsQuery->whereDate('created_at', '>=', $request->from_date);
        }

        if ($request->filled('to_date')) {
            $transactionsQuery->whereDate('created_at', '<=', $request->to_date);
        }

        $transactions = $transactionsQuery->orderBy('date','desc')->get();

        // Initialize totals
        $total_debit = 0;
        $total_credit = 0;
        $inhand = 0;
        $inbank = 0;

        foreach ($transactions as $transaction) {
            if ($transaction->type == 'Debit') {
                $total_debit += $transaction->amount;
            } elseif ($transaction->type == 'Credit') {
                $total_credit += $transaction->amount;
            }

            // Separate logic for inhand and inbank
            if ($transaction->payment_type == 'InHand') {
                $inhand += ($transaction->type == 'Credit' ? $transaction->amount : -$transaction->amount);
            } elseif ($transaction->payment_type == 'InBank') {
                $inbank += ($transaction->type == 'Credit' ? $transaction->amount : -$transaction->amount);
            }
        }
        return view('admin.account.statement.income_and_expenditure',compact('transactions','inhand','inbank','total_debit','total_credit'));
    }

    public function payment()
    {
        $user = Auth::User();
        $building = $user->building;
        $expenses = $building->expenses()->where('type','Debit')->orderBy('date','desc')->get();
        return view('admin.account.forms.payment',compact('expenses'));
    }

    public function reciept()
    {
        $user = Auth::User();
        $building = $user->building;
        $expenses = $building->expenses()->where('type','Credit')->orderBy('date','desc')->get();
        return view('admin.account.forms.reciept',compact('expenses'));
    }

    public function manage_maintenance()
    {
        $user = Auth::User();
        $building = $user->building;
        $maintenances = $building->maintenance_payments()->orderBy('date','desc')->get();
        return view('admin.account.maintenance.manage_maintenance',compact('maintenances'));
    }

}
