SET NAMES UTF8;
DROP DATABASE IF EXISTS wacom;
CREATE DATABASE wacom CHARSET UTF8;
USE wacom;

/**商品分类家族**/
CREATE TABLE wacom_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)          #主题
);

-- 商品类别详情表
CREATE TABLE wacom_classify_details(
  did INT PRIMARY KEY AUTO_INCREMENT,
  classify_id INT,             #类别id
  com_id INT,                  #商品唯一id
  com_code VARCHAR(32),         #商品编号
  pic VARCHAR(1024)            #图片
);

/**商品**/
CREATE TABLE wacom_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,              #所属家族编号
  prodect_id VARCHAR(64),     #商品唯一id
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),      #副标题
  price DECIMAL(10,2),        #价格
  shelf  INT                 #库存

  -- towhere VARCHAR(64),        #配送至
  -- lname VARCHAR(32),          #商品名称
  -- os VARCHAR(32),             #操作系统
  -- memory VARCHAR(32),         #内存容量
  -- resolution VARCHAR(32),     #分辨率
  -- video_card VARCHAR(32),     #显卡型号
  -- cpu VARCHAR(32),            #处理器
  -- video_memory VARCHAR(32),   #显存容量
  -- category VARCHAR(32),       #所属分类
  -- disk VARCHAR(32),           #硬盘容量及类型

  -- sold_count INT,             #已售出的数量
  -- is_onsale BOOLEAN           #是否促销中
);

/**笔记本电脑图片**/
CREATE TABLE wacom_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #商品唯一编号
  pic VARCHAR(128)          #图片路径
 
);


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

INSERT INTO wacom_laptop_family VALUES
    (NULL,'One by Wacom 学习板'),
    (NULL,'Wacom  Intuos系列数位板'),
    (NULL,'Wacom Intuos Pro 数位板'),
    (NULL,'Wacom Cintiq 数位屏'),
    (NULL,'Wacom one 创意数位屏'),
    (NULL,'Wacom MobileStudio Pro'),
    (NULL,'Bamboo智能生活科技'),
    (NULL,'原装配件'),
    (NULL,'Wacom官方认证开封品');

-- 轮播图商品列表
INSERT INTO wacom_classify_details VALUES
    (NULL,1,1,'CTL-472/K1-F','0'),
    (NULL,1,2,'CTL-672/K2-F','0'),
    (NULL,2,3,'CTL-4100/K0-CX','0'),
    (NULL,2,4,'CTL-6100/K0-CX','0'),
    (NULL,2,5,'CTL-6100WL','0'),
    (NULL,3,6,'PTH-660/K1- F','0'),
    (NULL,3,7,'PTH-860/K1-F','0'),
    (NULL,3,8,'PTH-660/K0-F','0'),
    (NULL,3,9,'PTH-460/K0-CX','0'),
    (NULL,3,10,'PTH-860/K0-F','0'),
    (NULL,4,11,'DTK-2200/K0-F','0'),
    (NULL,4,12,'DTH-3221/k0','0'),
    (NULL,4,13,'DTK-2261/K0-FX','0'),
    (NULL,4,14,'DTH-1620/AK0-F X','0'),
    (NULL,5,15,'DTC133W0F','0'),
    (NULL,6,16,'DTH-W1321L/K0-FX','0'),
    (NULL,6,17,'DPM-W1000L/K0-FX','0'),
    (NULL,6,18,'DTH-W1621H-K0F','0'),
    (NULL,6,19,'DPM-W1000H/K0-FX','0'),
    (NULL,6,20,'DTH-W1321H/K0-FX','0'),
    (NULL,7,21,'CDS- 810S','0'),
    (NULL,7,22,'CS-191','0'),
    (NULL,8,23,'ACK-628-02-K-ZX','0'),
    (NULL,8,24,'ACK-428-19-ZX','0'),
    (NULL,8,25,'ACK-627-01-K-ZX','0'),
    (NULL,9,26,'ACK-628-03-K- ZX','0'),
    (NULL,9,27,'ACK627KZ1X','0'),
    (NULL,9,28,'CDS-610S/G0-CX','0'),
    (NULL,9,29,'ACK42819ZX','0');

