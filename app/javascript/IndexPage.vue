<template>
  <div id="app">
    <v-app>
      <customHeader />
    </v-app>
  </div>
</template>

<script>
import axios from 'axios';
import customHeader from 'header.vue'

export default {
  components: {
    customHeader
  },
  data: function () {
    return {
      points: [] 
    }
  },
  mounted () {
    axios 
      .get('/api/v1/points.json')
      .then(response => (this.points = response.data))
  }
}
</script>

<style scoped>
</style>