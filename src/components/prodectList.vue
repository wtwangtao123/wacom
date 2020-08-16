<template>
  <div>
    <my-head></my-head>
    <div class="container-fluid">
      <div class="row no-gutters py-4 ">
        <div class="col-2">
          <span class="h5">所有产品</span>
          <span>共有92个商品</span>
        </div>
        <div class="col-6 offset-4">
          <div class="row no-gutters">
            <div class="col-1 pt-1">排序:</div> 
            <div class="col-3 pt-1 btn btn-dark mx-3">按售价排序</div>
            <div class="col-3 pt-1 btn btn-dark mr-3">按销量排序</div>
            <div class="col-3 pt-1 btn btn-dark">按上架时间排序</div>
          </div>
        </div>
      </div>
    </div>
    <!-- 列表 -->
    <div class="container-fluid">
        <div class="row no-gutters border_bottom" v-for="(item,i) of data" :key="item.pid">
            <div class="col-2 "><img :src="item.pic" style="width:200px;height:200px;"></div>
            <div class="col-7">
                <div class="row no-gutters text-left">
                    <div class="col-11 ml-3 my-3 h2 ">
                        <router-link :to="`details/${item.pid}`" class="text-dark">{{item.title}}</router-link></div>
                    </div>
                        <div class="col-11 px-0 ml-3 my_color_3">{{item.subtitle}}
                    </div>
                    <div class="col-11 px-0 ml-3 my-3 text-info">
                        <p class="h5">￥{{item.price}}</p>
                    </div>
                </div>
            <div class="col-3">
                <!-- 数据存放区 -->
                <div class="row no-gutters">
                    <div class="col-8 offset-2 text-center py-3">
                        <router-link :to="`/details/${item.pid}`" class="btn btn-success my_btn my_color_1"><span class="bgc"></span> <span class="pt-0">商品详情</span>   </router-link> 
                    </div>
                    <div class="col-8 offset-2 text-center py-3">
                        <router-link to="/" class="btn  my_btn my_color_2">加入收藏</router-link> 
                    </div>
                </div>
            </div>
        </div>
    </div>
  </div>
</template> 


<script>
    export default {
        data(){
            return {
                data: []
            }
        },
        mounted(){
            // let id = this.$route.params
            this.getData()
        },
        methods: {
            getData(value = 3){
                this.axios.get('/prodectList?lid=' + value).then(res=>{
                    let r = res.data.result;
                    r.forEach((item,i)=>{
                        item.pic = require('../assets/img/' + item.pic);
                    })
                    this.data = r;
                })
            }
        }
    }
</script>


<style scoped>
.container-fluid {
  border: 1px solid #ccc;
  margin: 0 auto;
  width: 60%;
}
.border_bottom {
    border-bottom: 2px dotted #666;
}
.my_btn {
    width: 130px;
    height: 35px;
    line-height: 20px;
    border-radius: 0;
}
.my_color_1 {
    background-color: #02A7E0;
}
.bgc {
    background-image: url(../../public/img/icon.png);
    width: 25px;
    height: 18px;
    display: inline-block;
    background-position: 0px 131px;
}
.bgc + span {
    display: inline-block;
    line-height: 8px;
}
.my_color_2 {
    background-color: #96BE0F;
}
.my_color_3 {
    color: #999999;
    font-size: 20px;
}
/* div.my_header {
  border: 1px solid blue;
  
} */
</style>