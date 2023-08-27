<template>
  <div class="app">
  
  </div>
</template>

<script>
export default {
  data() {
    return {
      posts: [
        { id: 1, title: 'Cucumbers', body: 'Info about cucumbers'},
        { id: 2, title: 'Cucumbers 2', body: 'Info about cucumbers 2'},
        { id: 3, title: 'Cucumbers 3', body: 'Info about cucumbers 3'}
      ],
      title: '',
      body: ''
    }
  },

  created() {
    fetch('/')
    .then(response => response.json())
    .then(data => {
      this.messages = data.messages
      console.log(this.messages)
    })
  },

  methods: {
    createPost() {
      const newPost = {
        id: Date.now(),
        title: this.title,
        body: this.body
      }
      this.posts.push(newPost)
      this.title = ''
      this.body = ''
    }
  }

}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.app {
  padding: 20px 30px
}
</style>
