
/**用户登录表**/
CREATE TABLE ks_user(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32)
);
insert into ks_user values
(null,'tom',md5('123'));
alter TABLE ks_user add column head_img VARCHAR(255);
update ks_user set head_img="img/tom.jpg";
-- 小知识表
create table ks_know(
  kid INT PRIMARY KEY AUTO_INCREMENT,
  kname VARCHAR(255),
  kpic VARCHAR(255),
  ktime DATETIME,
  kpoint INT,
  kcomment INT,
  kcontent VARCHAR(10000)
);
INSERT INTO ks_know VALUES
(null,'宇宙|月亮是什么颜色','img/know/1.png',now(),0,0,'这是宇宙|月亮是什么颜色的内容'),
(null,'动物|乌龟为什么要缩头','img/know/2.png',now(),0,0,'这是动物|乌龟为什么要缩头的内容'),
(null,'动脑筋|一个铁嘴巴，两颗尖尖牙','img/know/3.png',now(),0,0,'这是动脑筋|一个铁嘴巴，两颗尖尖牙的内容'),
(null,'小马宝莉|太阳会消失吗','img/know/4.png',now(),0,0,'这是小马宝莉|太阳会消失吗的内容'),
(null,'脑洞|为什么没人骑斑马','img/know/5.png',now(),0,0,'这是脑洞|为什么没人骑斑马的内容'),
(null,'人体|打喷嚏要不要捂着','img/know/6.png',now(),0,0,'这是人体|打喷嚏要不要捂着的内容'),
(null,'安全|为什么为什么有的插头三只脚','img/know/7.png',now(),0,0,'这是安全|为什么为什么有的插头三只脚的内容'),
(null,'恐龙|恐龙长着鸭子嘴','img/know/8.png',now(),0,0,'这是恐龙|恐龙长着鸭子嘴的内容'),
(null,'植物|面包树上真能长面包','img/know/9.png',now(),0,0,'这是植物|面包树上真能长面包的内容');
-- 故事表
create table ks_story(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  uid INT,
  sname VARCHAR(255),
  ssubname VARCHAR(64),
  spic VARCHAR(255),
  stime DATETIME,
  spoint INT,
  scomment INT,
  scontent VARCHAR(10000)
);
INSERT INTO ks_story VALUES
(null,1,'多吃蔬菜身体棒','宝贝胃口好，妈妈少烦恼','img/story/1.jpg',now(),0,0,'这是多吃蔬菜身体棒的内容'),
(null,1,'我的新玩具','了解友情的真谛','img/story/2.jpg',now(),0,0,'这是我的新玩具的内容'),
(null,1,'别这样小乖','性格培养 | 不辜负朋友的信任','img/story/3.jpg',now(),0,0,'这是别这样小乖的内容'),
(null,1,'如果我说不呢','心灵养成 | 调皮与想象力','img/story/4.jpg',now(),0,0,'这是如果我说不呢的内容');
INSERT INTO ks_story VALUES
(null,1,'恐龙大陆','科普 | 恐龙历险故事','img/story/5.jpg',now(),0,0,'这是恐龙大陆的内容'),
(null,1,'不睡觉世界冠军','轻松哄睡 | 知名晚安绘本','img/story/6.jpg',now(),0,0,'这是不睡觉世界冠军的内容');
INSERT INTO ks_story VALUES
(null,1,'【新】大家晚安','轻松哄睡 | 让孩子快速入眠','img/story/7.jpg',now(),0,0,'这是大家晚安的内容'),
(null,1,'田鼠阿佛','自我认知 | 绘本领域里程碑','img/story/8.jpg',now(),0,0,'这是田鼠阿佛的内容'),
(null,1,'小老鼠和大老虎','不一样的故事，一样的感动','img/story/9.jpg',now(),0,0,'这是小老鼠和大老虎的内容'),
(null,1,'可恶的坏毛病，麻烦统统走开','习惯养成 | 这些毛病不能有','img/story/10.jpg',now(),0,0,'这是可恶的坏毛病，麻烦统统走开的内容'),
(null,1,'凯叔·恐龙战士','每个孩子都是一只霸王龙','img/story/11.jpg',now(),0,0,'这是凯叔·恐龙战士的内容'),
(null,1,'大头鱼去旅行','世界那么大我想去看看','img/story/12.jpg',now(),0,0,'这是大头鱼去旅行的内容');

