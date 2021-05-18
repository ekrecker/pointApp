<template>
  <div class="customHeader">
    <v-app-bar
      color="indigo"
      app 
      dark
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>ポイントちゃん</v-toolbar-title>
    </v-app-bar>

    <v-navigation-drawer
      v-model="drawer"
      class="indigo"
      dark
      absolute
      bottom
      temporary
    >
      <v-list
        nav
        dense
      >
        <v-list-item-group
          v-model="group"
        >
          <v-list-item
            v-for="item in items"
            :key="item.title"
            link
            :to="item.path" 
          >
            <v-list-item-icon>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </v-list-item-content>

          </v-list-item>
        </v-list-item-group>
      </v-list>
      
      <template v-slot:append>
        <div class="pa-2">
          <v-btn block>
            Logout
          </v-btn>
        </div>
      </template>
    </v-navigation-drawer>
  </div>
</template>

<script>
  export default {
    data: function () {
      return {
        drawer: false,
        group: null,
        items: [
          { title: 'ポイントをおくる', icon: 'mdi-send', path: '/new'},
          { title: 'ポイント一覧', icon: 'mdi-star-four-points-outline', path: '/timeline'}
        ]
      }
    },
    watch: {
      group () {
        this.drawer = false
      }
    }
  }
</script>
