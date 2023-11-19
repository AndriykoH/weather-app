<template>
  <div style="height: 50svh; display: grid; place-items: center">
    <div class="loader" />
  </div>
</template>


<script>
export default {
  name: "LoaderComponent",
};
</script>

<style scoped>
.loader {
  border: 6px solid transparent;
  border-top: 6px solid #3498db;
  border-radius: 50%;
  width: 60px;
  height: 60px;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>