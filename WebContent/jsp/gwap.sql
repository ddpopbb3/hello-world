/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : gwap

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-07-10 23:21:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryid` decimal(10,0) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '计算机', '软件与程序设计相关');
INSERT INTO `category` VALUES ('2', '英语', '英语相关图书');
INSERT INTO `category` VALUES ('3', '文学', '文学作品图书集');

-- ----------------------------
-- Table structure for contactinfo
-- ----------------------------
DROP TABLE IF EXISTS `contactinfo`;
CREATE TABLE `contactinfo` (
  `contactid` decimal(20,0) NOT NULL DEFAULT '0',
  `userid` varchar(16) DEFAULT NULL,
  `street1` varchar(64) DEFAULT NULL,
  `street2` varchar(64) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `province` varchar(32) DEFAULT '',
  `country` varchar(32) DEFAULT '',
  `zip` varchar(8) DEFAULT '',
  `email` varchar(32) DEFAULT '',
  `homephone` varchar(16) DEFAULT '',
  `cellphone` varchar(16) DEFAULT '',
  `officephone` varchar(16) DEFAULT '',
  PRIMARY KEY (`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contactinfo
-- ----------------------------
INSERT INTO `contactinfo` VALUES ('1', '1', '123', '123', '1', '1', '1', '', '', '', '', '');

