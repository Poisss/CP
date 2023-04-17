<script setup>
import HelloWorld from './components/HelloWorld.vue'
import HeaderM from './components/header.vue'
</script>

<template>
  <HeaderM/>
  <h1>Recent Activity</h1>
</template>

<style scoped>
h1{
  color: black;
  text-align: center;
}
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
