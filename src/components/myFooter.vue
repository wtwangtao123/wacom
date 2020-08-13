<template>
<div>
    <div class="container-fluid">
        <div class="row no-gutters my_border">
            <!-- 1L left -->
            <div class="col-4 offset-1">
                <div class="row no-gutters text-center">
                    <div class="col-3">
                        <ul>
                            <li>
                                <h5>购物指南</h5>
                            </li>
                            <li><a href="#">配送方式</a></li>
                            <li><a href="#">联系客服</a></li>
                        </ul>
                    </div>
                    <div class="col-3">
                        <ul>
                            <li>
                                <h5>支付方式</h5>
                            </li>
                            <li><a href="#">在线支付</a></li>
                            <li><a href="#">邮局汇款</a></li>
                            <li><a href="#">公司转账</a></li>
                        </ul>
                    </div>
                    <div class="col-3">
                        <ul>
                            <li>
                                <h5>售后服务</h5>
                            </li>
                            <li><a href="#">售后政策</a></li>
                            <li><a href="#">关于发票</a></li>
                            <li><a href="#">维修中心</a></li>
                            <li><a href="#">取消订单</a></li>
                            <li><a href="#">视频专区</a></li>
                            <li><a href="#">下载专区</a></li>
                        </ul>
                    </div>
                    <div class="col-3">
                        <ul>
                            <li>
                                <h5>关于我们</h5>
                            </li>
                            <li><a href="#">品牌介绍</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 1L right -->
            <div class="col-3 offset-3">
                <div class="row no-gutters">
                    <div class="col-6 text-center">
                        <div class="mr-3 mb-2">
                            <img src="/img/wb.png" alt="" class="">
                            <span class="my_font_head">官方微博</span>
                        </div>
                        <div>
                            <img src="/img/weibo.png" alt="" class="my_img">
                        </div>
                        <div class="my_font_footer">
                            <p>扫描二维码</p>
                            <p>或<a href="#" class="text-secondary">点击访问</a></p>
                        </div>
                    </div>
                    <div class="col-6 text-center">
                        <div class="mr-3 mb-2">
                            <img src="/img/wx.png" alt="" class="">
                            <span class="my_font_head">官方微信</span>
                        </div>
                        <div>
                            <img src="/img/ewx.png" alt="" class="my_img">
                        </div>
                        <div class="my_font_footer">
                            <p>扫描二维码</p>
                            <p>账号wacom_china</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row no-gutters">
            <div class="col-3 offset-2 p-5"><a href="#">在线客服(周一至周日8:30-24:00)</a></div>
            <div class="col-3"></div>
        </div>
        <div class="row no-gutters">
            <div class="col-2 text-right pt-3">
                <img src="/img/logo2.png" alt="">
            </div>
            <div class="col-4">
                <div class="row no-gutters">
                    <div class="col-12">
                        <a href="#">使用条款</a>
                        <a href="#">隐私条款</a>
                        <a href="#">Cookie</a>
                        <a href="#">Notice</a>
                    </div>
                    <div class="col-12 small">
                        <p>
                            Copyright © 2018 estore.wacom.com.cn 和冠科技（北京）有限公司All Rights Reserved. 京ICP备13037713号
                        </p>
                        <p>
                            为了给您提供更好的购物体验，推荐使用谷歌、360急速、IE10及以上版本浏览器访问本商城。
                        </p>
                    </div>
                </div>
            </div>
           
        </div>
    </div>
    </div>
</template>

<style scoped>
    .container-fluid {
    padding: 0;
}
/* .container-fluid div {
    border: 1px solid red;
    
} */

/* 列表的样式 */
.my_border {
    border-top: 2px solid #fff;
    border-bottom: 2px solid #fff;
    
    padding: 50px 0px;
}
.row>div>ul>li>h5 {
    font-size: 16px;
    font-weight: 800;
    margin-bottom: 20px;
    color: #666666;
 
    /* border: 1px solid red; */
}
.row>div>ul>li:not(:first-child)>a {
    color: #666666;
    line-height: 30px;
    font-size: 13px;
}
.my_font_head {
    font: normal 600 15px 'Arial, Microsoft YaHei, Simsun';
    margin-left: 5px;
    color: #666666;
}
.my_font_footer {
    font: normal 400 11px/10px 'Arial, Microsoft YaHei, Simsun';
    margin-top: 12px;
    color: #999;
    
}
.my_font_footer>p {
    margin-bottom: 10px;
}
.my_img {
    width: 92px;   
}
</style>