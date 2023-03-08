<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <form @submit.prevent="register">
      <label>Firstname : </label>
      <input type="text" v-model="fname" /><br />
      <label>Lastname : </label>
      <input type="text" v-model="lname" /><br />
      <label>Email : </label>
      <input type="email" v-model="email" /><br />
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
      fname: "",
      lname: "",
      email: "",
      username: "",
      password: ""
    };
  },
  methods: {
    async register() {
      let obj = {
        fname: this.fname,
        lname: this.lname,
        email: this.email,
        username: this.username,
        password: this.password
      };
      let jsonData = JSON.stringify(obj);
      console.log(jsonData);
      let result = await axios.post(
        "http:///register",
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
  // async mounted() {
  //   let obj = {
  //     username: "art", //Mockup username
  //     password: "TaninchotNaja" //Mockup password
  //   };
  //   let jsonData = JSON.stringify(obj);
  //   let result = await axios.post(
  //     "http://localhost:9000/login",
  //     { jsonData },
  //     { withCredentials: true }
  //   );
  //   console.log(result.data);
  // }
};
</script>
