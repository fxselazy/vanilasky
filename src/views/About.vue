<template>
  <h2>{{ message }}</h2>
  <button @click="logout">Logout</button>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      message: ""
    };
  },
  methods: {
    async logout() {
      console.log("Clicked");
      const result = await axios.get("http://:5555/logout", {
        withCredentials: true
      });
      console.log(result);
    }
  },
  async mounted() {
    let result = await axios.get("http://:5555/user", {
      withCredentials: true
    });
    this.message = result.data.msg;
  }
};
</script>

<style>
</style>