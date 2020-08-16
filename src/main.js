import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import axios from 'axios';
import api from '@/api'
// 将页头组件转为全局组件
import myHead from './components/myHead.vue'
// 将页尾组件转换为全局组件
import myFoot from './components/myFooter.vue'
Vue.prototype.$api = api
Vue.component('my-head',myHead);
Vue.component('my-footer',myFoot);
Vue.config.productionTip = false
Vue.use(ElementUI);
axios.defaults.baseURL = 'http://127.0.0.1:3000';
Vue.prototype.axios = axios;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
