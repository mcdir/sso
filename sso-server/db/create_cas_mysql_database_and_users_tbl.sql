-- Dumping database structure for test
CREATE DATABASE IF NOT EXISTS `cas-mysql-database` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cas-mysql-database`;

-- Dumping structure for table test.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `password`) VALUES 	(1, 'test@test.com', 'test');
INSERT INTO `users` (`id`, `email`, `password`) VALUES 	(2, 'admin', 'admin');
INSERT INTO `users` (`id`, `email`, `password`) VALUES 	(3, 'root', 'root');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


/*
Account form
*/
CREATE TABLE IF NOT EXISTS sys_user (
  username varchar(30) primary key,
  password varchar(64) not null,
  email    varchar(50),
  address  varchar(100),
  age      int,
  expired int,
  disable int
);
/*
Account plus salt table
*/
CREATE TABLE IF NOT EXISTS sys_user_encode (
  username varchar(30) primary key,
  password varchar(64) not null,
  email    varchar(50),
  address  varchar(100),
  age      int,
  expired int,
  disabled int
);
/*
Password reset problem table
*/
CREATE TABLE IF NOT EXISTS sys_user_question (
  username varchar(30) not null,
  question varchar(200) not null,
  answer     varchar(100) not null
);

/*
* User attribute table
*/
CREATE TABLE IF NOT EXISTS sys_attrs (
  username varchar(30) not null,
  attr_key varchar(50) not null,
  attr_val     varchar(100) not null
);

/*
Initialization data
*/

---Clear text MD5 data

/*123*/
INSERT INTO sys_user VALUES ('admin', '202cb962ac59075b964b07152d234b70', 'huang.wenbin@foxmail.com', 'Guangzhou Tianhe', 24, 0, 0);
/*12345678*/
INSERT INTO sys_user VALUES ('zhangsan', '25d55ad283aa400af464c76d713c07ad', '756884434@qq.com', 'Guangzhou Yuexiu', 26, 0, 0);
/* root / root */
INSERT INTO sys_user VALUES('root','63a9f0ea7bb98050796b649e85481845', 'root@passport.sso.com', 'Guangzhou Panyu', 28, 0 , 0);
/*1234*/
/*Lock user*/
INSERT INTO sys_user VALUES('zhaosi','81dc9bdb52d04dc20036dbd8313ed055', 'zhaosi@foxmail.com', 'Guangzhou Haizhu', 25, 0, 1);
/*12345*/
/*unavailable*/
INSERT INTO sys_user VALUES('wangwu','827ccb0eea8a706c4c34a16891f84e7b', 'wangwu@foxmail.com', 'Guangzhou Panyu', 27, 1 , 0);


-- Clear text MD5 data

/*123*/
INSERT INTO sys_user VALUES ('admin', '202cb962ac59075b964b07152d234b70', 'huang.wenbin@foxmail.com', 'Guangzhou Tianhe', 24, 0, 0);
/*12345678*/
INSERT INTO sys_user VALUES ('zhangsan', '25d55ad283aa400af464c76d713c07ad', '756884434@qq.com', 'Guangzhou Yuexiu', 26, 0, 0);
/* root / root */
INSERT INTO sys_user VALUES('root','63a9f0ea7bb98050796b649e85481845', 'root@passport.sso.com', 'Guangzhou Panyu', 28, 0 , 0);
/*1234*/
/*Lock user*/
INSERT INTO sys_user VALUES('zhaosi','81dc9bdb52d04dc20036dbd8313ed055', 'zhaosi@foxmail.com', 'Guangzhou Haizhu', 25, 0, 1);
/*12345*/
/*unavailable*/
INSERT INTO sys_user VALUES('wangwu','827ccb0eea8a706c4c34a16891f84e7b', 'wangwu@foxmail.com', 'Guangzhou Panyu', 27, 1 , 0);


-- Add salt data
/*
123 can use PasswordSaltTest output value
http://md5.my-addr.com/md5_salted_hash-md5_salt_hash_generator_tool.php
*/
INSERT INTO sys_user_encode VALUES ('admin_en', 'bfb194d5bd84a5fc77c1d303aefd36c3', 'huang.wenbin@foxmail.com', 'Jiangmen Pengjiang', 24, 0, 0);
INSERT INTO sys_user_encode VALUES ('zhangsan_en', '68ae075edf004353a0403ee681e45056', 'zhangsan@foxmail.com', 'Shenzhen Baoan', 21, 0, 0);
INSERT INTO sys_user_encode VALUES ('zhaosi_en', 'd66108d0409f68af538301b637f13a18', 'zhaosi@foxmail.com', 'Qingyuan Fresh', 20, 0, 1);
INSERT INTO sys_user_encode VALUES ('wangwu_en', '44b907d6fee23a552348eabf5fcf1ac7', 'wangwu@foxmail.com', 'Foshan Shunde', 19, 1, 0);
INSERT INTO sys_user_encode VALUES ('root_en', '6943f96b79f0464b285c006f78547d57', 'root@passport.sso.com', 'Mr Root', 25, 0, 0);

-- Problem data
INSERT INTO sys_user_question VALUES ('admin', 'Used password is?', '123');
INSERT INTO sys_user_question VALUES ('admin', 'Your age is?', '24');
INSERT INTO sys_user_question VALUES ('zhangsan', 'My name is?', 'zhangsan');
INSERT INTO sys_user_question VALUES ('zhangsan', 'Where am I working?', 'guangzhou');
INSERT INTO sys_user_question VALUES ('root', 'Used password is root?', '123');

-- User attribute table
INSERT INTO sys_attrs VALUES ('admin', 'group', 'ADMIN_ROLE');
INSERT INTO sys_attrs VALUES ('admin', 'group', 'MANAGEMENT_ROLE');
INSERT INTO sys_attrs VALUES ('admin', 'group', 'DEV_ROLE');
INSERT INTO sys_attrs VALUES ('admin', 'school', 'GuangZhou');
INSERT INTO sys_attrs VALUES ('admin', 'school', 'ZhuHai');

INSERT INTO sys_attrs VALUES ('root', 'group', 'ADMIN_ROLE');
INSERT INTO sys_attrs VALUES ('root', 'group', 'MANAGEMENT_ROLE');
INSERT INTO sys_attrs VALUES ('root', 'group', 'DEV_ROLE');
INSERT INTO sys_attrs VALUES ('root', 'school', 'GuangZhou');
INSERT INTO sys_attrs VALUES ('root', 'school', 'ZhuHai');

INSERT INTO sys_attrs VALUES ('zhangsan', 'group', 'DEV_ROLE');