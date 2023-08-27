<template>
  <div class="messagesList">
    <div class="listHeader">
      <h2>Последние сообщения клиентов Alver</h2>
    </div>
    <div class="message" v-for="message in messages" :key="message.id">
      <div>Автор: {{ message.client_id }}</div>
      <div>Текст сообщения: {{ message.body}}</div>
    </div>
  </div>
</template>

<script>
  export default {
    props: {
      messages: {
        type: Array,
        required: true
      }
    },
  }

</script>

<style>
  .messagesList {
    width: 20%
  }

  .message  {
    padding: 20px;
    margin-top: 15px;
    border: 2px solid rebeccapurple;
    border-radius: 10px;
  }
</style>
