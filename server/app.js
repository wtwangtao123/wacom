const express= require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const mysql = require('mysql');
// const { SSL_OP_ALLOW_UNSAFE_LEGACY_RENEGOTIATION } = require('constants');
const server = express();
server.listen(3000);
const pool = mysql.createPool({
    host: '127.0.0.1',
    user: 'root',
    password: '',
    port: '3306',
    database: 'wacom',
    charset: 'utf8',
    connectionLimit: 20
});
// 注册为中间件
server.use(bodyParser.urlencoded({
    extended: false
}));
server.use(cors({
    origin:['http://127.0.0.1:8080','http://localhost:8080']
}));
// 登录路由
server.post('/login',(req,res)=>{
    let username = req.body.username;
    let password = req.body.password;
    let sql = 'SELECT uname,upwd FROM user WHERE uname = ? and upwd = ?';
    pool.query(sql,[username,password],(err,result)=>{
        if (err) throw err;
        if(result.length != 0){
            res.send({message:'登录成功',code:1})
        }else {
            res.send({message:'登录失败',code:0})
        }
    })
    // console.log(a);
});
// 注册账号检验路由
server.get('/register',(req,res)=>{
    let username = req.query.username;
    let sql = 'SELECT uid FROM user WHERE uname = ?';
    pool.query(sql,[username],(err,result)=>{
        if (err) throw err;
        if(result.length == 0){
            // 可以使用
            res.send('1');
        }else {
            // 用户名已存在时
            res.send('0');
        }
    })
})
// 注册
server.post('/registers',(req,res)=>{
    let username = req.body.username;
    let password = req.body.password;
    let email = req.body.email;
    let sql = 'INSERT INTO user(uname,upwd,email) VALUES(?,?,?)';
    // console.log("username="+username+"password="+password+"email="+email)
    pool.query(sql,[username,password,email],(err,result)=>{
        if (err) throw err;
        // console.log(result);
        if(result.affectedRows == 1){
            // 创建成功
            res.send({message:'ok',code:1});
        }else{
            // 创建失败
            res.send({message:'fail',code:0});
        }
    })

})
// 轮播图
server.get('/carousel',(req,res)=>{
    let sql = 'SELECT cid,img FROM wacom_carousel';
    pool.query(sql,(err,result)=>{
        if (err) throw err;
        // console.log(result);
        res.send({message:"ok",code:1,result:result});
    })
})
console.log('服务器启动成功');

