<template>
  <div id="app">
    <Header />
    <main-component />
  </div>
</template>

<script>
import Header from "./components/Header.vue";
import MainComponent from "./components/mainComponent.vue";
export default {
  name: "App",
  components: { MainComponent, Header },
};
</script>

<style>
</style>
