<template>
  <div>
    <div class="container-fluid">
      <!-- 头部导航 -->
      <div class="row no-gutters my_style">
        <div class="col-2 offset-2">
          <p class="text-light small mb-0">欢迎来到Wacom官方商城！</p>
        </div>
        <div class="col-2">
          <a href="#">在线客服(周一至周日9:00-18:00)</a>
        </div>
        <div class="col-4 text-light offset-1">
          <ul class="d-flex my_btn_group text-center mb-0">
            <li>
              <router-link to="/login">登录</router-link>   
            </li>
            <li></li>
            <li>
              关于Wacom
              <ul>
                <li>官方微博</li>
                <li>品牌介绍</li>
              </ul>
            </li>
            <li></li>
            <li>
              <a href="#">我的订单</a>
            </li>
            <li></li>
            <li>
              <label class="my_car">
                <img src="/img/car.png" alt class="mb-1 mr-2" />购物车
              </label>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row no-gutters">
        <div class="col-1 offset-2">
          <img src="/img/logo.png" alt class="ml-3 mt-2" />
        </div>
        <!-- 顶部选项卡 -->
        <div class="h5 pt-4">
          <ul class="nav">
            <li
              :class="['nav-item', currentTab == value.id ? 'tab-active' : '']"
              v-for="(value,i) of tabs"
              @click="checkTab(value.id)"
              :key="value.id"
            >
              <a class="nav-link" href="#">{{value.name}}</a>
            </li>
            <!-- <li class="nav-item" >
                        <a class="nav-link" href="#">首页</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">所有产品</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">数位板</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">数位屏</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">移动电脑</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Bamboo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="#">原装配件</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">在线教育</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">下载专区</a>
            </li>-->
          </ul>
        </div>
        <div class="navbar navbar-light bg-light offset-3">
          <form class="form-inline">
            <input
              class="form-control mr-sm-2"
              type="search"
              placeholder="请输入查询关键字"
              aria-label="Search"
            />
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      currentTab: 0,
      tabs: [
        { name: "首页", id: 0 },
        { name: "所有产品", id: 1 },
        { name: "数位板", id: 2 },
        { name: "数位屏", id: 3 },
        { name: "移动电脑", id: 4 },
        { name: "Bamboo", id: 5 },
        { name: "原装配件", id: 6 },
        { name: "在线教育", id: 7 },
        { name: "下载专区", id: 8 },
      ],
    };
  },
  methods: {
    checkTab(value) {
      this.currentTab = value;
    },
  },
};
</script>
<style scoped>
.tab-active {
  border-bottom: 2px solid #00a1e1;
}
.container-fluid {
  padding: 0;
}
/* .container-fluid div {
    border: 1px solid red;
    
} */
.container div {
  border: 1px solid green;
}
.my_style {
  height: 50px;
  line-height: 50px;
  background-color: #000;
  font-size: 14px;
  display: flex;
}
.my_btn_group {
  list-style: none;
}
.my_btn_group > li:nth-child(odd) {
  margin: 0px 10px;
  width: 200px;
}
.my_btn_group > li:nth-child(even):after {
  content: "|";
  margin: 0px 5px;
  color: #565b64;
}
.my_btn_group > li > a {
  text-decoration: none;
  color: #fff;
  font-size: 14px;
  font-family: Arial, Microsoft YaHei, Simsun;
  /* font: normal 700 18px '宋体'; */
}
.my_btn_group > li > a:hover {
  color: #00a1e1;
}
.my_car {
  width: 120px;
  /* border: 1px solid #fff; */
  background-color: #424242;
}
.my_car:hover {
  background-color: #00a1e1;
}
ul.my_btn_group > li {
  position: relative;
  cursor: pointer;
}
ul.my_btn_group > li:nth-child(3) {
  color: #00a1e1;
}
ul.my_btn_group > li:nth-child(3):after {
  content: "v";
  color: #fff;
}
ul.my_btn_group > li > ul {
  /* border: 1px solid red; */
  display: none;
  color: #00a1e1;
  line-height: 25px;
  width: 110px;
  position: absolute;
  left: -15px;
  top: 50px;
}
ul.my_btn_group > li:hover > ul {
  display: block;
  color: #00a1e1;
}
ul.my_btn_group > li > ul > li {
  position: relative;
  padding-top: 1px;
  width: 108px;
  border: 1px solid #d6d6d6;
}
ul.my_btn_group > li > ul > li:first-child {
  border-bottom: 1px solid #d6d6d6;
}
ul.my_btn_group > li > ul > li::before {
  content: ":·";
  position: absolute;
  top: 0%;
  left: 5%;
  padding-left: 5px;
}
/* 顶部导航栏 */
ul.nav > li > a {
  padding: 8px 8px;
  color: black;
  position: relative;
}
ul.nav > li > a:focus:after {
  position: absolute;
  content: "";
  top: 100%;
  left: 0%;
  width: 100%;
  border-bottom: 2px solid #00a1e1;
}
</style>