INSERT INTO wacom_laptop_pic VALUES 
    (NULL,1,'201801161608394924.jpg'),
    (NULL,1,'201801161608425333.jpg'),
    (NULL,1,'201801161608451172.jpg'),
    (NULL,1,'201801161608464391.jpg'),
    (NULL,1,'201801161608477111.jpg'),
    (NULL,1,'202002282145002989.jpg'),
    (NULL,2,'201801161609251879.jpg'),
    (NULL,2,'201801161609264988.jpg'),
    (NULL,2,'201801161609276178.jpg'),
    (NULL,2,'201801161609285578.jpg'),
    (NULL,2,'201801161609297247.jpg'),
    (NULL,3,'201803121709264056.jpg'),
    (NULL,3,'201803121709266086.jpg'),
    (NULL,3,'201803121709266206.jpg'),
    (NULL,3,'201803121709268196.jpg'),
    (NULL,3,'201803121709272466.jpg'),
    (NULL,4,'201803121703411980.jpg'),
    (NULL,4,'201803121703428399.jpg'),
    (NULL,4,'202002281056166019.jpg'),
    (NULL,5,'201804120918470141.jpg'),
    (NULL,5,'201804120918465021.jpg'),
    (NULL,5,'201804120918475261.jpg'),
    (NULL,5,'201804120918471051.jpg'),
    (NULL,5,'201806191804562038.jpg'),
    (NULL,6,'202002282306588182.jpg'),
    (NULL,7,'201801121516576936.jpg'),
    (NULL,7,'201801121516587275.jpg'),
    (NULL,7,'201801121516577396.jpg'),
    (NULL,7,'202002281058260853.jpg'),
    (NULL,8,'201801120956588768.jpg'),
    (NULL,8,'201801120957005997.jpg'),
    (NULL,9,'202002261636183912.jpg'),
    (NULL,9,'202002261636188652.jpg'),
    (NULL,9,'202002281059016673.jpg'),
    (NULL,10,'201801121515388171.jpg'),
    (NULL,10,'201801121515396371.jpg'),
    (NULL,10,'201801121515399601.jpg'),
    (NULL,11,'201708161357214993.jpg'),
    (NULL,11,'201708161357215032.jpg'),
    (NULL,12,'201809181437422056.png'),
    (NULL,13,'201907221309198651.png'),
    (NULL,14,'202002282323443012.jpg'),

    (NULL,15,'202002282323443012.jpg'),
    (NULL,16,'201801161608477111.jpg'),
    (NULL,17,'201801161608477111.jpg'),
    (NULL,18,'201801161608477111.jpg'),
    (NULL,19,'201801161608477111.jpg'),
    (NULL,20,'201801161608477111.jpg'),
    (NULL,21,'201801161608477111.jpg'),
    (NULL,22,'201801161608477111.jpg'),
    (NULL,23,'201801161608477111.jpg'),
    (NULL,24,'201801161608477111.jpg'),
    (NULL,25,'201801161608477111.jpg'),
    (NULL,26,'201801161608477111.jpg'),
    (NULL,27,'201801161608477111.jpg'),
    (NULL,28,'201801161608477111.jpg'),
    (NULL,29,'201801161608477111.jpg');
    
    --wacom_laptop数据
