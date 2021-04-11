<template>
  <div id="app">
    <table>
      <tbody>
        <tr>
          <th>ID</th>
          <th>sender</th>
          <th>receiver</th>
          <th>mindtype</th>
          <th>comment</th>
          <th>reply</th>
          <th>likes</th>
        </tr>
        <tr v-for="p in points" :key="p.id">
          <td>{{ p.id }}</td>
          <td>{{ p.sender }}</td>
          <td>{{ p.receiver }}</td>
          <td>{{ p.mindtype }}</td>
          <td>{{ p.comment }}</td>
          <td>{{ p.reply }}</td>
          <td>{{ p.likes }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
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