<template>
  <div class="index">
  </div>
</template>

<script>
import axios from 'axios';
import customHeader from 'header.vue'
import PointNewPage from 'PointNewPage'

export default {
  components: {
    customHeader,
    PointNewPage
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