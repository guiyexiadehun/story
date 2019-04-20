// 引入模块mysql和express
const express=require("express");
const mysql=require("mysql");
// 1.1引入模块cors 
const cors=require("cors");
//创建连接池
var pool=mysql.createPool({
    host     : process.env.MYSQL_HOST,
    port     : process.env.MYSQL_PORT,
    user     : process.env.ACCESSKEY,
    password : process.env.SECRETKEY,
    database : 'app_' + process.env.APPNAME
})
//创建express对象
var server=express();
// 配置允许访问列:指定允许哪个端口跨域访问服务器
server.use(cors({
    origin:["http://127.0.0.1:5050","http://localhost:5050"],
    credentials:true
}));
const session=require("express-session");
// 配置session
server.use(session({
    secret:"128位随机字符串",//安全字符串
    resave:false,  //每次请求更新session值 ，不更新
    saveUninitialized:true,//初始化保存数据
    // cookie:{
    //     maxAge:1000*60*60 //辅助session工作
    // }
}))
//静态资源托管
server.use(express.static("public"));
//配置第三方中间件
const bodyParser=require("body-parser");
server.use(bodyParser.urlencoded({
    extended:false
}))
//监听3000端口
server.listen(5050);
//功能1
//1.用户get 请求路径/login
//2.获取两个参数uname和upwd
//3.创建sql语句
//4.执行sql
//5.获取数据库返回结果
//6.返回客户数据
server.get("/login",(req,res)=>{
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    var sql="select id from ks_user where uname=? and upwd=md5(?)" 
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length==0){
            res.send({code:-1,msg:"用户名或者密码有误"});
        }else{
            //获取用户id保存到session对象中
            req.session.uname=uname;
            res.send({code:1,msg:"登录成功"});
        } 
    })
})
// 加载session
server.get("/loadSession",(req,res)=>{
    var uname=req.session.uname;
    var sql="select * from ks_user where uname=?"
    pool.query(sql,[uname],(err,result)=>{
        if(err) throw err;
        if(result.length==0){
            res.send({code:-1,msg:"未登录"});
        }else{
            res.send({code:1,data:result});
        } 
    })
})
//功能2：首页轮播图
server.get("/imgList",(req,res)=>{
    var rows=[
        {lid:1,img_url:"img/index/banner1.png"},
        {lid:2,img_url:"img/index/banner2.png"},
        {lid:3,img_url:"img/index/banner3.png"},
        {lid:4,img_url:"img/index/banner4.png"},
        // {lid:5,img_url:"img/index/banner5.png"},
        // {lid:6,img_url:"img/index/banner6.png"},
        {lid:7,img_url:"img/index/banner7.png"},
        {lid:8,img_url:"img/index/banner8.png"},
    ];
    res.send({code:1,data:rows});
})
//功能3：九宫格
server.get("/grid",(req,res)=>{
    var rows=[
        {lid:1,title:"叫早哄睡",img_url:"img/grid/menu1.png"},
        {lid:2,title:"排行榜",img_url:"img/grid/menu2.png"},
        {lid:3,title:"会员",img_url:"img/grid/menu3.png"},
        {lid:4,title:"分类",img_url:"img/grid/menu4.png"},
        {lid:5,title:"课程集锦",img_url:"img/grid/menu5.png"},
        // {lid:6,title:"凯叔小知识",img_url:"img/grid/menu6.png"}
    ];
    res.send({code:1,data:rows});
})
//功能4：小知识列表
server.get("/knowList",(req,res)=>{
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    var start=(pno-1)*pageSize;
    var sql="";
    if(!pno||!pageSize){
        sql="select kid,kname,ktime,kpic,kpoint,kcomment from ks_know"
    }else{
        sql=`select kid,kname,ktime,kpic,kpoint,kcomment from ks_know limit ${start},${pageSize}`
    }
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })

})
//功能5：首页推荐
server.get("/recommendList",(req,res)=>{
    var sql="select sid,uid,sname,ssubname,spic from ks_story limit 1,4"
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })

})
//功能6：首页精选
server.get("/claList",(req,res)=>{
    var sql="select fid,fname,fimg from ks_classify where cname='精选' limit 0,6"
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })

})

