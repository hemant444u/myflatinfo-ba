<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Comment;
use App\Models\Reply;
use Auth;

class CommentController extends Controller
{
    public function addComment(Request $request)
    {
        $rules = [
            'issue_id' => 'required|exists:issues,id',
            'text' => 'required',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ],422);
        }
        $comment = new Comment();
        $comment->issue_id = $request->issue_id;
        $comment->user_id = Auth::id();
        $comment->text = $request->text;
        $comment->save();

        return response()->json([
            'status' => 'success',
            'html' => view('partials.comment', compact('comment'))->render()
        ]);
    }

    public function addReply(Request $request)
    {
        $rules = [
            'comment_id' => 'required|exists:comments,id',
            'text' => 'required',
        ];
    
        $validation = \Validator::make($request->all(), $rules);
    
        if ($validation->fails()) {
            return response()->json([
                'status' => 'error',
                'error' => $validation->errors()->first()
            ],422);
        }
        
        $reply = new Reply();
        $reply->comment_id = $request->comment_id;
        $reply->user_id = Auth::id();
        $reply->text = $request->text;
        $reply->save();

        return response()->json([
            'status' => 'success',
            'html' => view('partials.reply', compact('reply'))->render()
        ]);
    }
}
