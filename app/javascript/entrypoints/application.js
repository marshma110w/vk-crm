import { createApp } from 'vue/dist/vue.esm-bundler';  
  
const app = createApp({  
  data() {  
    return {  
      someShit: 'Vue.js is here now!'  
    }  
  }  
})  
  
app.mount('#app');  
console.log("app", app);
