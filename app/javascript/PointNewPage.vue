<template>
  <v-form
    ref="form"
    v-model="valid"
    lazy-validation
  >
    <v-text-field
      v-model="point.receiver"
      label="送りたい人"
      :rules="rule"
      required
    ></v-text-field>
    <v-select
     v-model="point.mindtype"
     :items="mindtype"
     :menu-props="{ top: true, offsetY: true }"
     :rules="[v => !!v || '必ず選択してください']"
     label="発揮したマインド"
     required
    ></v-select>
    <v-textarea
      v-model="point.comment"
      outlined rows="5"
      label="コメント"
      :rules="rule"
    ></v-textarea>

    <v-checkbox
      v-model="checkbox"
      :rules="[v => !!v || 'チェックしてください']"
      label="この内容でおくりますか?"
      required
    ></v-checkbox>

    <v-btn
      :disabled="!valid"
      color="success"
      class="mr-4"
      @click="createPoint"
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
      rule: [
        v => !!v || '必ず入力してください'
      ],
      checkbox: false,
      mindtype: [
        'TEAMWORK',
        'SPEEDY',
        'INSIGHT',
        'HERO',
        'PROFESSIONAL'
      ],
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
    validate: function () {
      return this.$refs.form.validate()
    },
    reset: function () {
      this.$refs.form.reset()
    },
    createPoint: function() {
      if(this.validate()){
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
  }
})
</script>
