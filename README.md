## atlas proxy, mysql-cluster主从目录结构

```bash
.
├── bin
│   ├── reset-slave.sh
│   ├── slave-replias-master-start.sh
│   └── stop-replicas.sh
├── master
│   ├── data
│   ├── init
│   └─────── init.sql
├── proxy
│   ├── conf
│   ├─────── test.cnf
│   ├── Atlas-2.2.1.el6.x86_64.rpm
│   └── Dockerfile
├── slave1
│   ├── data
│   ├── init
│   └─────── init.sql
├── slave1
│   ├── data
│   ├── init
│   └─────── init.sql
├── slave2
│   ├── data
│   ├── init
│   └─────── init.sql
├── slave3
│   ├── data
│   ├── init
│   └─────── init.sql
├── docker-compose.yaml
├── README.md
```
## 简介说明

```
标题：高可用读写分离 docker Atlas mysql GTID 主从复制 (一主三从)读写分离.
该项目来源于前人的思考总结,也参考了大大小小的项目，资料查询太多，就不一一列举了 ^.^。
重点介绍一下：
Atlas是由 Qihoo 360公司Web平台部基础架构团队开发维护的一个基于MySQL协议的数据中间层项目。
目前该项目在360公司内部得到了广泛应用，很多MySQL业务已经接入了Atlas平台，每天承载的读写请求数达几十亿条。
主要功能：
	1.读写分离
	2.从库负载均衡
	3.IP过滤
	4.自动分表
	5.DBA可平滑上下线DB
	6.自动摘除宕机的DB
个人观点：使用起来也比较简单,而且可以适用工业级生产环境.

用户/密码
mysql ：(root/slave)/abc.123
proxy : user/pwd

第一步：
cd docker-mysql-cluster && docker-compose up -d

第二步:
访问数据库中间件代理 http://ip:1234
db proxy admin         http://ip:2345

运行过程出现问题:考虑
innodb_buffer_pool_size值是否过大
总内存过小,swap交换分区设置是否合适

正式环境:
需要怎么调，忽略啦,感兴趣，可以留言,一起讨论.

主从同步延时状况
https://github.com/arstercz/Atlas_auto_setline

更多设置与了解:
https://github.com/Qihoo360/Atlas/blob/master/README_ZH.md

更多关键字:
数据一致性，半复制
```
##部署后效果图
![第一步:docker-compose up -d](https://3jxq.com/public/upload/b00cd02d3da7849dfac74bb4a0dbc04a.png)
![连接proxy](https://3jxq.com/public/upload/813f859fe9c8ff006094265091eab668.png)
![创建mysql中间件中创建库](https://3jxq.com/public/upload/e0607a4f86cf2364219390d79a25d765.png)
![连接mysql主库](https://3jxq.com/public/upload/4ba6ce00ea8a0078be8da9a376b4ac60.png)
其他效果图忽略啦。

mysql测试
mysql
