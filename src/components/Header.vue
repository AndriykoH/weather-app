<template>
  <header class="header">
    <div style="display: flex; align-items: center">
      <img
        src="@/assets/img/logo.jpg"
        alt="logo"
        width="40px"
        height="40px"
        style="margin-right: 10px"
      />
      <span class="appName">Weather</span>
    </div>
  </header>
</template>
  
  <script>
export default {
  name: "HeaderComponent",
};
</script>
  
  <style scoped>
.header {
  display: grid;
  place-items: center;
  height: 60px;
  width: 100%;
  background: #ffffff;
  box-shadow: 0px 10px 20px 0px rgb(191, 191, 191, 0.3);
}
.appName {
    font-size: 26px;
    text-transform: uppercase;
    background: linear-gradient(to right, #F5841B 30%, #3BADF6);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    -webkit-text-stroke: .2px black;
    user-select: none;
}
</style>