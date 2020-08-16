<template>
  <div class="container-box">
    <div class="breadcrumb-box">
      <ul class="breadcrumb">
        <li class="breadcrumb-item">
          <span></span>首页
        </li>
        <li class="breadcrumb-item">{{detailsData.fname}}</li>
        <li class="breadcrumb-item">{{detailsData.title}}</li>
      </ul>
    </div>
    <div class="container-fuils">
      <div class="row no-gutters">
        <div class="col-3 details offset-2">
          <!-- 详图位置 -->
          <!-- -----------------zoom----------------------------- -->
          <div class="zoom-container">
            <div class="master-copy" @mousemove="mouseIn" @mouseover="isActive = 'open'" @mouseout="isActive = 'close'" ></div>
            <div class="master">
              <div class="small-box"></div>
              <img :src="pic" alt class="details_img" style="width:400px;height:400px;" />
              <!-- 放大后 -->
              <div class="big-box" :class="isActive" >
                <img :src="pic" alt class="big-img"/>
              </div>
            </div>

            <!-- 鼠标进入后的方框 -->
          </div>
          <div class="details_img_thumb">
            <div class="btn_" @click="toLeft"></div>
            <div class="thrmb">
              <ul>
                <li>
                  <img
                    v-for="(item,i) of detailsData.pic"
                    :key="i"
                    :src="item.pic"
                    :id="i" 
                    :class="[lid == i ? 'borders':'']"
                    @click="checkes(i)"
                  />
                </li>
              </ul>
            </div>
            <div class="btn_1" @click="toRight"></div>
          </div>
        </div>
        <!-- 详细信息--------------------------- -->
        <div class="col-4 details">
          <div class="bd_bm mt-5">
            <h3>{{this.detailsData.title}}</h3>
            <p>{{this.detailsData.subtitle}}</p>
            <p>
              价格:
              <a class="text-danger h3">￥{{this.detailsData.price}}</a>
            </p>
            <p>商品编号:{{this.detailsData.ccd}}</p>
          </div>
          <div class="bd_bm">
            <p>
              配送至:
              <input type="text" class="ml-4" />
            </p>
            <p>配送说明:满额包邮(不满70运费20)</p>
            <p>库存: {{this.detailsData.shelf}}</p>
          </div>
          <div class="bd_bm">
            <p>
              购买数量:
              <button @click="minus">-</button>
              <span>{{n}}</span>
              <button @click="add">+</button>
            </p>
          </div>
          <div class="bd_bm">
            <p>
              联系我们:
              <a href="#" class="lxwm"></a>
            </p>
          </div>
          <div class="bd_bm mt-4 pb-2 border-0">
            <router-link to="/" class="btn btn-success mx-3">立即购买</router-link>
            <router-link to="/" class="btn btn-primary mx-4">加入购物车</router-link>
            <router-link to="/" class="btn btn-success ml-3">加入收藏</router-link>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentEvent: null,
      box_size: "1",
      aaa: true,
      lid: 0,
      detailsData: [],
      // 大图
      pic: "",
      // 商品购买数量
      n: 1,
      isActive: 'close'
    };
  },
  mounted() {
    this.getDetails();
  },
  watch: {
    lid() {
      this.pic = this.detailsData.pic[this.lid].pic;
    },
  },
  methods: {
    // 获取详情数据
    getDetails() {
      let id = this.$route.params.lid;
      this.axios.get("/message?id=" + id).then((res) => {
        let data = res.data.result;
        data.pic.forEach((item, i) => {
          item.pic = require("../assets/img/" + item.pic);
        });
        console.log(data);
        this.detailsData = data;
        this.pic = this.detailsData.pic[this.lid].pic;
      });
    },
    minus() {
      if (this.n > 1) {
        this.n--;
      }
    },
    add() {
      this.n++;
    },
    toLeft() {
      if (this.lid >= 1) {
        this.lid--;
      }
    },
    toRight() {
      if (this.lid < this.detailsData.pic.length - 1) {
        this.lid++;
      }
    },
    checkes(value) {
      this.lid = value;
    },
    // 放大镜效果
    mouseIn(e){
      let left = e.offsetX
      // 获取蒙层离父元素左边的距离
      let zoomIn = document.getElementsByClassName('small-box')[0]
      let master = document.getElementsByClassName('master')[0]
      console.log(e.offsetX)
      // let mouseLeft = zoomIn.offsetX;
      let leftWidth = left - zoomIn.offsetWidth / 2
      let top =e.offsetY - zoomIn.offsetHeight / 2 
      zoomIn.style.left = leftWidth <=0 ? 0 :leftWidth >=200 ? 200 : leftWidth  +'px'
      zoomIn.style.top = top <= 0 ? 0 : top >= 200 ? 200 : top + 'px'
      let bigImag = document.getElementsByClassName('big-img')[0];
      console.log()
      bigImag.style.left = -(leftWidth <=0 ? 0 :leftWidth >=200 ? 400 : 2 * leftWidth ) +'px' 
      bigImag.style.top = -(top <=0 ? 0 :top >=200 ? 400 : 2 * top  ) +'px'
    },
  },
};
</script>

