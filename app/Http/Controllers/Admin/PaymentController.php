<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Event;
use App\Models\Payment;
use \Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class PaymentController extends Controller
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
            'event_id' => 'required|exists:events,id',
            'user_id' => 'required|exists:users,id',
            'type' => 'required|in:Cash,Online',
            'amount' => 'required',
            'status' => 'required|in:Paid,Unpaid',
        ];
    
        $msg = 'Payment added Susccessfully';
        $payment = new Payment();
    
        if ($request->id) {
            $payment = Payment::withTrashed()->find($request->id);
            $msg = 'Payment added Susccessfully';
        }
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return redirect()->back()->with('error', $validation->errors()->first());
        }
        
        $payment->event_id = $request->event_id;
        $payment->user_id = $request->user_id;
        $payment->type = $request->type;
        $payment->amount = $request->amount;
        $payment->status = $request->status;
        $payment->save();
    
        return redirect()->back()->with('success', $msg);
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
        $payment = Payment::where('id',$id)->withTrashed()->first();
        if($request->action == 'delete'){
            $payment->delete();
        }else{
            $payment->restore();
        }
        return response()->json([
            'msg' => 'success'
        ],200);
    }
}
