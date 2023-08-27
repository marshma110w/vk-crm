<template>
  <div class="post" v-for="post in posts">
    <div>Название: {{ post.title }}</div>
    <div>Описание: {{ post.body}}</div>
  </div>
</template>

<script>
export default {
  
}
</script>

<style>

.post  {
  padding: 20px;
  margin-top: 15px;
  border: 2px solid rebeccapurple;
  border-radius: 10px;
}
</style>
