@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        {{ $question->title }}
                        @foreach($question->topics as $topic)
                            <a class="topic" href="/topic/{{ $topic->id }}">{{ $topic->name }}</a>
                            @endforeach
                    </div>

                    <div class="panel-body content">
                        {!! $question->body !!}

                    </div>
                    <div class="actions">
                        @if(Auth::check() && Auth::user()->owns($question))
                            <span class="edit"><a href="/questions/{{ $question->id }}/edit">编辑</a></span>
                            <form action="/questions/{{ $question->id }}" method="post" class="delete-form">
                                {{ method_field('DELETE') }}
                                {{ csrf_field() }}
                                <button class="button is-naked delete-button">删除</button>
                            </form>
                        @endif
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">
                       {{ $question->answers->count() }}个答案
                    </div>
                    <div class="panel-body">
                        @foreach($question->answers as $answer)
                            <div class="media">
                                <div class="media-left media-middle">
                                    <a href="#">
                                        <img width="64" class="media-object" src="{{ $answer->user->avatar }}" alt="{{ $answer->user->name }}">
                                    </a>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading"><a href="/user/{{ $answer->user->id }}">{{ $answer->user->name }}</a></h4>
                                    <p>{!! $answer->body !!}</p>
                                </div>
                            </div>
                        @endforeach
                        @if(Auth::check())
                                <form method="post" action="{{ route('questions.answer',['question'=>$question->id]) }}">
                                    <div class="form-group{{ $errors->has('body') ? ' has-error' : '' }}">
                                        <!-- 编辑器容器 -->
                                        <script id="body" name="body" type="text/plain">{!! old('body') !!}</script>
                                        @if ($errors->has('body'))
                                            <span class="help-block">
                                        <strong>{{ $errors->first('body') }}</strong>
                                    </span>
                                        @endif
                                    </div>
                                    {{ csrf_field() }}
                                    <button type="submit" class="btn btn-success pull-right">提交答案</button>
                                </form>
                            @else
                                <a href="{{ route('login') }}" class="btn btn-default btn-success btn-block">登陆</a>
                            @endif


                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('scripts')
    @include('vendor.ueditor.assets')
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('body', {
            toolbars: [
                ['bold', 'italic', 'underline', 'strikethrough', 'blockquote', 'insertunorderedlist', 'insertorderedlist', 'justifyleft','justifycenter', 'justifyright',  'link', 'insertimage', 'fullscreen']
            ],
            elementPathEnabled: false,
            enableContextMenu: false,
            autoClearEmptyNode:true,
            wordCount:false,
            imagePopup:false,
            autotypeset:{ indent: true,imageBlockLine: 'center' },
            initialFrameHeight:300
        });
    </script>
@endpush