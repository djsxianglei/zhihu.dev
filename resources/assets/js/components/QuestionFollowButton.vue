<template>
    <button
            class="btn btn-default"
            v-text="text"
            v-on:click="follow"
            v-bind:class="{'btn-success':followed}"
    ></button>
</template>

<script>
    export default {
        props:['question','user'],
        mounted() {
            var that = this;
            axios.post('/api/question/follower', {
                    'question':this.question
                })
                .then(function (response) {
                    that.followed = response.data.followed;
                })
                .catch(function (error) {
                    console.log(error);
                });

        },
        data(){
            return {
                followed:false
            }
        },
        computed:{
            text(){
                return this.followed?'已关注':'关注该问题'
            }
        },
        methods:{
            follow(){
                var that = this;
                axios.post('/api/question/follow', {
                        'question':this.question
                    })
                    .then(function (response) {
                        that.followed = response.data.followed;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        }
    }
</script>
