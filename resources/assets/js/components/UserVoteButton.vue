<template>
    <button
            class="btn btn-default"
            v-text="text"
            v-on:click="vote"
            v-bind:class="{'btn-primary':voted}"
    ></button>
</template>

<script>
    export default {
        props:['answer','count'],
        mounted() {
            var that = this;
            axios.post('/api/answer/votes/users', {
                    'answer':this.answer
                })
                .then(function (response) {
                    that.voted = response.data.voted;
                })
                .catch(function (error) {
                    console.log(error);
                });

        },
        data(){
            return {
                voted:false
            }
        },
        computed:{
            text(){
                return this.count;
            }
        },
        methods:{
            vote(){
                var that = this;
                axios.post('/api/answer/vote', {
                        'answer':this.answer
                    })
                    .then(function (response) {
                        that.voted = response.data.voted;
                        that.voted ? that.count++:that.count--;
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            }
        }
    }
</script>
