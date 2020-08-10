<template>
  <div>
    <el-row class="bg-purple-dark">
      <el-col :span="3" :push="4">
        <div class="grid-content bg-purple-dark">
          <el-link :underline="false">欢迎来到Wacom官方商城！</el-link>
        </div>
      </el-col>
      <el-col :span="4" :push="4">
        <div class="grid-content bg-purple-dark">
          <el-link :underline="false" text-color="success">在线客服(周一至周日9:00-18:00)</el-link>
        </div>
      </el-col>
      <el-col :span="8" :push="10" class="bg-purple-dark">
        <el-menu
          :default-active="activeIndex"
          background-color="#000000"
          text-color="#ffffff"
          mode="horizontal"
          @select="handleSelect"
        >
          <el-menu-item index="1">
            <router-link to="/login">登录</router-link>
          </el-menu-item>

          <el-menu-item index="2">注册</el-menu-item>
          <el-submenu index="2" class="bg-purple-light">
            <template slot="title">关于Wacom</template>
            <el-menu-item index="2-1">官方微博</el-menu-item>
            <el-menu-item index="2-2">品牌介绍</el-menu-item>
          </el-submenu>
          <el-menu-item index="3">我的订单</el-menu-item>
          <el-menu-item index="4">
            <img src="../assets/index/car.png" alt />
            <a href="https://www.ele.me" target="_blank">购物车</a>
          </el-menu-item>
        </el-menu>
      </el-col>
    </el-row>
    <!-- 轮播图 -->
    <div class="my_carousel">
      <el-carousel :interval="5000" arrow="always" height="460px">
        <el-carousel-item v-for="(value,i) of carousel" :key="i">
          <img :src="value.img" alt="">
        </el-carousel-item>
      </el-carousel>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeIndex: "1",
      carousel: []
    };
  },
  mounted(){
    this.axios.get('/carousel').then(res=>{
      let data = res.data.result;
      // console.log(data);
      data.forEach(item=>{
        item.img = require("../assets/carousel/" + item.img);
        this.carousel.push(item);
      });
    });
      // console.log(this.carousel);
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
  },
};
</script>
<style>
.bg-purple-dark {
  background: #000;
}
.bg-purple-light {
  background: #ffffff;
}
.bg-purple-skyblue {
  background: skyblue;
}

.grid-content {
  /* border-radius: 4px; */
  height: 50px;
}
.el-link.el-link--default {
  font-size: 20px;
  line-height: 50px;
}
.my_carousel {
  width: 1200px;
  margin: 0 auto;
}
 .el-carousel__item h3 {
    color: #475669;
    font-size: 18px;
    opacity: 0.75;
    line-height: 300px;
    margin: 0;
  }
  
  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }
  
  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }
</style>