<template>
  <div class="login">
    <form @submit.prevent="login">
      <label>Username : </label>
      <input type="text" v-model="username" /> {{ username }}<br />
      <label>Password : </label>
      <input type="password" v-model="password" /> {{ password }}<br />
      <button>Login</button>
    </form>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      username: "",
      password: ""
    };
  },
  methods: {
    async login() {
      let jsonObj = JSON.stringify({
        username: this.username,
        password: this.password
      });

      let result = await axios.post("http:///login", jsonObj, {
        withCredentials: true,
        headers: {
          // Overwrite Axios's automatically set Content-Type
          "Content-Type": "application/json"
        }
      });
      console.log(result.data);
    }
  }
};
</script>

<style>
</style>