<style scoped lang="less">
.close {
  width: 0px;
  height: 0px;
  transition: all .3s linear;
  top: 200px;
  left: 200px;
}
.open {
  width: 400px;
  height: 400px;
   left: 410px;
    top: 10px;
    transition: all .3s linear;
}
.zoom-container {
  position: relative;
  padding-left: 100px;
}
.master-copy {
  width: 400px;
  height: 400px;
  position: absolute;
  left: 100px;
  top:0px;
  z-index: 999;
  // background: rgba(0, 0, 0, 0.2);
  &:hover {
    & ~ .master {
      .small-box, .big-box {
        display: block;
      }
      
    }
  }
}
.master {
  width: 400px;
  height: 400px;
  /* border: 1px solid red; */
  display: inline-block;
  position: relative;
  
  .big-box {

    position: absolute;
    // display: none;
    overflow: hidden;
   
    z-index: 5;
    // transition: all .5 linear
  }
  .big-img {
    position: absolute;
    left: 0px;
    top: 0px;
  }
  /* 鼠标移入框 */
  .small-box {
    width: 200px;
    height: 200px;
    display:none; 
    background-color: rgba(200, 200, 200, 0.4);
    position: absolute;
    left: 0px;
  }
}
.borders {
  border: 2px solid red;
}
.lxwm {
  width: 89px;
  height: 24px;
  display: inline-block;
  /* border: 1px solid red; */
  margin-top: 10px;
  background-image: url(../../public/img/bg_pro.gif);
  background-position: -37px -54px;
}
.bd_bm {
  border-bottom: 1px dashed #cccccc;
  margin: 10px;
  font-size: 18px;
}
.bd_bm button {
  width: 30px;
  height: 30px;
  border-radius: 5px;
  outline: none;
  /* line-height: 0px; */
}
div.bd_bm > p > span {
  width: 50px;
  display: inline-block;
  height: 26px;
  border: 1px solid #cccccc;
  text-align: center;
}
/* ----------------------------- */
.imgbox {
  border: 2px solid red;
}
/* 缩略图 */
.thrmb {
  width: 400px;
  height: 150px;
  margin-bottom: 20px;
  margin-left: 10px;
  overflow: hidden;
}
.thrmb > ul {
  display: flex;
}
.thrmb > ul > li > img {
  width: 55px;
  margin: 10px 5px;
}
/* 按钮右 */
.btn_1 {
  position: absolute;
  bottom: 83px;
  left: 521px;
  width: 16px;
  height: 50px;
  border-radius: 5px;
  background-image: url(../../public/img/icon.png);
  background-position: 159px -4px;
  background-color: #fff;
  /* transform: scale(1.5); */

  outline: none;
}
/* 按钮左 */
.btn_ {
  width: 16px;
  height: 50px;
  border-radius: 5px;
  background-image: url(../../public/img/icon.png);
  background-position: 188px -4px;
  background-color: #fff;
  /* transform: scale(1.5); */
  margin: 13px 0px 0px 90px;

  outline: none;
}
.details {
  height: 600px;
}
.details_img_thumb {
  height: 150px;
  display: flex;
}
/* 大图 */
.details > div > .details_img {
  width: 400px;
  height: 400px;
  margin-left: 81px;
}
/* .row div,.row {
    border: 1px solid red;
} */
.container-box {
  height: 100%;
  // background-color: skyblue;
}

.breadcrumb {
  background-color: #fff;
  line-height: 70px;
  height: 50px;
  font-size: 25px;
  padding-left: 500px;
  color: #666;
}

.breadcrumb > .breadcrumb-item > span {
  width: 40px;
  height: 40px;
  background-image: url(../../public/img/icon.png);
  transform: scale(1.5);
  background-position: 0 214px;
  margin-top: 27px;
}

.breadcrumb > .breadcrumb-item:last-child {
  color: #000;
  font: normal 700 25px "宋体";
  margin-top: 24px;
}
.breadcrumb > .breadcrumb-item + .breadcrumb-item:before {
  content: ">";
}
</style>