<template>
  <div class="app">
    <messages-list :messages="sortedMessages"></messages-list>
  </div>
</template>

<script>
  import MessagesList from './components/MessagesList.vue'
  export default {
    components: {
      MessagesList
    },

    data() {
      return {
        messages: []
      }
    },

    created() {
      fetch('/messages/messages_list')
      .then(response => response.json())
      .then(data => {
        this.messages = data.messages
      })
    },

    computed: {
      sortedMessages() {
        console.log(this.messages)
        return [...this.messages].sort((msg1, msg2) => msg2.created_at.localeCompare(msg1.created_at))
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
