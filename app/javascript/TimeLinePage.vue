<template>
  <div class="timeline"> 
    <h2>タイムライン</h2>
    <v-card
      class="mx-auto"
      max-width="600"
    >
      <v-container>
        <v-row dense>
          <v-col
            v-for="(point, i) in points"
            :key="i"
            :cols="60"
          >
            <v-card
              class="mx-auto"
              color="grey"
              dark
              max-height="250"
              width="600"
            >
              <v-card-title>
                <v-list-item-avatar color="grey darken-3">
                  <v-img
                    class="elevation-6"
                    alt=""
                    src="https://avataaars.io/?avatarStyle=Transparent&topType=ShortHairShortCurly&accessoriesType=Prescription02&hairColor=Black&facialHairType=Blank&clotheType=Hoodie&clotheColor=White&eyeType=Default&eyebrowType=DefaultNatural&mouthType=Default&skinColor=Light"
                  ></v-img>
                </v-list-item-avatar>
                <span class="title font-weight-light"> {{ point.sender }} </span>
              </v-card-title>

              <v-card-text class="headline font-weight-light">
                {{ point.comment }}
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
                    <v-list-item-title>{{ point.receiver }}</v-list-item-title>
                  </v-list-item-content>

                  <v-row
                    align="center"
                    justify="end"
                  >
                    <v-icon class="mr-1">
                      mdi-heart
                    </v-icon>
                    <span class="subheading mr-2">{{ point.likes }}</span>
                  </v-row>
                </v-list-item>
              </v-card-actions> 
            </v-card>
          </v-col>
        </v-row>
      </v-container>
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
