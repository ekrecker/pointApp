<template>
  <div class="index">
    <h2>マイページ {{ user.username }}</h2>
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
      points: [], 
      user: []
    }
  },
  mounted () {
    axios 
      .get('/api/v1/points.json')
      .then(response => (this.points = response.data))

    axios 
      .get('/api/v1/users/get_current_user.json')
      .then(response => (this.user = response.data))
  }
}
</script>

<style scoped>
</style>