/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - ssmcj38t
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssmcj38t` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssmcj38t`;

/*Table structure for table `banji` */

DROP TABLE IF EXISTS `banji`;

CREATE TABLE `banji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `banji` varchar(200) NOT NULL COMMENT '班级',
  PRIMARY KEY (`id`),
  UNIQUE KEY `banji` (`banji`)
) ENGINE=InnoDB AUTO_INCREMENT=1617076288840 DEFAULT CHARSET=utf8 COMMENT='班级';

/*Data for the table `banji` */

insert  into `banji`(`id`,`addtime`,`banji`) values (21,'2021-03-30 11:42:23','班级1'),(22,'2021-03-30 11:42:23','班级2'),(23,'2021-03-30 11:42:23','班级3'),(24,'2021-03-30 11:42:23','班级4'),(25,'2021-03-30 11:42:23','班级5'),(26,'2021-03-30 11:42:23','班级6'),(1617076288839,'2021-03-30 11:51:28','生工1902班');

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

insert  into `config`(`id`,`name`,`value`) values (1,'picture1','http://localhost:8080/ssmcj38t/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/ssmcj38t/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/ssmcj38t/upload/picture3.jpg'),(6,'homepage',NULL);

/*Table structure for table `exampaper` */

DROP TABLE IF EXISTS `exampaper`;

CREATE TABLE `exampaper` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int(11) NOT NULL COMMENT '考试时长(分钟)',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617076514320 DEFAULT CHARSET=utf8 COMMENT='试卷表';

/*Data for the table `exampaper` */

insert  into `exampaper`(`id`,`addtime`,`name`,`time`,`status`) values (1617076514319,'2021-03-30 11:55:14','高等数学期末考试',30,1);

/*Table structure for table `examquestion` */

DROP TABLE IF EXISTS `examquestion`;

CREATE TABLE `examquestion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint(20) NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint(20) DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint(20) DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617076647552 DEFAULT CHARSET=utf8 COMMENT='试题表';

/*Data for the table `examquestion` */

insert  into `examquestion`(`id`,`addtime`,`paperid`,`papername`,`questionname`,`options`,`score`,`answer`,`analysis`,`type`,`sequence`) values (1617076552735,'2021-03-30 11:55:51',1617076514319,'高等数学期末考试','10以内的质数有几个','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.4\",\"code\":\"C\"},{\"text\":\"D.5\",\"code\":\"D\"}]',25,'C','FFG',0,1),(1617076583972,'2021-03-30 11:56:23',1617076514319,'高等数学期末考试','10以内的合数有4个','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',25,'B','10以内的合数有5个，分别是468910',2,3),(1617076627757,'2021-03-30 11:57:06',1617076514319,'高等数学期末考试','10以内的质数有哪些','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.5\",\"code\":\"C\"},{\"text\":\"D.8\",\"code\":\"D\"}]',25,'A,B,C','FFGDRG',1,2),(1617076647551,'2021-03-30 11:57:27',1617076514319,'高等数学期末考试','10以内的合数有哪些','[]',25,'468910','DSFRD',3,4);

/*Table structure for table `examrecord` */

DROP TABLE IF EXISTS `examrecord`;

