<template>
  <v-form
    ref="form"
    v-model="valid"
    lazy-validation
  >
    <v-text-field
      v-model="point.receiver"
      label="送りたい人"
      required
    ></v-text-field>
    <v-text-field
      v-model="point.mindtype"
      label="発揮したマインド"
      required
    ></v-text-field>
    <v-text-field
      v-model="point.comment"
      label="コメント"
      required
    ></v-text-field>

    <v-btn
      :disabled="!valid"
      color="success"
      class="mr-4"
      @click="validate"
      v-on:submit.prevent="createPoint"
    >
      ポイントをおくる
    </v-btn>

    <v-btn
      color="error"
      class="mr-4"
      @click="reset"
    >
      フォームクリア
    </v-btn>
  </v-form>
</template>

<script>
import axios from 'axios'
export default ({
  data: function() {
    return {
      valid: true,
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
    validate : function () {
      this.$refs.form.validate()
    },
    reset: function () {
      this.$refs.form.reset()
    },
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
