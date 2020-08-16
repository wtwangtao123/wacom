import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../components/login.vue'
import register from '../components/register.vue'
import Carousel from '../components/carousel'
import Prodect from '../components/prodectList'
Vue.use(VueRouter)

const routes = [
  {
    path: '/prodect/:lid',
    component: Prodect
  },
  {
    path: '/register',
    component: register
  },
  {
    path: '/login',
    component: Login
  },
  {
    path: '/',
    name: 'Home',
    redirect: 'home',
    component: Home,
    children: [
      {
        path: '/home',
        component: Carousel
      },
      {
        path: '/details/:lid',
        component: () =>
          import(/* webpackChunkName: "Details" */ '../components/details.vue')
      }
    ]
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
