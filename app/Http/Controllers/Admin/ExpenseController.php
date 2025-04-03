<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Expense;

use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ExpenseController extends Controller
{

    public function index()
    {
        //
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        $rules = [
            'building_id' => 'required|exists:buildings,id',
            'reason' => 'required',
            'amount' => 'required',
            'date' => 'required',
        ];
    
        $msg = 'Expense added Susccessfully';
        $expense = new Expense();
    
        if ($request->id) {
            $expense = Expense::find($request->id);
            $msg = 'Expense updated Susccessfully';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            
            return response()->json([
                'error' => $validation->errors()->first()
            ],422);
        }
        $user = Auth::User();
        $expense->user_id = $user->id;
        $expense->building_id = $user->building_id;
        $expense->reason = $request->reason;
        $expense->date = $request->date;
        $expense->amount = $request->amount;
        $expense->save();
    
        return response()->json([
            'msg' => $msg
        ],200);
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
