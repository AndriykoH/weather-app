<template>
  <div
    class="weatherCard"
    :style="
      weather?.weather?.[0]?.main == 'Clear'
        ? 'background: #FFA500'
        : weather?.weather?.[0]?.main == 'Clouds'
        ? 'background: #b0c4de'
        : weather?.weather?.[0]?.main == 'Rain'
        ? 'background: #0000FF'
        : weather?.weather?.[0]?.main == 'Drizzle'
        ? 'background: #778899'
        : weather?.weather?.[0]?.main == 'Snow'
        ? 'background: #ADD8E6'
        : 'background: #FFD700'
    "
  >
    <div
      style="
        display: flex;
        align-items: center;
        padding: 0px 30px;
        width: calc(100% - 60px);
      "
    >
      <p style="font-size: 30px; color: white">
        {{ parseInt(weather?.main?.temp - 273.15) }} °C
      </p>
      <div
        style="margin-left: auto; width: 28px; height: 28px; cursor: pointer"
      >
        <img
          v-if="!isChoose"
          src="@/assets/img/heartEmpty.png"
          width="28px"
          height="28px"
          alt="like"
          @click="$emit('addToChoose', weather.id, weather.name)"
        />
        <img
          v-else
          src="@/assets/img/heartFilled.png"
          width="28px"
          height="28px"
          alt="like"
          @click="$emit('removeToChoose', weather.id)"
        />
      </div>
    </div>
    <div
      style="display: flex; align-items: center; padding: 0px 30px; width: 90%"
    >
      <div>
        <p
          style="
            margin-left: auto;
            font-size: 24px;
            margin-bottom: 4px;
            color: white;
          "
        >
          {{ weather?.name }}
        </p>
        <p
          style="
            font-size: 20px;
            text-transform: capitalize;
            color: white;
            margin: 0px;
          "
        >
          {{ weather?.weather?.[0]?.description }}
        </p>
      </div>
      <div style="margin-left: auto; width: max-content; height: 150px">
        <img
          src="@/assets/img/weatherIcon/cloud.png"
          alt="Weather Icon"
          width="200px"
          height="150px"
          v-if="weather?.weather?.[0]?.main == 'Clouds'"
          style="object-fit: cover"
        />
        <img
          src="@/assets/img/weatherIcon/sun.png"
          alt="Weather Icon"
          width="180px"
          height="150px"
          v-else-if="weather?.weather?.[0]?.main == 'Clear'"
          style="object-fit: cover"
        />
        <img
          src="@/assets/img/weatherIcon/drizzle.png"
          alt="Weather Icon"
          width="200px"
          height="150px"
          v-else-if="weather?.weather?.[0]?.main == 'Drizzle'"
          style="object-fit: cover"
        />
        <img
          src="@/assets/img/weatherIcon/softRain.png"
          alt="Weather Icon"
          width="200px"
          height="150px"
          v-else-if="weather?.weather?.[0]?.main == 'Rain'"
          style="object-fit: cover"
        />
        <img
          src="@/assets/img/weatherIcon/snow.png"
          alt="Weather Icon"
          width="150px"
          height="140px"
          v-else-if="weather?.weather?.[0]?.main == 'Snow'"
          style="object-fit: cover"
        />
        <img
          :src="`http://openweathermap.org/img/wn/${weather?.weather?.[0]?.icon}.png`"
          alt="Weather Icon"
          width="150px"
          height="140px"
          v-else
          style="object-fit: cover"
        />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    weather: {
      require: true,
    },
    isChoose: {
      require: false,
    },
  },
};
</script>

<style scoped>
.weatherCard {
  width: 50%;
  border-radius: 20px;
  height: max-content;
  background: #b0c4de;
  user-select: none;
  box-shadow: 5px 5px 10px 0px silver;
}
</style>