-- 分类表
create table ks_classify(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  cname VARCHAR(10),
  fname VARCHAR(20),
  fimg  VARCHAR(255),
  count int
);
insert into ks_classify values
(null,"精选","情商培养","img/classify/01.png",222),
(null,"精选","奇幻冒险","img/classify/02.png",222),
(null,"精选","习惯养成","img/classify/03.png",222),
(null,"精选","轻松哄睡","img/classify/04.png",222),
(null,"精选","安全教育","img/classify/05.png",222),
(null,"精选","科普百科","img/classify/06.png",222),
(null,"精选","品格培养","img/classify/04.png",222),
(null,"精选","社交能力","img/classify/05.png",222),
(null,"精选","心灵养成","img/classify/06.png",222),
(null,"热门","免费故事","img/classify/01.png",222),
(null,"热门","付费故事","img/classify/02.png",222),
(null,"热门","科普故事","img/classify/03.png",222),
(null,"热门","黑猫警长","img/classify/04.png",222),
(null,"热门","国学传统","img/classify/05.png",222),
(null,"热门","精选合集","img/classify/06.png",222),
(null,"年龄","0-2岁","img/classify/01.png",222),
(null,"年龄","3岁+","img/classify/02.png",222),
(null,"年龄","6岁+","img/classify/03.png",222),
(null,"年龄","全龄精选","img/classify/04.png",222),
(null,"年龄","安全教育","img/classify/05.png",222),
(null,"年龄","科普百科","img/classify/06.png",222),
(null,"类型","奇幻冒险","img/classify/01.png",222),
(null,"类型","推理智力","img/classify/02.png",222),
(null,"类型","幼儿启蒙","img/classify/03.png",222),
(null,"类型","儿童文学","img/classify/04.png",222),
(null,"类型","民间传说","img/classify/05.png",222),
(null,"类型","绘本故事","img/classify/06.png",222);

-- 创建评论表
CREATE TABLE ks_comment(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nid INT,
  ctype VARCHAR(20),
  content VARCHAR(120),
  ctime DATETIME
);

-- 创建课程表
create table ks_course(
  id INT PRIMARY KEY AUTO_INCREMENT,
  family VARCHAR(20),
  title VARCHAR(20),
  sub_title VARCHAR(64),
  price int,
  v_price int,
  content VARCHAR(2000),
  pic VARCHAR(255),
  c_time VARCHAR(64)
);
insert into ks_course values
(null,"训练营","0基础学油画棒，轻松画出大师名作|4.9","【送全套画材包】拿起笔就能创作",499,474,"0基础学油画棒，轻松画出名师大作","img/course/xly01.png","2019-04-09"),
(null,"训练营","羊毛毡亲子手工，让周末更温暖|4.27","【送进口材料包】限量500套",458,435,"羊毛毡亲子手工，让周末更温暖","img/course/xly02.png","2019-04-27"),
(null,"训练营","45天学会陶笛，快乐轻松吹奏经典歌曲|4.29","【送陶笛】0基础掌握一门乐器",428,400,"45天学会陶笛，快乐轻松吹奏经典歌曲","img/course/xly03.png","2019-04-29"),
(null,"训练营","玩出专注力，轻松好成绩|4.23","脑科学家团队倾力研发，群内答疑",499,465,"玩出专注力，轻松好成绩","img/course/xly04.png","2019-04-23"),
(null,"训练营","6-7岁计算专题，看动画轻松学加减法|4.10","【送配套学具】计算原理+巧算思维",499,475,"6-7岁计算专题，看动画轻松学加减法","img/course/xly05.png","2019-04-10");

insert into ks_course values
(null,"专栏","给孩子的24节气健康课","每天5分钟，跟着节气养孩子",199,175,"给孩子的24节气健康课","img/course/zl01.png","2019-04-09"),
(null,"专栏","严艺家·华情绪·成长发动机","没有愤怒，哪来锋芒",98,86,"严艺家·华情绪·成长发动机","img/course/zl02.png","2019-04-27"),
(null,"专栏","付琳·P.E.T极简亲子沟通","不吼不叫养出有责任心的孩子",98,86,"付琳·P.E.T极简亲子沟通","img/course/zl03.png","2019-04-29"),
(null,"专栏","刘心仪·妈妈护肤私房课","是妈妈，也是美少女",69,60,"心仪·妈妈护肤私房课","img/course/zl04.png","2019-04-23"),
(null,"专栏","宫学萍·如何对孩子说不","说出自己话出未来",99,75,"宫学萍·如何对孩子说不","img/course/zl05.png","2019-04-10");

insert into ks_course values
(null,"微课","亲子阅读到底该怎么读","凯叔·凯叔讲故事·创始人",8,7,"亲子阅读到底该怎么读","img/course/wk01.png","2019-04-09"),
(null,"微课","养孩子，你最闹心的10件事","尹丽丽《好妈妈胜过好老师》的作者",8,6,"养孩子，你最闹心的10件事","img/course/wk02.png","2019-04-27"),
(null,"微课","高情商是培养出来的吗","李雪·心理学专家",8,6,"高情商是培养出来的吗","img/course/wk03.png","2019-04-29"),
(null,"微课","如何说孩子才会听，如何听孩子才会说","安心·美国P.E.T中国唯一督导",9,8,"如何说孩子才会听，如何听孩子才会说","img/course/wk04.png","2019-04-23"),
(null,"微课","孩子不自信，可能是你帮倒忙了","甘宁著名共情陪伴资深讲师",9,7,"孩子不自信，可能是你帮倒忙了","img/course/wk05.png","2019-04-10");

