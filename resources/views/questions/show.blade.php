@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-1">
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
            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel heading" style="text-align: center;">
                        <h2>{{ $question->followers_count }}</h2>
                        <span>关注者</span>
                    </div>
                    <div class="panel-body">
                      {{--  <a href="{{ route('questions.follow',['question'=>$question->id]) }}" class="btn btn-default {{ Auth::user()->followed($question->id)?'btn-success':'' }}">
                            {{ Auth::user()->followed($question->id)?'已关注':'关注该问题' }}
                        </a>--}}
                        <question-follow-button question="{{ $question->id }}"></question-follow-button>
                        <a href="#editor" class="btn btn-primary pull-right">撰写答案</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h4>关于作者</h4>
                    </div>
                    <div class="panel-body">
                        <div class="media">
                            <div class="media-left media-middle">
                                <a href="#">
                                    <img src="{{ $question->user->avatar }}" alt="{{ $question->user->name }}" width="36">
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="##">{{ $question->user->name }}</a></h4>
                            </div>
                        </div>
                        <div class="user-statics">
                            <div class="statics-item text-center">
                                <div class="statics-text">问题</div>
                                <div class="statics-count">{{ $question->user->question_count }}</div>
                            </div>
                            <div class="statics-item text-center">
                                <div class="statics-text">回答</div>
                                <div class="statics-count">{{ $question->user->answers_count }}</div>
                            </div>
                            <div class="statics-item text-center">
                                <div class="statics-text">关注者</div>
                                <div class="statics-count">{{ $question->user->followers_count }}</div>
                            </div>
                        </div>
                        <user-follow-button user="{{ $question->user->id }}"></user-follow-button>
                        <a href="###" class="btn btn-default pull-right">发送私信</a>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-md-offset-1">
                <div class="panel panel-default">
                    <div class="panel-heading">
                       {{ $question->answers->count() }}个答案
                    </div>
                    <div class="panel-body">
                        @foreach($question->answers as $answer)
                            <div class="media">
                                <div class="media-left media-middle">
                                    <user-vote-button answer="{{ $answer->id }}" count="{{ $answer->votes_count }}"></user-vote-button>
                                </div>
                                <div class="media-body">
                                    <h4 class="media-heading"><a href="/user/{{ $answer->user->id }}">{{ $answer->user->name }}</a></h4>
                                    <p>{!! $answer->body !!}</p>
                                </div>
                            </div>
                        @endforeach
                        @if(Auth::check())
                                <form method="post" action="{{ route('questions.answer',['question'=>$question->id]) }}" id="editor">
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