CREATE TABLE `examrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint(20) NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint(20) NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint(20) DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint(20) NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617076682043 DEFAULT CHARSET=utf8 COMMENT='考试记录表';

/*Data for the table `examrecord` */

insert  into `examrecord`(`id`,`addtime`,`userid`,`username`,`paperid`,`papername`,`questionid`,`questionname`,`options`,`score`,`answer`,`analysis`,`myscore`,`myanswer`) values (1617075956226,'2021-03-30 11:45:55',31,NULL,1617075908180,'1',1617075922907,'1','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',100,'A','1',100,'A'),(1617076667537,'2021-03-30 11:57:47',1617076410746,NULL,1617076514319,'高等数学期末考试',1617076552735,'10以内的质数有几个','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.4\",\"code\":\"C\"},{\"text\":\"D.5\",\"code\":\"D\"}]',25,'C','FFG',25,'C'),(1617076671920,'2021-03-30 11:57:51',1617076410746,NULL,1617076514319,'高等数学期末考试',1617076627757,'10以内的质数有哪些','[{\"text\":\"A.2\",\"code\":\"A\"},{\"text\":\"B.3\",\"code\":\"B\"},{\"text\":\"C.5\",\"code\":\"C\"},{\"text\":\"D.8\",\"code\":\"D\"}]',25,'A,B,C','FFGDRG',25,'A,B,C'),(1617076676341,'2021-03-30 11:57:55',1617076410746,NULL,1617076514319,'高等数学期末考试',1617076583972,'10以内的合数有4个','[{\"text\":\"A.对\",\"code\":\"A\"},{\"text\":\"B.错\",\"code\":\"B\"}]',25,'B','10以内的合数有5个，分别是468910',0,'A'),(1617076682042,'2021-03-30 11:58:01',1617076410746,NULL,1617076514319,'高等数学期末考试',1617076647551,'10以内的合数有哪些','[]',25,'468910','DSFRD',25,'468910');

/*Table structure for table `gonggaoxinxi` */

DROP TABLE IF EXISTS `gonggaoxinxi`;

CREATE TABLE `gonggaoxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gonggaobiaoti` varchar(200) NOT NULL COMMENT '公告标题',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `neirong` longtext COMMENT '内容',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617076274666 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `gonggaoxinxi` */

insert  into `gonggaoxinxi`(`id`,`addtime`,`gonggaobiaoti`,`tupian`,`neirong`,`faburiqi`) values (11,'2021-03-30 11:42:23','公告标题1','http://localhost:8080/ssmcj38t/upload/1617076008660.jpg','<p>内容1</p>','2021-03-30'),(12,'2021-03-30 11:42:23','公告标题2','http://localhost:8080/ssmcj38t/upload/1617076015420.jpg','<p>内容2</p>','2021-03-30'),(13,'2021-03-30 11:42:23','公告标题3','http://localhost:8080/ssmcj38t/upload/1617076025725.jpg','<p>内容3</p>','2021-03-30'),(14,'2021-03-30 11:42:23','公告标题4','http://localhost:8080/ssmcj38t/upload/1617076033727.png','<p>内容4</p>','2021-03-30'),(15,'2021-03-30 11:42:23','公告标题5','http://localhost:8080/ssmcj38t/upload/1617076043465.jpg','<p>内容5</p>','2021-03-30'),(16,'2021-03-30 11:42:23','公告标题6','http://localhost:8080/ssmcj38t/upload/1617076051850.jpg','<p>内容6</p>','2021-03-30'),(1617076274665,'2021-03-30 11:51:14','关于考试时间通知','http://localhost:8080/ssmcj38t/upload/1617076263916.jpg','<p>考试时间通知</p><p><img src=\"http://localhost:8080/ssmcj38t/upload/1617076272857.jpg\"></p>','2021-03-30');

/*Table structure for table `jiaoshi` */

DROP TABLE IF EXISTS `jiaoshi`;

CREATE TABLE `jiaoshi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoshigonghao` varchar(200) NOT NULL COMMENT '教师工号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  `zhicheng` varchar(200) DEFAULT NULL COMMENT '职称',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jiaoshigonghao` (`jiaoshigonghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1617076434541 DEFAULT CHARSET=utf8 COMMENT='教师';

/*Data for the table `jiaoshi` */

insert  into `jiaoshi`(`id`,`addtime`,`jiaoshigonghao`,`mima`,`jiaoshixingming`,`xingbie`,`zhaopian`,`zhicheng`,`lianxidianhua`) values (41,'2021-03-30 11:42:23','教师1','123456','教师姓名1','男','http://localhost:8080/ssmcj38t/upload/jiaoshi_zhaopian1.jpg','职称1','13823888881'),(42,'2021-03-30 11:42:23','教师2','123456','教师姓名2','男','http://localhost:8080/ssmcj38t/upload/jiaoshi_zhaopian2.jpg','职称2','13823888882'),(43,'2021-03-30 11:42:23','教师3','123456','教师姓名3','男','http://localhost:8080/ssmcj38t/upload/jiaoshi_zhaopian3.jpg','职称3','13823888883'),(44,'2021-03-30 11:42:23','教师4','123456','教师姓名4','男','http://localhost:8080/ssmcj38t/upload/jiaoshi_zhaopian4.jpg','职称4','13823888884'),(45,'2021-03-30 11:42:23','教师5','123456','教师姓名5','男','http://localhost:8080/ssmcj38t/upload/jiaoshi_zhaopian5.jpg','职称5','13823888885'),(46,'2021-03-30 11:42:23','教师6','123456','教师姓名6','男','http://localhost:8080/ssmcj38t/upload/jiaoshi_zhaopian6.jpg','职称6','13823888886'),(1617076434540,'2021-03-30 11:53:54','2','2','张英','女','http://localhost:8080/ssmcj38t/upload/1617076428157.jpg','中级教师','12345678945');

/*Table structure for table `kechengchengji` */

DROP TABLE IF EXISTS `kechengchengji`;

CREATE TABLE `kechengchengji` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `xueqi` varchar(200) DEFAULT NULL COMMENT '学期',
  `kaohechengji` int(11) DEFAULT NULL COMMENT '考核成绩',
  `pingyu` varchar(200) DEFAULT NULL COMMENT '评语',
  `dengjishijian` date DEFAULT NULL COMMENT '登记时间',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617076730408 DEFAULT CHARSET=utf8 COMMENT='课程成绩';

/*Data for the table `kechengchengji` */

insert  into `kechengchengji`(`id`,`addtime`,`kechengmingcheng`,`banji`,`xueqi`,`kaohechengji`,`pingyu`,`dengjishijian`,`jiaoshigonghao`,`jiaoshixingming`,`xuehao`,`xueshengxingming`) values (71,'2021-03-30 11:42:23','课程名称1','班级1','学期1',1,'评语1','2021-03-30','教师工号1','教师姓名1','学号1','学生姓名1'),(72,'2021-03-30 11:42:23','课程名称2','班级2','学期2',2,'评语2','2021-03-30','教师工号2','教师姓名2','学号2','学生姓名2'),(73,'2021-03-30 11:42:23','课程名称3','班级3','学期3',3,'评语3','2021-03-30','教师工号3','教师姓名3','学号3','学生姓名3'),(74,'2021-03-30 11:42:23','课程名称4','班级4','学期4',4,'评语4','2021-03-30','教师工号4','教师姓名4','学号4','学生姓名4'),(75,'2021-03-30 11:42:23','课程名称5','班级5','学期5',5,'评语5','2021-03-30','教师工号5','教师姓名5','学号5','学生姓名5'),(76,'2021-03-30 11:42:23','课程名称6','班级6','学期6',6,'评语6','2021-03-30','教师工号6','教师姓名6','学号6','学生姓名6'),(1617076730407,'2021-03-30 11:58:49','高等数学','生工1902班','上学期',75,'需要多努力','2021-06-24','2','张英','1','陈一');

/*Table structure for table `kechengxinxi` */

DROP TABLE IF EXISTS `kechengxinxi`;

CREATE TABLE `kechengxinxi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `xueqi` varchar(200) DEFAULT NULL COMMENT '学期',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `faburiqi` date DEFAULT NULL COMMENT '发布日期',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617076453774 DEFAULT CHARSET=utf8 COMMENT='课程信息';

/*Data for the table `kechengxinxi` */

insert  into `kechengxinxi`(`id`,`addtime`,`kechengmingcheng`,`tupian`,`xueqi`,`banji`,`faburiqi`,`jiaoshigonghao`,`jiaoshixingming`) values (51,'2021-03-30 11:42:23','课程名称1','http://localhost:8080/ssmcj38t/upload/1617076093878.jpg','上学期','班级1','2021-03-30','教师工号1','教师姓名1'),(52,'2021-03-30 11:42:23','课程名称2','http://localhost:8080/ssmcj38t/upload/1617076100913.jpg','上学期','班级2','2021-03-30','教师工号2','教师姓名2'),(53,'2021-03-30 11:42:23','课程名称3','http://localhost:8080/ssmcj38t/upload/1617076107972.jpg','上学期','班级3','2021-03-30','教师工号3','教师姓名3'),(54,'2021-03-30 11:42:23','课程名称4','http://localhost:8080/ssmcj38t/upload/1617076116038.jpg','上学期','班级4','2021-03-30','教师工号4','教师姓名4'),(55,'2021-03-30 11:42:23','课程名称5','http://localhost:8080/ssmcj38t/upload/1617076148928.jpg','上学期','班级5','2021-03-30','教师工号5','教师姓名5'),(56,'2021-03-30 11:42:23','课程名称6','http://localhost:8080/ssmcj38t/upload/1617076168481.jpg','上学期','班级6','2021-03-30','教师工号6','教师姓名6'),(1617076453773,'2021-03-30 11:54:13','高等数学','http://localhost:8080/ssmcj38t/upload/1617076447291.jpg','上学期','生工1902班','2021-03-30','2','张英');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'abo','users','管理员','c9od1hhr7dxpah8ch47qzs4e2g7z4rs5','2021-03-30 11:44:27','2021-03-30 12:59:04'),(2,41,'教师1','jiaoshi','管理员','dwus2q0ebxm5jo0jqspgn15irel2e19q','2021-03-30 11:44:57','2021-03-30 12:46:09'),(3,31,'学生1','xuesheng','学生','91r6qbsg1yx5w20m3q8eqa5cjshw0y74','2021-03-30 11:45:43','2021-03-30 12:45:43'),(4,1617076410746,'1','xuesheng','学生','xvutmv7t0w6gaem843dxbz2qbmadvxo1','2021-03-30 11:54:21','2021-03-30 12:58:56'),(5,1617076434540,'2','jiaoshi','管理员','uj8abroa4se35q1oz3g6e13uuz3q2e6y','2021-03-30 11:54:47','2021-03-30 12:58:19');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'abo','abo','管理员','2021-03-30 11:42:23');

