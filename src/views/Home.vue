<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <form @submit.prevent="register">
      <label>Username : </label>
      <input type="text" v-model="username" /><br />
      <label>Password : </label>
      <input type="password" v-model="password" /><br />
      <button>Register</button>
    </form>
    <!-- <HelloWorld msg="Welcome to Your Vue.js App" /> -->
  </div>
</template>

<script>
// @ is an alias to /src
import axios from "axios";
export default {
  name: "Home",
  data() {
    return {
      username: "",
      password: ""
    };
  },
  methods: {
    async register() {
      let obj = {
        username: this.username,
        password: this.password
      };
      let jsonData = JSON.stringify(obj);
      console.log(jsonData);
      let result = await axios.post(
        "http://api.iternship.net:3000/register",
        jsonData,
        {
          headers: {
            // Overwrite Axios's automatically set Content-Type
            "Content-Type": "application/json"
          },
          withCredentials: true
        }
      );
      alert(result.data.msg);
      console.log(result.data);
    }
  }
};
</script>
