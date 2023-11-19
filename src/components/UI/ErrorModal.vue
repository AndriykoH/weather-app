<template>
  <div class="dialog-overlay">
    <div class="dialog-box">
      <div style="display: flex; justify-content: center">
        <img
          src="@/assets/img/errorIcon.png"
          width="160px"
          height="160px"
          alt="error"
        />
      </div>
      <slot></slot>
      <p
        style="
          color: #828282;
          font-size: 16px;
          font-weight: 500;
          text-decoration-line: underline;
          cursor: pointer;
        "
        @click="$emit('close')"
      >
        Закрити
      </p>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
.dialog-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 1000;
}

.dialog-box {
  width: 500px;
  height: max-content;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #fff;
  padding: 20px 30px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
  text-align: center;
}
</style>