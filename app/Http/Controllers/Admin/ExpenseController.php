<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Expense;
use App\Models\Transaction;

use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;

class ExpenseController extends Controller
{

    public function index()
    {
        $building = Auth::User()->building;
        return view('admin.expenses.index',compact('building'));
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
            'image' => 'nullable|image'
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
            return redirect()->back()->with('error',$validation->errors()->first());
        }
        $user = Auth::User();
        $expense->user_id = $user->id;
        $expense->building_id = $user->building_id;
        $expense->reason = $request->reason;
        $expense->date = $request->date;
        $expense->amount = $request->amount;
        if($request->hasFile('image')) {
            $file= $request->file('image');
            $allowedfileExtension=['jpeg','jpeg','png'];
            $extension = $file->getClientOriginalExtension();
            Storage::disk('s3')->delete($expense->getImageFilenameAttribute());
            $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $filename = 'images/expenses/' . uniqid() . '.' . $extension;
            Storage::disk('s3')->put($filename, file_get_contents($file));
            $expense->image = $filename;
        }
        $expense->save();

        $transaction = new Transaction();
        $transaction->building_id = $user->building_id;
        $transaction->user_id = $user->id;
        $transaction->model = 'Expense';
        $transaction->model_id = $expense->id;
        $transaction->type = 'Debit';
        $transaction->payment_type = 'BA';
        $transaction->amount = $expense->amount;
        $transaction->reciept_no = 'EXPS'.rand(10000000,99999999);
        $transaction->desc = $expense->reason;
        $transaction->status = 'Success';
        $transaction->save();
    
        return redirect()->back()->with('success',$msg);
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

    public function get_model_data(Request $request)
    {
        $model = $request->model;
        if($model == 'Booking'){
            $results = Facility::all();
        }else{
            $results = $model::where('building_id',$user->building_id)->get();
        }
        return view('admin.partials.model_data',compact('results'));
    }
}