/*Table structure for table `xuesheng` */

DROP TABLE IF EXISTS `xuesheng`;

CREATE TABLE `xuesheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xueshengxingming` varchar(200) NOT NULL COMMENT '学生姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=1617076410747 DEFAULT CHARSET=utf8 COMMENT='学生';

/*Data for the table `xuesheng` */

insert  into `xuesheng`(`id`,`addtime`,`xuehao`,`mima`,`xueshengxingming`,`xingbie`,`touxiang`,`banji`,`shouji`,`youxiang`) values (31,'2021-03-30 11:42:23','学生1','123456','学生姓名1','男','http://localhost:8080/ssmcj38t/upload/xuesheng_touxiang1.jpg','班级1','13823888881','773890001@qq.com'),(32,'2021-03-30 11:42:23','学生2','123456','学生姓名2','男','http://localhost:8080/ssmcj38t/upload/xuesheng_touxiang2.jpg','班级2','13823888882','773890002@qq.com'),(33,'2021-03-30 11:42:23','学生3','123456','学生姓名3','男','http://localhost:8080/ssmcj38t/upload/xuesheng_touxiang3.jpg','班级3','13823888883','773890003@qq.com'),(34,'2021-03-30 11:42:23','学生4','123456','学生姓名4','男','http://localhost:8080/ssmcj38t/upload/xuesheng_touxiang4.jpg','班级4','13823888884','773890004@qq.com'),(35,'2021-03-30 11:42:23','学生5','123456','学生姓名5','男','http://localhost:8080/ssmcj38t/upload/xuesheng_touxiang5.jpg','班级5','13823888885','773890005@qq.com'),(36,'2021-03-30 11:42:23','学生6','123456','学生姓名6','男','http://localhost:8080/ssmcj38t/upload/xuesheng_touxiang6.jpg','班级6','13823888886','773890006@qq.com'),(1617076410746,'2021-03-30 11:53:30','1','1','陈一','女','http://localhost:8080/ssmcj38t/upload/1617076304525.jpg','生工1902班','12312312312','123@qq.com');

