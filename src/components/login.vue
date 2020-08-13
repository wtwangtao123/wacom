<template>
  
  <div class="login_container">
    
    <div class="login_logo">
      <img src="../assets/login/logo.png" alt />
    </div>
    <div class="login_box">
      <div class="login_box_1">
        <img src="../assets/login/pic01.jpg" alt />
      </div>
      <div class="login_box_2">
        <img src="../assets/login/wel.png" alt />
        <el-form label-width="0px">
          <el-form-item>
            <el-input v-model="form.name" placeholder="Wacom账号"></el-input>
          </el-form-item>
          <el-form-item>
            <el-input v-model="form.password" placeholder="密码(9-32位字符)"></el-input>
          </el-form-item>
          <el-row>
            <el-col :span="12">
              <el-form-item>
                <el-input v-model="form.verify" placeholder="不区分大小写"></el-input>
              </el-form-item>
            </el-col>
            <el-col :span="5" :offset= '3'>
              <img src="../assets/login/VerifyCode.gif" alt />
            </el-col>
          </el-row>
          <el-row>
            <el-col :span="2">
              <el-checkbox v-model="checked">记住用户名密码</el-checkbox>
            </el-col>
            <el-col :span="13" :offset= '9'>
              <a href="#">忘记密码？询问客服重置</a>
            </el-col>
          </el-row>
        </el-form>
        <div class="btn">
          <el-button type="primary" style="width:150px;font-size:24px;background-color:#02A7E0" @click="action">登 录</el-button>
        </div>
        <div class="login_footer">
            <p>您还不是Wacom账号用户，立即<a href="#">免费注册</a></p>
        </div>
      </div>
    </div>
    <div class="login_bottom">
        <a href="#">使用条款</a>
        <a href="#">隐私条款</a>
        <a href="#">Cookie Notice</a>
        <p>
            Copyright © 2018 estore.wacom.com.cn 和冠科技（北京）有限公司All Rights Reserved. 京ICP备13037713号
        </p>
        <p>
            
            为了给您提供更好的购物体验，推荐使用谷歌、360急速、IE10及以上版本浏览器访问本商城。
            
        
        </p>
    </div>
    
  </div>
 
</template>

<script>
export default {
    data() {
        return {
            form: {
                name: "",
                password: "",
                verify: ''
      },
      checked: false,
    };
  },
    methods: {
        action(){
            let username = this.form.name;
            let password = this.form.password;
            let verify = this.form.verify;
            // console.log(username.length,password,verify);
            if(username.length >= 6 && password.length >= 8 && password.length <= 32){
                // if(verify == 'bN6B' || verify == 'bn6b'){
                    // console.log('111');
                    this.axios.post('/login','username=' + username  + '&password=' + password).then(res=>{
                        if(res.data.code == 1){
                            this.$router.push('/');
                            window.alert('登录成功');
                        }else{
                            window.alert('账号或用户名错误');
                        }
                    })
                // }
            }
        }
    }
};
</script>


<style scoped>
.login_container {
  background-color: rgb(244, 244, 244);
  height: 100%;
}
.login_container:before {
  content: "";
  display: table;
}
.login_box {
  display: flex;
  margin-top: 40px;
  justify-content: center;
  height:60%;
}
.login_box_2 {
  width: 450px;
  height: 545px;
  padding: 64px 28px 0 50px;
  font-size: 12px;
  overflow: hidden;
  background: url(../assets/login/shadow.gif) no-repeat left top;
  background-color: rgb(244, 244, 244);
  /* border: 1px solid red; */
  text-align: left;
}
.login_box_2 > img {
  margin-bottom: 20px;
}
.login_box_2 a {
  text-decoration: none;
  color: #666666;
}
.login_logo {
  width: 1002px;
  height: 116px;
  /* border: 1px solid red; */
  margin: 0 auto;
}
.login_logo > img {
  padding: 32px 0 0 65px;
}
.form_1 {
  display: flex;
}
.btn {
  padding: 18px 0 30px 0;
  border-bottom: 1px solid #dcdcdc;
}
.login_footer {
    margin: 18px 0 0 0px;
}
.login_footer>p>a {
    font-size: 21px;
    color: #ff6000;
}
.login_bottom {
    padding-top: 35px;
    width: 1200px;
    margin: 30px auto;
    text-align: center;
    line-height: 30px;
    border-top: 1px solid #dcdcdc
}
.login_bottom a {
    text-decoration: none;
    margin: 0 5px 0;
    color: #02A7E0;
}
</style>