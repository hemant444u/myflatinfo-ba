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

        $transactions = $transactionsQuery->get();

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
            if ($transaction->order_id == null) {
                $inhand += ($transaction->type == 'Credit' ? $transaction->amount : -$transaction->amount);
            } elseif ($transaction->order_id > 0) {
                $inbank += ($transaction->type == 'Credit' ? $transaction->amount : -$transaction->amount);
            }
        }
        return view('admin.account.income_and_expenditure',compact('transactions','inhand','inbank','total_debit','total_credit'));
    }

}
