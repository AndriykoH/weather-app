<template>
  <main>
    <div class="container">
      <div
        style="
          padding: 20px;
          text-align: left;
          width: 100%;
          max-width: 1200px;
          min-width: 300px;
        "
      >
        <div class="tabRow">
          <div class="tab" :class="activeTab == 0 ? 'activeTab' : ''" @click="activeTab = 0">Головна</div>
          <div class="tab" :class="activeTab == 1 ? 'activeTab' : ''" @click="activeTab = 1">Обране</div>
        </div>
        <main-content v-if="activeTab == 0" />
        <choosed-city v-if="activeTab == 1" />
      </div>
    </div>
  </main>
</template>

<script>
import ChoosedCity from './choosedCity.vue';
import mainContent from "./mainContent.vue";
export default {
  components: { mainContent, ChoosedCity },
  data: () => ({
    activeTab: 0,
  }),
};
</script>

<style scoped>
.tabRow {
  display: flex;
  align-items: center;
  justify-content: start;
}
.tab {
  height: max-content;
  width: max-content;
  padding: 10px 15px;
  border-radius: 5px;
  font-size: 16px;
  color: #3badf6;
  margin-right: 20px;
  cursor: pointer;
  user-select: none;
  background: white;
  border: 1px solid #3badf6;
}
.activeTab {
  background: #3badf6 !important;
  color: white;
}
.tab:hover {
  background: #329cde;
  color: white;
}
.container {
  min-height: 100svh;
  display: flex;
  justify-content: center;
}
</style>