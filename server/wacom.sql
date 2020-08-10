SET NAMES UTF8;
DROP DATABASE IF EXISTS wacom;
CREATE DATABASE wacom CHARSET UTF8;
USE wacom;
-- 用户表
CREATE TABLE user(
    uid int PRIMARY KEY AUTO_INCREMENT,
    uname varchar(24) unique not null,
    upwd char(24) not null,
    email varchar(30)
);
-- 详情表
CREATE TABLE user_details(
    id int PRIMARY KEY AUTO_INCREMENT,
    email varchar(30),
    gender tinyint,
    birthday date,
    id_number char(18),
    province char(10),
    town char(10),
    area char(10),
    details_add varchar(30),
    phone char(11),
    qq char(18),
    consignee char(8)
);
/****首页轮播广告商品****/
CREATE TABLE wacom_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);
INSERT INTO user VALUES(null,'wangtao','12345678','528801942@qq.com'),
        (null,'dingding','12345678','528801942@qq.com'),
        (null,'dangdang','12345678','528801942@qq.com'),
        (null,'pingping','12345678','528801942@qq.com'),
        (null,'pangpang','12345678','528801942@qq.com'),
        (null,'12345678','12345678','528801942@qq.com');
INSERT INTO user_details VALUES(null,'528801942@qq.com',0,'1994-06-05','513030199406050388','四川','达州','双流','四川省成都市双流区翡翠国际社区','13618041185','528801942','涛哥');
/****首页轮播广告商品****/
INSERT INTO wacom_carousel VALUES
(NULL, '201910290922176183.jpg','轮播广告商品1','/login'),
(NULL, '202007091540058440.jpg','轮播广告商品2','/login'),
(NULL, '202007101744101556.jpg','轮播广告商品3','/login'),
(NULL, '202007141155491693.jpg','轮播广告商品4','/login'),
(NULL, '202007161101517261.jpg','轮播广告商品5','/login'),
(NULL, '202007171653325569.jpg','轮播广告商品6','/login'),
(NULL, '202007171653543266.jpg','轮播广告商品7','/login');
SELECT * FROM user;
SELECT * FROM  user_details;   
DESC user;
DESC user_details;