//功能7：分类页
server.get("/hotList",(req,res)=>{
    var sql="select fid,fname,fimg,count from ks_classify where cname='热门'"
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })

})
server.get("/ageList",(req,res)=>{
    var sql="select fid,fname,fimg,count from ks_classify where cname='年龄'"
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })

})
server.get("/funcList",(req,res)=>{
    var sql="select fid,fname,fimg,count from ks_classify where cname='精选'"
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })

})
server.get("/classList",(req,res)=>{
    var sql="select fid,fname,fimg,count from ks_classify where cname='类型'"
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })

})
// 功能8：故事列表页
server.get("/getStory",(req,res)=>{
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    var start=(pno-1)*pageSize;
    var sql=`select sid,uid,sname,ssubname,spic from ks_story limit ${start},${pageSize}`
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })

})

//功能9：故事详情页
server.get("/storyInfo",(req,res)=>{
    var sid=req.query.sid;
    var sql=`select sname,ssubname,spic,scontent from ks_story where sid=?`
    pool.query(sql,[sid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })

})

//功:10：发表评论
server.post("/addcomment",(req,res)=>{
    //获取参数
    var kid=req.body.kid;
    var sid=req.body.sid;
    var content=req.body.content;
    var ctype=req.body.ctype;
    //2.sql
    var sql=""
    if(!sid){
        sql=`insert into ks_comment values (null,${kid},?,?,now())`
    }else{
        sql=`insert into ks_comment values (null,${sid},?,?,now())`
    }
    pool.query(sql,[ctype,content],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"添加成功"})
    })
    //3.json
});

//功能11：评论列表
server.get("/getcomment",(req,res)=>{
    //1.参数
    var sid=req.query.sid;
    var kid=req.query.kid;
    var pno=req.query.pno;
    var pageSize=req.query.pageSize;
    if(!pno){
        pno=1;
    }
    if(!pageSize){
        pageSize=5;
    }
    var sql="";
    if(!sid){
        sql=`select id,sid,content,ctime from ks_comment where sid=${kid} and ctype="know" limit ?,?`
    }else{sql=`select id,sid,content,ctime from ks_comment where sid=${sid} and ctype="story" limit ?,?`}
    var start=(pno-1)*pageSize;
    pageSize=parseInt(pageSize);
    pool.query(sql,[start,pageSize],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,data:result})  
        }
    })
})

//功能11：小知识详情页
server.get("/knowInfo",(req,res)=>{
    var kid=req.query.kid;
    var sql=`select kname,kpic,kcontent from ks_know where kid=?`
    pool.query(sql,[kid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })

})
 //功能12：课程分类菜单
server.get("/getMenu",(req,res)=>{
    var rows=[
        {lid:1,title:"训练营",img_url:"img/course/xly.png"},
        {lid:2,title:"专栏",img_url:"img/course/zl.png"},
        {lid:3,title:"微课",img_url:"img/course/wk.png"},
        {lid:4,title:"全部",img_url:"img/course/all.png"}
    ];
    res.send({code:1,data:rows});
})

//功能13：课程列表
server.get("/getCourse",(req,res)=>{
    var family=req.query.family;
    var sql=`select * from ks_course where family=?`
    pool.query(sql,[family],(err,result)=>{
        if(err) throw err;
        res.send({code:1,data:result});
    })
})

// 功能14：查询
server.get("/search",(req,res)=>{
    var subtitle=req.query.subtitle;
    var sql=`select * from ks_story where ssubname like '%${subtitle}%'`;
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,data:result});
        }else{
            res.send({code:-1,msg:"很抱歉！没有找到相关内容"});
        }
    })
})