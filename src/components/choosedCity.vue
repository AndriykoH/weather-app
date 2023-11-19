<template>
  <div>
    <Loader v-if="showLoader" />
    <div v-else-if="cityList.length > 0" style="margin-top: 32px">
      <div
        style="display: grid; place-items: center; margin-bottom: 32px"
        v-for="city in cityList"
        :key="city.id"
      >
        <weather-card
          :weather="city.weather"
          :isChoose="true"
          @removeToChoose="removeToChoose"
        />
      </div>
    </div>
    <div
      v-else
      style="
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 40svh;
        font-size: 22px;
      "
    >
      Ви не обрали жодного міста
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Loader from "./UI/Loader.vue";
import WeatherCard from "./weatherCard.vue";
export default {
  data: () => ({
    cityList: [],
    showLoader: true,
  }),
  mounted() {
    this.cityList = JSON.parse(localStorage.getItem("choosedCity"));
    this.getWeatherByCity();
  },
  methods: {
    async getWeatherByCity() {
      for (const city of this.cityList) {
        const weather = await this.getWeather(city.name);
        city.weather = weather;
      }
      this.showLoader = false;
    },
    async getWeather(city) {
      let weather = [];
      await axios
        .get(
          `https://api.openweathermap.org/data/2.5/weather?q=${city}&lang=ua&appid=9fb5b79525964f9dd610d8d3dd80f9d3`
        )
        .then((res) => {
          if (res.status == 200) {
            weather = res.data;
          }
        });
      return weather;
    },
    removeToChoose(id) {
      let choosedList = JSON.parse(localStorage.getItem("choosedCity")) || [];
      choosedList = choosedList.filter((item) => item.id !== id);
      localStorage.setItem("choosedCity", JSON.stringify(choosedList));
      this.cityList = this.cityList.filter((city) => city.id !== id);
    },
  },
  components: { Loader, WeatherCard },
};
</script>

<style>
</style>