INSERT INTO wacom_laptop VALUES
    (NULL,1,1,'One by Wacom 学习板CTL-472/K1-F ','Wacom新品CTL-472数位学习板小号红黑版 手绘图画电子手写设计471新一代','399.00','1'),
    (NULL,1,2,'One by Wacom 学习板CTL-672/K2-F ','Wacom新品CTL-672数位学习板中号红黑版 手绘图画电子手写设计671新一代','599.00','192'),
    (NULL,2,3,'【新品上市 2018红点设计大奖】Wacom新一代影拓CTL-4100小号数位板 ','Intuos手绘画电子手写设计','599.00','24'),
    (NULL,2,4,'【新品上市 2018红点设计大奖】Wacom新一代影拓CTL-6100中号数位板 ','Intuos手绘画电子手写设计','999.00','27'),
    (NULL,2,5,'【新品上市 2018红点设计大奖】Wacom新一代影拓CTL-6100WL中号多彩无线数位板 ','Intuos手绘画电子手写设计','1480','20'),
    (NULL,3,6,'Wacom Intuos Pro 数位板 PTH-660/K1-F ','Wacom影拓Pro PTH-660中号触控数位板Intuos专业手绘图画手写设计','3280','25'),
    (NULL,3,7,'Wacom Intuos Pro 数位板 PTH-860/K1-F ','Wacom影拓Pro PTH-860大号触控数位板Intuos专业手绘图画手写设计','4380.00','76'),
    (NULL,3,8,'Wacom Intuos Pro 数位板 PTH-660/K0-F ','Wacom影拓Pro PTH-660中号触控数位板Intuos专业手绘图画手写设计','2880','16'),

    (NULL,3,9,'Wacom影拓Pro PTH-460 S号专业数位板Intuos专业手绘图画手写设计 ','','1999','20'),

    (NULL,3,10,'Wacom Intuos Pro 数位板 PTH-860/K0-F ','Wacom影拓Pro PTH-860大号触控数位板Intuos专业手绘图画手写设计','3980','83'),
    (NULL,4,11,'Wacom Cintiq 新帝数位屏 DTK-2200/K0-F ','Wacom新帝21.5寸DTK-2200数位屏 专业手绘图画高清液晶手写设计','17800','20'),
    (NULL,4,12,'Wacom Cintiq Pro 32英寸 触控液晶数位屏DTH-3221 ','Wacom Cintiq Pro 32英寸 触控液晶数位屏DTH-3221','29800','2'),
    (NULL,4,13,'WacomCintiq22创意数位屏DTK2261 ','','19800','10'),
    (NULL,4,14,'Wacom Cintiq Pro 数位屏 DTH-1620/AK0-FX ','新升级Wacom新帝Pro15.6寸DTH-1620数位屏专业手绘图画4K高清液晶手写板','11800','1'),
    (NULL,5,15,'One by Wacom 学习板CTL-472/K1-F ','Wacom新品CTL-472数位学习板小号红黑版 手绘图画电子手写设计471新一代','399.00','1'),
    (NULL,6,16,'One by Wacom 学习板CTL-672/K2-F ','Wacom新品CTL-672数位学习板中号红黑版 手绘图画电子手写设计671新一代','599.00','192'),
    (NULL,6,17,'【新品上市 2018红点设计大奖】Wacom新一代影拓CTL-4100小号数位板 ','Intuos手绘画电子手写设计','599.00','24'),
    (NULL,6,18,'【新品上市 2018红点设计大奖】Wacom新一代影拓CTL-6100中号数位板 ','Intuos手绘画电子手写设计','999.00','27'),
    (NULL,6,19,'【新品上市 2018红点设计大奖】Wacom新一代影拓CTL-6100WL中号多彩无线数位板 ','Intuos手绘画电子手写设计','1480','20'),
    (NULL,6,20,'Wacom Intuos Pro 数位板 PTH-660/K1-F ','Wacom影拓Pro PTH-660中号触控数位板Intuos专业手绘图画手写设计','3280','25'),
    (NULL,7,21,'Wacom Intuos Pro 数位板 PTH-860/K1-F ','Wacom影拓Pro PTH-860大号触控数位板Intuos专业手绘图画手写设计','4380.00','76'),
    (NULL,7,22,'Wacom Intuos Pro 数位板 PTH-660/K0-F ','Wacom影拓Pro PTH-660中号触控数位板Intuos专业手绘图画手写设计','2880','16'),
    (NULL,8,23,'Wacom影拓Pro PTH-460 S号专业数位板Intuos专业手绘图画手写设计 ','','1999','20'),
    (NULL,8,24,'Wacom Intuos Pro 数位板 PTH-860/K0-F ','Wacom影拓Pro PTH-860大号触控数位板Intuos专业手绘图画手写设计','3980','83'),
    (NULL,8,25,'Wacom Cintiq 新帝数位屏 DTK-2200/K0-F ','Wacom新帝21.5寸DTK-2200数位屏 专业手绘图画高清液晶手写设计','17800','20'),
    (NULL,9,26,'Wacom Cintiq Pro 32英寸 触控液晶数位屏DTH-3221 ','Wacom Cintiq Pro 32英寸 触控液晶数位屏DTH-3221','29800','2'),
    (NULL,9,27,'WacomCintiq22创意数位屏DTK2261 ','','19800','10'),
    (NULL,9,28,'Wacom Cintiq Pro 数位屏 DTH-1620/AK0-FX ','新升级Wacom新帝Pro15.6寸DTH-1620数位屏专业手绘图画4K高清液晶手写板','11800','1'),
    (NULL,9,29,'Wacom Cintiq Pro 数位屏 DTH-1620/AK0-FX ','新升级Wacom新帝Pro15.6寸DTH-1620数位屏专业手绘图画4K高清液晶手写板','11800','1')
    


   

-- SELECT * FROM user;
-- SELECT * FROM  user_details;   
-- DESC user;
-- DESC user_details;