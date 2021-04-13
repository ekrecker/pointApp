<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import '@mdi/font/css/materialdesignicons.css'
import VueRouter from 'vue-router'

import IndexPage from 'IndexPage.vue'
import PointDetailPage from 'PointDetailPage.vue'
import PointNewPage from 'PointNewPage.vue'

const router = new VueRouter({
  routes: [
    { path: '/',
      name: IndexPage,
      component: IndexPage 
    },
    { path: '/points/:id(\\d+)',
      name: 'PointDetailPage',
      component: PointDetailPage 
    },
    { path: '/points/new',
      name: 'PointNewPage',
      component: PointNewPage
    }
  ]
})

const vuetify = new Vuetify({
  icons: {
    iconfont: 'mdi'
  }
})

Vue.use(Vuetify)
Vue.use(VueRouter)

export default {
  vuetify,
  router
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>