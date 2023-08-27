<template>
  <div>
    <form @submit.prevent class="form">
      <input
        v-bind:value="title"
        @input="title = $event.target.value"
        class="input" type="text"
        placeholder="Name"
      >
      <input
        v-bind:value="body"
        @input="body = $event.target.value"
        class="input"
        type="text"
        placeholder="Description"
      >
      <button
        @click="createPost"
        class="btn"
      >
        Создать
      </button>
    </form>
  </div>
</template>

<script>
export default {
  
}
</script>

<style>

.form {
  display: flex;
  flex-direction: column;
}

.btn {
  margin-top: 15px;
  align-self: flex-end;
  padding: 10px 15px;
  background: none;
  color: black;
  border: 1px solid red;
  border-radius: 5px;
}



.input {
  width: 100%;
  padding: 10px 15px;
  margin-top: 10px;
  border: 1px solid rebeccapurple;
  border-radius: 5px;
}
</style>