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
        <div class="table">
          <table>
            <tr>
              <td>用户名:</td>
              <td>
                <input type="text" placeholder="Wacom账号" v-model="username" @blur="find" @focus="input"/><span v-show="flag == true">{{message}}</span>
              </td>
            </tr>
            <tr>
              <td>邮箱</td>
              <td>
                <input type="email" placeholder="请输入邮箱" v-model="email" @blur="emails" @focus="input"/><span v-show="flag_email == true">{{message}}</span>
              </td>
            </tr>
            <tr>
              <td>密码</td>
              <td>
                <input type="password" placeholder="密码(9-32位字符)" v-model="password" @blur="userpass" @focus="input"/><span v-show="flag_password == true">{{message}}</span>
              </td>
            </tr>
            <tr>
              <td>确认密码</td>
              <td>
                <input type="password" placeholder="确认密码(9-32位字符)" v-model="password_2" @blur="userpass_2"  @focus="input"/><span v-show="flag_password_2 == true">{{message}}</span>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <input type="checkbox" v-model="checked_1" />请勾选这里以表示您已阅读并同意Wacom的
                <a href="#">隐私政策</a>。和
                <a href="#">Cookie通知</a>。
                <br />
                <input type="checkbox" v-model="checked_2" />请勾选这里以表示您已阅读并同意Wacom的
                <a href="#">使用条款</a>。
                <br />
                <input type="checkbox" v-model="checked_3" />
                是的，我同意接收来自Wacom的邮件信息，以便了解更多关于Wacom公司、产品、新闻、活动、服务以及更多Wacom官方商城的促销信息等。我知晓我可以随时取消订阅邮件信息。
              </td>
            </tr>
            <tr>
              <td>
                <div class="btn">
                  <el-button
                    type="primary"
                    style="width:150px;font-size:24px;background-color:#02A7E0"
                    @click="action"
                  >注册</el-button>
                </div>
              </td>
              <td></td>
            </tr>
          </table>
        </div>

        <div class="login_footer">
          <p>
            您已经是Wacom账号用户，立即
            <a href="#">登录</a>
          </p>
        </div>
      </div>
    </div>
    <div class="login_bottom">
      <a href="#">使用条款</a>
      <a href="#">隐私条款</a>
      <a href="#">Cookie Notice</a>
      <p>Copyright © 2018 estore.wacom.com.cn 和冠科技（北京）有限公司All Rights Reserved. 京ICP备13037713号</p>
      <p>为了给您提供更好的购物体验，推荐使用谷歌、360急速、IE10及以上版本浏览器访问本商城。</p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: '',
      email: '',
      password_2: '',
      checked_1: false,
      checked_2: false,
      checked_3: false,
      // 账号验证状态
      flag: false,
      // 邮箱验证状态
      flag_email: false,
      // 密码验证
      flag_password: false,
      flag_password_2: false,
      message: '👆不能为空'
    };
  },
  methods: {
    action() {
      if(this.checked_1 && this.checked_2 && this.checked_3){
        let username = this.username;
        let password = this.password;
        let email = this.email;
        let password_2 = this.password_2;
        console.log(`this.find的结果为${this.find()}`);
        if(password == password_2){
          // console.log(this.find());
          if(this.find() !=false && this.flag == false && this.emails() != false && this. userpass() != false && this. userpass_2() != false){
            // window.alert('ok');
            this.axios.post('/registers','username=' + this.username + '&password=' + this.password + '&email=' + this.email).then(res=>{
              if(res.data.code == 0){
                window.alert('创建失败');
              }else{
                this.$router.push('/login');
              }
            })
            
          }
        }
      }else{
        window.alert('请确认协议是否赞同');
      }
      

      // console.log();
      },
      // 账号验证
      find(){
        this.message = '👆不能为空';
        let username = this.username;
        // console.log(username.length);
        let regExp_username = /^\w{7,25}$/;
        let uname = regExp_username.test(username);
        // console.log(uname);
        if(!uname) {
          this.flag = true;
          if(this.username.length != 0){
            if(this.username.length <7 || this.username.length > 25)
            this.message = '用户名长度在7-25位';
            return false;
          }
          return false;
        }
        if(uname){
          this.message = '👆不能为空';
          this.axios.get('/register?username=' + this.username).then(res=>{
            console.log(res.data);
            if(res.data == 0) {
              this.message = '用户名已存在';
              this.flag = true;
              return false;
            }else {
              return true;
            }
          });
          
        }
      },
      // 邮箱验证
      emails(){
        let email = this.email;
        let regExp_email = /^\w+@[0-9A-Za-z]+.com$/;
        let flag_emails = regExp_email.test(email);
        // console.log(flag_emails);
        if(!flag_emails){
          this.message = '邮箱格式不正确';
          this.flag_email = true;
          return false;
        }else {
          return true;
        }
      },
      // 密码验证
      userpass(){
        let regExp_password = /^[0-9A-Za-z_]{8,25}$/;
        let flag_passwords = regExp_password.test(this.password);
        if(flag_passwords){
          return true;
        }else{
          this.flag_password = true;
          this.message = '密码格式不正确';
          return false;
        }
      },
      // 密码重复验证
      userpass_2(){
        let password = this.password;
        let password_2 = this.password_2; 
        if(password == password_2){
          return true;
        }else{
          this.flag_password_2 = true;
          this.message = '两次密码不一致';
          return false;
        };
      },
      // 获取焦点事件
      input(){
        this.flag = false;
        this.flag_password = false;
        this.flag_password_2 = false;
        this.flag_email = false;
      }
    }
  }

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
  justify-content: center;
}
.login_box_2 {
  width: 385px;
  height: 550px;
  padding: 64px 28px 0 50px;
  font-size: 12px;
  overflow: hidden;
  background: url(../assets/login/shadow.gif) no-repeat left top;
  background-color: #fff;
  /* border: 1px solid red; */
  text-align: left;
}
.login_box_2 > img {
  margin-bottom: 20px;
}
/* 表格属性 */
.table {
  font-family: Arial, "宋体", Helvetica, sans-serif;
  font-size: 22px;
}
div.table > table > tr:not(:last-child) {
  height: 50px;
}
div.table > table > tr:nth-child(5) {
  font-size: 12px;
  line-height: 18px;
}
div.table > table > tr:nth-child(5) input {
  width: 12px;
  height: 12px;
}
div.table > table > tr:nth-child(5) a {
  color: #02a7e0;
}
div.table > table > tr > td > input {
  height: 32px;
  width: 170px;
}
div.table > table > tr > td {
  position: relative;
}
div.table > table > tr > td > span {
  display: inline-block;
  position: absolute;
  background-color: #B94A48;
  width: 120px;
  height: 30px;
  text-align: center;
  padding-top: 10px;
  font: 12px/16px Arial, '宋体', Helvetica, sans-serif; 
  top: 75%;
  left: 0%;
  z-index: 20;
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
.login_footer > p > a {
  font-size: 21px;
  color: #ff6000;
}
.login_bottom {
  padding-top: 35px;
  width: 1200px;
  margin: 30px auto;
  text-align: center;
  line-height: 30px;
  border-top: 1px solid #dcdcdc;
}
.login_bottom a {
  text-decoration: none;
  margin: 0 5px 0;
  color: #02a7e0;
}
</style>