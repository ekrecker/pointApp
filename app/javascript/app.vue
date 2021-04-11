<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
import Vue from 'vue'
import VueRouter from 'vue-router'

import IndexPage from './IndexPage.vue'
import PointDetailPage from './PointDetailPage.vue'
import PointNewPage from './PointNewPage.vue'

const router = new VueRouter({
  routes: [
    { path: '/',
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

Vue.use(VueRouter)

export default {
  router
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>