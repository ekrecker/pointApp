<template>
  <form @submit.prevent="createPoint">
    <div v-if="errors.length != 0">
      <ul v-for="error in errors" :key="error">
        <li><font color="red">{{ error }}</font></li>
      </ul>
    </div>
    <div>
      <label>送りたい人</label>
      <input v-model="point.receiver" type="text">
    </div>
    <div>
      <label>発揮したマインド</label>
      <input v-model="point.mindtype" type="text">
    </div>
    <div>
      <label>コメント</label>
      <input v-model="point.comment" type="text">
    </div>
    <button type="submit">送る</button>
  </form>
</template>

<script>
import axios from 'axios'
export default ({
  data: function() {
    return {
      point: {
        sender: 'hoge',
        receiver: '',
        mindtype: '',
        comment: '',
        reply: '',
        likes: 0 
      },
      errors: ''
    }
  },
  methods: {
    createPoint: function() {
      axios
        .post('/api/v1/points', this.point)
        .then(response => {
          let point = response.data;
          this.$router.push({ name: 'PointDetailPage', params: {id: point.id } });
        })
        .catch(error => {
          console.error(error);
          if(error.response.data && error.response.data.errors) {
            this.error = error.response.data.errors
          }
        });
    }
  }
})
</script>
