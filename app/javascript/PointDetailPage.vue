<template>
  <dl>
    <dt>ID</dt>
    <dd>{{ point.id }}</dd>
    <dt>sender</dt>
    <dd>{{ point.sender }}</dd>
    <dt>receiver</dt>
    <dd>{{ point.receiver }}</dd>
    <dt>comment</dt>
    <dd>{{ point.comment }}</dd>
  </dl>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      point: {}
    }
  },
  mounted () {
    axios
      .get(`/api/v1/points/${this.$route.params.id}.json`)
      .then(response => (this.point = response.data))
  }
}
</script>

<style scoped>
</style>