/*Table structure for table `xueshengxuanke` */

DROP TABLE IF EXISTS `xueshengxuanke`;

CREATE TABLE `xueshengxuanke` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `banji` varchar(200) DEFAULT NULL COMMENT '班级',
  `xueqi` varchar(200) DEFAULT NULL COMMENT '学期',
  `xuankeriqi` date DEFAULT NULL COMMENT '选课日期',
  `jiaoshigonghao` varchar(200) DEFAULT NULL COMMENT '教师工号',
  `jiaoshixingming` varchar(200) DEFAULT NULL COMMENT '教师姓名',
  `xuehao` varchar(200) DEFAULT NULL COMMENT '学号',
  `xueshengxingming` varchar(200) DEFAULT NULL COMMENT '学生姓名',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617076480552 DEFAULT CHARSET=utf8 COMMENT='学生选课';

/*Data for the table `xueshengxuanke` */

insert  into `xueshengxuanke`(`id`,`addtime`,`kechengmingcheng`,`banji`,`xueqi`,`xuankeriqi`,`jiaoshigonghao`,`jiaoshixingming`,`xuehao`,`xueshengxingming`,`beizhu`,`sfsh`,`shhf`) values (61,'2021-03-30 11:42:23','课程名称1','班级1','学期1','2021-03-30','教师工号1','教师姓名1','学号1','学生姓名1','备注1','是',''),(62,'2021-03-30 11:42:23','课程名称2','班级2','学期2','2021-03-30','教师工号2','教师姓名2','学号2','学生姓名2','备注2','是',''),(63,'2021-03-30 11:42:23','课程名称3','班级3','学期3','2021-03-30','教师工号3','教师姓名3','学号3','学生姓名3','备注3','是',''),(64,'2021-03-30 11:42:23','课程名称4','班级4','学期4','2021-03-30','教师工号4','教师姓名4','学号4','学生姓名4','备注4','是',''),(65,'2021-03-30 11:42:23','课程名称5','班级5','学期5','2021-03-30','教师工号5','教师姓名5','学号5','学生姓名5','备注5','是',''),(66,'2021-03-30 11:42:23','课程名称6','班级6','学期6','2021-03-30','教师工号6','教师姓名6','学号6','学生姓名6','备注6','是',''),(1617076480551,'2021-03-30 11:54:40','高等数学','生工1902班','上学期','2021-03-31','2','张英','1','陈一','','是','ok');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
