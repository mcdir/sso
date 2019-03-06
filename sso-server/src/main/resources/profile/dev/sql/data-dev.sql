/*
Initialization data
*/

---Clear text MD5 data

/*123*/
INSERT INTO SYS_USER VALUES ('admin', '202cb962ac59075b964b07152d234b70', 'huang.wenbin@foxmail.com', 'Guangzhou Tianhe', 24, 0, 0);
/*12345678*/
INSERT INTO SYS_USER VALUES ('zhangsan', '25d55ad283aa400af464c76d713c07ad', '756884434@qq.com', 'Guangzhou Yuexiu', 26, 0, 0);
/* root / root */
INSERT INTO SYS_USER VALUES('root','63a9f0ea7bb98050796b649e85481845', 'root@passport.sso.com', 'Guangzhou Panyu', 28, 0 , 0);
/*1234*/
/*Lock user*/
INSERT INTO SYS_USER VALUES('zhaosi','81dc9bdb52d04dc20036dbd8313ed055', 'zhaosi@foxmail.com', 'Guangzhou Haizhu', 25, 0, 1);
/*12345*/
/*unavailable*/
INSERT INTO SYS_USER VALUES('wangwu','827ccb0eea8a706c4c34a16891f84e7b', 'wangwu@foxmail.com', 'Guangzhou Panyu', 27, 1 , 0);


---Add salt data
/*
123 can use PasswordSaltTest output value
http://md5.my-addr.com/md5_salted_hash-md5_salt_hash_generator_tool.php
*/
INSERT INTO SYS_USER_ENCODE VALUES ('admin_en', 'bfb194d5bd84a5fc77c1d303aefd36c3', 'huang.wenbin@foxmail.com', 'Jiangmen Pengjiang', 24, 0, 0);
INSERT INTO SYS_USER_ENCODE VALUES ('zhangsan_en', '68ae075edf004353a0403ee681e45056', 'zhangsan@foxmail.com', 'Shenzhen Baoan', 21, 0, 0);
INSERT INTO SYS_USER_ENCODE VALUES ('zhaosi_en', 'd66108d0409f68af538301b637f13a18', 'zhaosi@foxmail.com', 'Qingyuan Fresh', 20, 0, 1);
INSERT INTO SYS_USER_ENCODE VALUES ('wangwu_en', '44b907d6fee23a552348eabf5fcf1ac7', 'wangwu@foxmail.com', 'Foshan Shunde', 19, 1, 0);
INSERT INTO SYS_USER_ENCODE VALUES ('root_en', '6943f96b79f0464b285c006f78547d57', 'root@passport.sso.com', 'Mr Root', 25, 0, 0);

--- Problem data
INSERT INTO SYS_USER_QUESTION VALUES ('admin', 'Used password is?', '123');
INSERT INTO SYS_USER_QUESTION VALUES ('admin', 'Your age is?', '24');
INSERT INTO SYS_USER_QUESTION VALUES ('zhangsan', 'My name is?', 'zhangsan');
INSERT INTO SYS_USER_QUESTION VALUES ('zhangsan', 'Where am I working?', 'guangzhou');
INSERT INTO SYS_USER_QUESTION VALUES ('root', 'Used password is root?', '123');

---User attribute table
INSERT INTO SYS_ATTRS VALUES ('admin', 'group', 'ADMIN_ROLE');
INSERT INTO SYS_ATTRS VALUES ('admin', 'group', 'MANAGEMENT_ROLE');
INSERT INTO SYS_ATTRS VALUES ('admin', 'group', 'DEV_ROLE');
INSERT INTO SYS_ATTRS VALUES ('admin', 'school', 'GuangZhou');
INSERT INTO SYS_ATTRS VALUES ('admin', 'school', 'ZhuHai');

INSERT INTO SYS_ATTRS VALUES ('root', 'group', 'ADMIN_ROLE');
INSERT INTO SYS_ATTRS VALUES ('root', 'group', 'MANAGEMENT_ROLE');
INSERT INTO SYS_ATTRS VALUES ('root', 'group', 'DEV_ROLE');
INSERT INTO SYS_ATTRS VALUES ('root', 'school', 'GuangZhou');
INSERT INTO SYS_ATTRS VALUES ('root', 'school', 'ZhuHai');

INSERT INTO SYS_ATTRS VALUES ('zhangsan', 'group', 'DEV_ROLE');