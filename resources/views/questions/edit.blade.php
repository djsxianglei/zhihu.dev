@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">编辑问题</div>
                    <div class="panel-body">
                        <form method="post" action="{{ route('questions.update',['id'=>$question->id]) }}">
                            <div class="form-group{{ $errors->has('title') ? ' has-error' : '' }}">
                                <label for="title">标题</label>
                                <input type="text" class="form-control" name="title" value="{{ old('title',$question->title) }}" id="title" placeholder="请输入标题" autofocus>
                                @if ($errors->has('title'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('title') }}</strong>
                                    </span>
                                @endif
                            </div>
                            <div class="form-group">
                                <label class="title">选择相关话题</label>
                                <select class="select2 form-control" name="topics[]" multiple required>
                                    @foreach($question->topics as $topic)
                                        <option value="{{ $topic->id }}" selected> {{ $topic->name }}</option>
                                        @endforeach
                                </select>
                            </div>
                            <div class="form-group{{ $errors->has('body') ? ' has-error' : '' }}">
                                <label for="body">内容</label>
                                <!-- 编辑器容器 -->
                                <script id="container" name="body" type="text/plain">{!! old('body',$question->body) !!}</script>
                                @if ($errors->has('body'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('body') }}</strong>
                                    </span>
                                @endif
                            </div>
                            {{ csrf_field() }}
                            {{ method_field('put') }}
                            <button type="submit" class="btn btn-success pull-right">提交</button>
                        </form>
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
        var ue = UE.getEditor('container', {
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
        function formatTopic(topic) {
            return "<div class='select2-result-repository clearfix'>" +

            "<div class='select2-result-repository__meta'>" +

            "<div class='select2-result-repository__title'>" +

            topic.name ? topic.name : ""   +

                "</div></div></div>";
        }
        function formatTopicSelection (topic) {

            return topic.name || topic.text;

        }
        $('.select2').select2({
            tags:true,
            placeholder:'选择相关话题',
            minimumInputLength: 2,
            ajax:{
                url:'/api/topics',
                dataType:'json',
                delay:250,
                data:function (params) {
                    return {
                        q:params.term
                    }
                },
                processResults:function (data,params) {
                    return {
                        results:data
                    }
                },
                cache:true
            },
            templateResult:formatTopic,
            templateSelection: formatTopicSelection,
            escapeMarkup: function (markup) { return markup; }
        });
    </script>
@endpush