-- ----------------------------
-- Table structure for orderline
-- ----------------------------
DROP TABLE IF EXISTS `orderline`;
CREATE TABLE `orderline` (
  `lineid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) DEFAULT NULL,
  `productid` decimal(16,0) DEFAULT NULL,
  `amount` decimal(20,0) NOT NULL,
  PRIMARY KEY (`lineid`),
  KEY `productid` (`productid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `orderline_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`),
  CONSTRAINT `orderline_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderline
-- ----------------------------
INSERT INTO `orderline` VALUES ('1', '1', '4', '1');
INSERT INTO `orderline` VALUES ('2', '2', '3', '1');
INSERT INTO `orderline` VALUES ('3', '2', '4', '2');
INSERT INTO `orderline` VALUES ('4', '2', '5', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `cost` decimal(15,3) NOT NULL,
  `userid` varchar(16) DEFAULT NULL,
  `statusid` decimal(3,0) DEFAULT NULL,
  `paywayid` decimal(3,0) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `userid` (`userid`),
  KEY `statusid` (`statusid`),
  KEY `paywayid` (`paywayid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`statusid`) REFERENCES `orderstatus` (`statusid`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`paywayid`) REFERENCES `payway` (`paywayid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', null, '39.000', '1', '1', '1');
INSERT INTO `orders` VALUES ('2', null, '241.000', '1', '1', '1');

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus` (
  `statusid` decimal(3,0) NOT NULL DEFAULT '0',
  `o_name` varchar(32) NOT NULL,
  `description` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderstatus
-- ----------------------------
INSERT INTO `orderstatus` VALUES ('1', '正在付款', null);
INSERT INTO `orderstatus` VALUES ('2', '正在处理', null);
INSERT INTO `orderstatus` VALUES ('3', '付款成功', null);

-- ----------------------------
-- Table structure for payway
-- ----------------------------
DROP TABLE IF EXISTS `payway`;
CREATE TABLE `payway` (
  `paywayid` decimal(3,0) NOT NULL DEFAULT '0',
  `paystyle` varchar(64) NOT NULL,
  PRIMARY KEY (`paywayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payway
-- ----------------------------
INSERT INTO `payway` VALUES ('1', '邮局汇款');
INSERT INTO `payway` VALUES ('2', '银行转账');
INSERT INTO `payway` VALUES ('3', '货到付款');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` decimal(16,0) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `basePrice` decimal(12,2) NOT NULL,
  `categoryid` decimal(10,0) DEFAULT NULL,
  `author` varchar(128) NOT NULL,
  `publish` varchar(256) NOT NULL,
  `pages` decimal(6,0) DEFAULT NULL,
  `images` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '精通Hibernate：Java对象持久化技术详解', '孙卫琴的计算机书籍 创作心得:<br>\\r\\n　　如果说书的结构好比房屋的框架，书的内容则好比房屋的具体组成元素。计算机书的内容的形式分为：文字、 表格、图和范例。为了把某种知识讲清楚，常常需要综合使用这四种形式的元素......\\r\\n:<br>\\r\\n　　继《Tomcat 与 Java Web开发技术详解(含光盘)》和《精通Struts：基于MVC的Java Web设计与开发(含光盘)》之后，应广大读者的强烈要求，孙卫琴的又一力作《精通Hibernate：Java对象持久化技术详解》，正处在迎接面市的准备当中。\\r\\nHibernate是一个基于Java的开放源代码的持久化中间件，它对JDBC作了轻量级封装，不仅提供ORM映射服务，还提供数据查询和数据缓存功能，Java开发人员可以方便的通过Hibernate API来操纵数据库。\\r\\n现在，越来越多的Java开发人员把Hibernate作为企业应用和关系数据库之间的中间件，以节省和对象持久化有关的30%的JDBC编程工作量。 2005年，Hibernate作为优秀的类库和组件，荣获了第15届Jolt大奖。Hibernate之所以能够流行，归功于它特有的优势。<br>\\r\\n　　本书结合大量典型的实例，详细介绍了运用目前最成熟的Hibernate2.1版本进行Java对象持久化的技术。Hibernate是连接Java 对象模型和关系数据模型的桥梁，通过本书，读者不仅能掌握用Hibernate工具对这两种模型进行映射的技术，还能获得设计与开发Java对象模型和关系数据模型的先进经验。', '59.00', '1', '孙卫琴', '电子工业出版社', '600', 'images/product/zcover3.gif');
INSERT INTO `product` VALUES ('2', '高等数学', '如果你已经是Java程序员，想了解Java的最新特性，该怎么办呢?去问一问身边的Java专家，他们会告诉你：《Java核心技术》通过提供实战指导，能够使你快速掌握Java精髓，完成最具挑战性的任务。这也正是它能连续7年在世界范围内成为最畅销书籍的原因。<br>\\r\\n　　本书全面讲述了标准 Java 2 1．4版本的基本知识，涵盖了从正则表达式到高性能I／O这样的主要新特性。从中能够读到关于面向对象的Java平台开发的经典阐述，以及全面更新了的 Swing用户界面开发及其他更多内容。最重要的是，第6版包含了更多值得信赖的实用程序(本书一直就是以这些实用程序而著称)，并且进行了更新，反映了最近的SDK特性和发展!<br>\\r\\n　　本书为Java平台开发者提供了以下新信息：<br>\\r\\n　　●Swing GUI开发——包括输入验证和其他增强特性<br>\\r\\n　　', '15.00', '1', '张三', '山东大学出版社', '500', 'images/product/zcover3.gif');
INSERT INTO `product` VALUES ('3', 'Java 2核心技术（第6版） 卷I：基础知识 ', '    如果你已经是Java程序员，想了解Java的最新特性，该怎么办呢?去问一问身边的Java专家，他们会告诉你：《Java核心技术》通过提供实战指导，能够使你快速掌握Java精髓，完成最具挑战性的任务。这也正是它能连续7年在世界范围内成为最畅销书籍的原因。<br>\r\n　　本书全面讲述了标准 Java 2 1．4版本的基本知识，涵盖了从正则表达式到高性能I／O这样的主要新特性。从中能够读到关于面向对象的Java平台开发的经典阐述，以及全面更新了的 Swing用户界面开发及其他更多内容。最重要的是，第6版包含了更多值得信赖的实用程序(本书一直就是以这些实用程序而著称)，并且进行了更新，反映了最近的SDK特性和发展!<br>\r\n　　本书为Java平台开发者提供了以下新信息：<br>\r\n　　●Swing GUI开发——包括输入验证和其他增强特性<br>\r\n　　●开发可靠代码——包括链式异常、栈帧，断言和日志<br>\r\n　　●新的高性能的I／O API——内存映射文件、文件加锁及字符集编码／解码<br>\r\n　　●使用了新的功能强大的java．utiI．regex包的正则表达式<br>\r\n　　●Java 1．4平台环境设置类：新的跨平台的配置信息存储库<br>\r\n　　●动态代理类、内部类、Java平台事件模型、流、文件管理以及其他内容<br>\r\n作者简介：<br>\r\n　　CayS．Horstmann是圣何塞州立大学的计算机科学教授，在C++、Java和面向对象开发方面已经有6本著作。 GaryCornell是康涅狄格大学的教授，也是广大开发人员喜爱的技术作家，许多著作都广受好评。近年来他还与人创办了著名的计算机技术图书出版社 Apress。', '75.00', '1', '(美)Gary Cornell', '机械工业出版社', '698', 'images/product/zcover3.gif');
INSERT INTO `product` VALUES ('4', 'Effective Java中文版', '　　本书介绍了在Java编程中57条极具实用价值的经验规则，这些经验规则涵盖了大多数开发人员每天所面临的问题的解决方案。通过对Java平台设计专家所使用的技术的全面描述，揭示了应该做什么、不应该做什么才能产生清晰、健壮和高效的代码。 本书中的每条规则都以简短、独立的小文章形式出现，这些小文章包含了详细而精确的建议，以及对语言中许多细微之处的深入分析，并通过例子代码加以进一步说明。贯穿全书的是通用的语言用法和设计模式，以及一些具有启发意义的技巧和技术。<br>\r\n<br>\r\n　　◆“真希望10年前我就能拥有这本书。可能有人会认为我不需要任何关于Java的书籍，但是我确实需要这本书。”<br> 　　　　　　　　　　　　　　——James Gosling，Java之父，Sun公司副总裁<br>\r\n<br>\r\n　　◆“一本非常优秀的书，充满了各种关于使用Java程序设计语言和面向对象程序设计的好的建议。”<br>\r\n　　　　　　　　　　　　　　　　　　　　 ——Gilad Bracha, Sun公司计算机科学家，《The Java TM Language Specificationy》（Second Edition）的作者之一 ', '39.00', '1', '(美)Joshua Bloch', '机械工业出版社', '214', 'images/product/zcover4.gif');
INSERT INTO `product` VALUES ('5', 'Java与模式', '本书是一本讲解设计原则以及最为常见的设计模式的实用教材，目的是为工作繁忙的Java系统设计师提供一个快速而准确的设计原则和设计模式的辅导。本书分为55章，每一个章节讲解一个编程模式，说明此模式的用意、结构，以及这一模式适合于什么样的情况等。每一个章节都附有多个例子和练习题，研习这些例子、完成这些练习题可以帮助读者更好地理解所讲的内容。大多数的章节都是相对独立的，读者可以打开本书，从任何一章开始读起。为了满足不同程度的读者的需要，本书提供了一些标为“专题”的章节，不阅读这些章节，对阅读本书的标准章节没有影响。读过本书之后，读者可以很有信信心地在自己的系统设计工作中使用学过的内容，与同事交流面向对象的设计经验，并在事业发展上有更多的收获。本书适合于Java程序员、架构设计师及设计模式爱好者，是一本实用的设计原则和设计模式的自学教材和使用手册', '88.00', '1', '阎宏', '电子工业出版社', '1024', 'images/product/zcover5.gif');
INSERT INTO `product` VALUES ('6', '深入浅出Hibernate', '本书由互联网上影响广泛的开放文档OpenDoc系列自由文献首份文档“Hibernate开发指南”发展而来。在编写过程中，进行了重新构思与组织，同时对内容的深度与广度进行了重点强化。本书从持久层入手，引出对象/关系数据库映射的由来，接下来聚焦于目前最完善、最强悍的ORM产品—— Hibernate。从一个基础程序入手，讲述Hibernate的基本语法与配置，慢慢升高到缓存、延迟加载等高级特性。本书内容深入浅出，先讲述持久层设计与ORM，再由Hibernate概述、Hibernate基础Hibernate高级特性顺序展开，直至Hibernate实战，重点讲述了 Hibernate的基础语法、基础配置、O/R映射、数据关联、数据检索、HQL实用技术、自定义持久化实现、Hibernate回调与拦截、 Hibernate分页等实用技术，Hibernate实战部分则用一个真实论坛的create table 演示了Hibernate的强大功能。本书有丰富的附录部，在附录中讲述了Hibernate常用的映射配置，Hibernate工具、XDoclet模板配置以及Hibernate的益友iBatis用法，还以卡片的形式列出了本书中所用的工具及软件，附录最后一部分是“快速启动代码”，供读者对比与参考，也给初学者提供了一个快带起步的基础。本书适合于Hibernate的各个阶层的读者。', '59.00', '1', '夏昕 曹晓钢 唐勇', '电子工业出版社', '512', 'images/product/zcover6.gif');
INSERT INTO `product` VALUES ('7', 'Tomcat与Java Web开发技术详解', '　　 本书详细介绍了在最新Tomcat 5版本上开发Java Web应用的各种技术。主要内容包括：Tomcat和Java Web开发的基础知识，Java Web开发的高级技术，Tomcat与当前其他通用软件的集成，以及Tomcat的各种高级功能。书中内容注重理论与实践相结合，列举了大量具有典型性和实用价值的Web应用实例，并提供了详细的开发和部署步骤。由于Java Web技术是SUN公司在Java Servlet规范中提出的通用技术，因此本书讲解的Java Web应用例子可以运行在任何一个实现SUN的Servlet规范的Java Web服务器上。随书附赠光盘内容为本书所有范例源程序，以及本书涉及到的所有软件的最新版本的安装程序。本书语言深入浅出，通俗易懂。无论对于Java Web开发的新手还是行家来说，本书都是精通Tomcat技术和开发Java Web应用的必备的实用手册。', '45.00', '1', '孙卫琴 李洪成', '电子工业出版社', '438', 'images/product/zcover7.gif');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `USER_NAME` varchar(10) NOT NULL,
  `PASSWORD` varchar(10) DEFAULT NULL,
  `PROVINCE` varchar(10) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL,
  `HOBBIES` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('ZhouYu', '111', 'Shanghai', 'male', 'Game');
INSERT INTO `student` VALUES ('Tom', '123', '', 'male', 'Mouse');
INSERT INTO `student` VALUES ('asdfadsf', '123', 'adfasdf', 'asdfasdf', 'sadfasdf');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL,
  `USER_NAME` varchar(10) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL,
  `FULL_NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'tom', '123', 'tomcat');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'zvc');
INSERT INTO `users` VALUES ('2', '2', 'dfxc');
INSERT INTO `users` VALUES ('3', '3', 'fsd3');

-- ----------------------------
-- View structure for detail
-- ----------------------------
DROP VIEW IF EXISTS `detail`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `detail` AS SELECT
users.userid,
orders.orderid,
product.`name`,
product.basePrice,
payway.paystyle,
orderstatus.`o_name`,
orderline.amount
FROM
product,
payway,
orderline,
orders,
orderstatus,
users
WHERE
product.productid = orderline.productid AND
payway.paywayid = orders.paywayid AND
orders.statusid = orderstatus.statusid AND
orderline.orderid = orders.orderid AND
orders.userid = users.userid ;
