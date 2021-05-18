<template>
  <div class="timeline"> 
    <h2>タイムライン</h2>
    <v-card
      class="mx-auto"
      color="#26c6da"
      dark
      max-width="400"
    >
      <v-card-title>
        <span class="title font-weight-light">ポイント</span>
      </v-card-title>

      <v-card-text class="headline font-weight-bold">
        "Turns out semicolon-less style is easier and safer in TS because most gotcha edge cases are type invalid as well."
      </v-card-text>

      <v-card-actions>
        <v-list-item class="grow">
          <v-list-item-avatar color="grey darken-3">
            <v-img
              class="elevation-6"
              alt=""
              src="https://avataaars.io/?avatarStyle=Transparent&topType=ShortHairShortCurly&accessoriesType=Prescription02&hairColor=Black&facialHairType=Blank&clotheType=Hoodie&clotheColor=White&eyeType=Default&eyebrowType=DefaultNatural&mouthType=Default&skinColor=Light"
            ></v-img>
          </v-list-item-avatar>

          <v-list-item-content>
            <v-list-item-title>Evan You</v-list-item-title>
          </v-list-item-content>

        </v-list-item>
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>
import axios from 'axios';

export default({
  components: {
  },
  data: function () {
    return {
      points: [], 
    }
  },
  mounted () {
    axios 
      .get('/api/v1/points.json')
      .then(response => (this.points = response.data))
  }
})
</script>
