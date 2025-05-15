@extends('layouts.admin')

@section('title')
    Issue Details
@endsection

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Issue Details</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Issue Details</li>
            </ol>
          </div>
        </div>
      </div>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
            <div class="card card-primary card-outline">
              <div class="card-body box-profile">
                <div class="text-center">
                  <img class="profile-user-img img-fluid img-circle"
                       src="{{$issue->photos[0]->photo}}"
                       alt="Issue picture">
                </div>

                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Building</b> <a class="float-right">{{$issue->building->name}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Block</b> <a class="float-right">{{$issue->block ? $issue->block->name : 'All'}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Flat</b> <a class="float-right">{{$issue->flat ? $issue->flat->name : 'All'}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Department</b> <a class="float-right">{{$issue->department->name}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Priority</b> <a class="float-right">{{$issue->periority}}</a>
                  </li>
                  <li class="list-group-item">
                    <b>Status</b><a class="float-right">{{$issue->status}}</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          
          <div class="col-md-9">
              <div class="card">
                  <div class="card-header">
                      <span class="badge badge-default">{{$issue->department->name}}</span>
                      <span class="badge badge-primary">{{$issue->status}}</span>
                  </div>
                  <div class="card-body">
                      <p>{{$issue->desc}}</p>
                      <div class="row">
                          @forelse($issue->photos as $photo)
                          <div class="col-md-4 d-flex align-items-center justify-content-center" style="border:1px solid #ddd;">
                          <img src="{{$photo->photo}}" class="img-fluid w-100">
                          </div>
                          @empty
                          @endforelse
                      </div>

                      <!-- Comment Section -->
                      <div class="mt-4">
                          <h4>Comments</h4>
                          
                          <ul id="commentList" class="list-unstyled mt-3">
                              @forelse($issue->comments as $comment)
                                  <li class="media mb-3" data-id="{{$comment->id}}">
                                      <img class="mr-3 rounded-circle" src="{{$comment->user->photo }}" width="40">
                                      <div class="media-body">
                                          <h6 class="mt-0 mb-1">{{$comment->user->name}}</h6>
                                          <p>{{$comment->text}}</p>
                                          <small class="text-muted">{{ $comment->created_at->diffForHumans() }}</small>
                                          <a href="javascript:void(0);" class="reply-link text-primary" data-id="{{$comment->id}}">Reply</a>
                                          <ul class="list-unstyled ml-4 mt-2">
                                              @forelse($comment->replies as $reply)
                                                  <li class="media mb-2">
                                                      <img class="mr-3 rounded-circle" src="{{ $reply->user->photo }}" width="30">
                                                      <div class="media-body">
                                                          <h6 class="mt-0 mb-1">{{$reply->user->name}}</h6>
                                                          <p>{{$reply->text}}</p>
                                                          <small class="text-muted">{{ $reply->created_at->diffForHumans() }}</small>
                                                      </div>
                                                  </li>
                                              @empty
                                              @endforelse
                                          </ul>
                                          <div class="reply-box mt-2" style="display: none;">
                                              <textarea class="form-control mb-2 replyText"></textarea>
                                              <button class="btn btn-sm btn-primary replyBtn" data-id="{{$comment->id}}">Reply</button>
                                          </div>
                                      </div>
                                  </li>
                              @empty
                              
                              @endforelse
                          </ul>
                          <textarea id="commentText" class="form-control mb-2" placeholder="Write a comment..."></textarea>
                          <button class="btn btn-primary" id="addComment">Post</button>
                      </div>
                  </div>
              </div>
          </div>
        </div>
      </div>
    </section>

@section('script')
<script>
  $(document).ready(function(){
      var token = "{{ csrf_token() }}";

      // Post a new comment
      $('#addComment').click(function(){
          var text = $('#commentText').val();
          if(text.trim() !== ''){
              $.post('{{ url("add-comment") }}', {_token: token, issue_id: {{ $issue->id }}, text: text}, function(response){
                  if(response.status == 'success'){
                      $('#commentList').prepend(response.html);
                      $('#commentText').val('');
                  }
              }, 'json');
          }
      });

      // Show reply box
      $(document).on('click', '.reply-link', function(){
          $(this).siblings('.reply-box').toggle();
      });

      // Post a reply
      $(document).on('click', '.replyBtn', function(){
          var commentId = $(this).data('id');
          var text = $(this).siblings('.replyText').val();
          if(text.trim() !== ''){
              $.post('{{ url("add-reply") }}', {_token: token, comment_id: commentId, text: text}, function(response){
                  if(response.status == 'success'){
                      $('li[data-id="'+commentId+'"] ul').append(response.html);
                      $('.replyText').val('');
                  }
              }, 'json');
          }
      });

  });
</script>
@endsection

@endsection
