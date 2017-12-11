@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
           @foreach($questions as $question)
                <div class="media">
                    <div class="media-left media-middle">
                        <a href="#">
                            <img width="64" class="media-object" src="{{ $question->user->avatar }}" alt="{{ $question->user->name }}">
                        </a>
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading"><a href="/questions/{{ $question->id }}">{{ $question->title }}</a></h4>
                    </div>
                </div>
               @endforeach
        </div>
    </div>
@endsection
