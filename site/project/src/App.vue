<script setup>
import HeaderM from './components/header.vue'
import FooterM from './components/Footer.vue'

</script>

<template>
  <div class="block">
    <div >
      <HeaderM/>
    </div>
    <div>
      <router-view>
      </router-view>
    </div>
    <div>
      <FooterM/>
    </div>
  </div>
</template>

<style scoped>
h1{
  color: black;
  text-align: center;
}
.block{
  display: grid;
  grid-template-rows:auto 1fr auto;
  min-height: 100vh;
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
