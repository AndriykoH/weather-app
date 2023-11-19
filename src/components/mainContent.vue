<template>
  <div class="mainContentBackground">
    <div style="display: flex; align-items: center">
      <div>
        <input
          list="cityList"
          class="cityAutocomplete"
          @input="searchCity"
          v-model="city.name"
        />
        <div class="cityList" v-if="cityList.length > 0">
          <p
            v-for="_city in cityList"
            :key="_city.name"
            @click="(city = _city), (cityList = []), (showLoader = true)"
            style="font-size: 18px; margin-bottom: 10px; cursor: pointer"
          >
            {{ _city?.local_names?.["uk"] }}
          </p>
        </div>
      </div>
    </div>
    <div
      style="
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 40svh;
      "
    >
      <loader v-if="showLoader" />
      <weather-card
        :weather="weather"
        :isChoose="isChoose"
        @addToChoose="addToChoose"
        @removeToChoose="removeToChoose"
        v-else-if="Object.values(weather).length > 10"
      />
      <div v-else style="font-size: 22px">Введіть будь ласка ваше місто</div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import weatherCard from "./weatherCard.vue";
import Loader from "./UI/Loader.vue";
export default {
  components: { weatherCard, Loader },
  data: () => ({
    cityList: [],
    isChoose: false,
    showLoader: true,
    weather: {},
    city: {},
    timeout: null,
  }),
  mounted() {
    this.getUserIP();
  },
  methods: {
    async getUserIP() {
      axios
        .get("https://api.ipify.org?format=json")
        .then((response) => {
          const ipAddress = response.data.ip;
          axios
            .get(` https://api.ipapi.is/?q=${ipAddress}&key=8bfd224101bfd0af`)
            .then((response) => {
              let res = response.data;
              this.city = {
                name: res.location.city,
                lat: res.location.latitude,
                lon: res.location.longitude,
              };
            })
            .catch(() => {
              this.showLoader = false;
            });
        })
        .catch((error) => {
          this.isLoading = false;
          this.error = error.message;
        });
    },
    async searchCity(event) {
      let city = event.srcElement._value + event.data;
      if (city !== "") {
        clearTimeout(this.timeout);
        this.timeout = setTimeout(async () => {
          await axios
            .get(
              `http://api.openweathermap.org/geo/1.0/direct?q=${city}&appid=9fb5b79525964f9dd610d8d3dd80f9d3`
            )
            .then((res) => {
              if (res.status == 200) {
                this.cityList = res.data;
              }
            });
        }, 200);
      }
    },
    async getWeather() {
      await axios
        .get(
          `https://api.openweathermap.org/data/2.5/weather?lat=${this.city.lat}&lon=${this.city.lon}&lang=ua&appid=9fb5b79525964f9dd610d8d3dd80f9d3`
        )
        .then((res) => {
          if (res.status == 200) {
            this.weather = res.data;
            let choosedCity = JSON.parse(localStorage.getItem("choosedCity"));
            if (choosedCity && choosedCity.length > 0) {
              choosedCity.filter((city) => city.id == this.weather.id).length >
              0
                ? (this.isChoose = true)
                : (this.isChoose = false);
            }

            setTimeout(() => {
              this.showLoader = false;
            }, 500);
          }
        });
    },
    addToChoose(id, name) {
      let choosedList = JSON.parse(localStorage.getItem("choosedCity")) || [];
      choosedList.push({ id: id, name: name });
      localStorage.setItem("choosedCity", JSON.stringify(choosedList));
      this.isChoose = true;
    },
    removeToChoose(id) {
      let choosedList = JSON.parse(localStorage.getItem("choosedCity")) || [];
      choosedList = choosedList.filter((item) => item.id !== id);
      localStorage.setItem("choosedCity", JSON.stringify(choosedList));
      this.isChoose = false;
    },
  },
  watch: {
    city: {
      deep: true,
      handler() {
        if (this.city && this.city.lat && this.city.lon) {
          this.getWeather();
        }
      },
    },
  },
};
</script>

<style scoped>
.mainContentBackground {
  padding: 20px;
  margin: 20px 0px;
}
.cityAutocomplete {
  width: 30svw;
  height: 40px;
  border-radius: 10px;
  font-size: 18px;
  border-color: #3badf6;
  padding: 0px 10px;
}
.cityList {
  width: 30svw;
  height: max-content;
  background: white;
  position: absolute;
  z-index: 100;
  padding: 0px 10px 5px 10px;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  box-shadow: 3px 10px 20px 0px rgba(0, 0, 0, 0.3);
}
</style>