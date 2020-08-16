<template>
    <div class="my_carousel">
      <el-carousel :interval="5000" arrow="always" height="510px">
        <el-carousel-item v-for="(value,i) of carousel" :key="i">
          <img :src="`${value.img}`" alt width="1320px" height="510px" />
        </el-carousel-item>
      </el-carousel>
      <div class="carousel_box">
        <ul>
          <!-- li数据循环  -->
          <li
            v-for="(value,i) of classify"
            :key="i"
            :id="`${value.fid}`"
            @mouseover="dosomething(`${value.fid}`)"
          >
            <a href="#">{{value.fname}}</a>
            <ul>
              <!-- ----------------一个li中的的数据--------------------- -->
              <li v-for="(item,k) of submenu" :key="k" :lid="item.com_id">
                <div class="row no-gutters w-100">
                  <!-- <div class="border border-danger col-12">{{item}}</div> -->
                  <img :src="item.pic[0]" alt class="col-2 ml-2 my_items_img" />
                  <div class="col-6 my_items_span">{{item.com_code}}</div>
                  <div class="col-2">
                    <router-link class="btn btn-outline-info my_items_btn mt-4 ml-3" :to="`/details/${item.com_id}`">查看</router-link>
                    
                  </div>
                </div>
              </li>
              <!-- ----------------------------------------------- -->
            </ul>
          </li>
        </ul>
      </div>
    </div>
</template>


<script>

export default {
    name: 'carousel',
  data() {
    return {
      isRequireOk: true,
      activeIndex: "1",
      // 轮播图数据接收
      carousel: [],
      // 轮播图上li数据接收
      classify: [],
      // 初始时二级菜单的数据的编号
      lid: 1,
      // 用于接收li下二级菜单的数据
      submenu: [],
      // 设置发送开关
      flag: true,
      // li的img
      images: [],
    };
  },
  watch: {
    // id(){
    //   console.log(this.id);
    // }
  },
  mounted() {
    // 获取轮播图数据
    this.$api.getCarousel().then((res) => {
      let data = res.data.result;
      // console.log(data);
      data.forEach((item) => {
        item.img = require("../assets/carousel/" + item.img);
        this.carousel.push(item);
      });
    })
    // this.axios.get("/carousel").then((res) => {
    //   let data = res.data.result;
    //   // console.log(data);
    //   data.forEach((item) => {
    //     item.img = require("../assets/carousel/" + item.img);
    //     this.carousel.push(item);
    //   });
    // });
    // 获取轮播图上li的数据
    this.$api.getProductList().then((res) => {
      this.classify = res.data.result;
      // console.log(this.classify);
    });
    // 获取初始状态li里面二级菜单的数据
    this.getSubmenuList();
  },
  methods: {
    getSubmenuList(tab = this.lid) {
      this.axios.get("/submenu?lid=" + tab).then((res) => {
        // console.log(res.data.result);
        this.submenu = res.data.result;
        this.submenu.forEach((item, i) => {
          item.pic.forEach((d, i) => {
            item.pic.splice(i, 1, require(`../assets/img/${d}`));
          });
        });
        this.flag = true;
        console.log(this.submenu);
      });
    },
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    dosomething(value) {
      this.getSubmenuList(value);
    },
  },
};
</script>



<style>
.el-carousel__arrow--left,
.el-carousel__arrow--right {
  width: 50px !important;
  height: 120px !important;
  border-radius: 0 !important;
}
.el-carousel__arrow--left {
  left: 246px !important;
}
</style>
<style scoped>
.my_carousel {
  width: 1320px;

  margin: 0 auto;
  position: relative;
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

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}
.carousel_box {
  width: 245px;
  height: 510px;
  position: absolute;
  top: 0px;
  z-index: 50;
  background: rgba(152, 152, 150, 0.5);
}
.carousel_box > ul {
  list-style: none;
  padding: 15px 0px 0px 0px;
}
.carousel_box > ul > li {
  height: 50px;
  color: #fff;
  padding: 5px 1px;
  cursor: pointer;
}
.carousel_box > ul > li > ul {
  background-color: #fff;
  display: none;
  position: absolute;
  left: 221px;
  top: 0px;
  width: 920px;
  height: 510px;
}
.carousel_box > ul > li:hover > ul {
  display: block;
  color: #aaa;
  display: flex;
  flex-wrap: wrap;
  align-content: flex-start;
}
.carousel_box > ul > li:hover > ul > li {
  width: 45%;
  height: 80px;
  margin: 2px 20px 2px 0px;
}
.carousel_box > ul > li > a {
  color: #fff;
  line-height: 50px;
  padding-left: 12px;
  font-size: 18px;
  font-weight: 500;
}
.carousel_box > ul > li:hover {
  background-color: #fff;
}
.carousel_box > ul > li:hover > a {
  color: #000;
  text-decoration: none;
}
.carousel_box > ul > li:after {
  content: ">";
  position: absolute;
  left: 93%;
  margin-top: 13px;
  color: #fff;
  height: 50px;
}
.carousel_box > ul > li:hover:after {
  color: #000;
}
.carousel_box_item {
  width: 920px;
  height: 460px;
  display: none;
  background-color: skyblue;
  position: absolute;
  top: 142px;
  left: 787px;
  z-index: 50;
  opacity: 0.2;
}
.my_items_btn {
  width: 60px;
}
.my_items_span {
  line-height: 78px;
  font-size: 20px;
  color: #000;
}
.my_items_img {
  height: 80px;
}
</style>