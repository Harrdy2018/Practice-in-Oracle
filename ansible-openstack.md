# 在ansible上部署openstack
## 相关脚本
* 自动化配置 MariaDB 的坑
```
运行以下脚本之前启动服务  systemctl start mariadb

当在系统上第一次装上 MariaDB 数据库的时候，使用如下脚本进行 root 密码初始化设置！！！
[root@HJX ~]# cat init_MariaDB.sh 
#!/bin/sh 
passwd="MariaDB" 
mysql_secure_installation <<!
                                   # 最重要的是这里，使用空行代替键盘输入的 Enter 键，用 \n yes 都不可以，我被他纠结了很久！！！
Y
$passwd
$passwd
n
n
n
Y
!
此脚本的运行条件必须是你第一次装 MariaDB ,如果已经装过了，并设置了密码，可以按照如下方法重置！！！
step 1>>>yum remove mariadb-server
step 2>>>rm -rf /var/lib/mysql/
step 3>>>yum install mariadb-server

知道密码的情况下，使用如下脚本修改密码，很简单,设置数据库密码为 Harrdy
[root@HJX ~]# cat set.sh 
#!/bin/sh 
passwd="MariaDB" 
newpasswd="Harrdy"
mysql_secure_installation <<!
$passwd
Y
$newpasswd
$newpasswd
n
n
n
Y
!

设置了root 密码的情况下使用如下脚本创建数据库！！！
#!/bin/sh
mysql -u root --password=Harrdy <<!
CREATE DATABASE keystone;
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' \
IDENTIFIED BY 'KEYSTONE_DBPASS';
GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' \
IDENTIFIED BY 'KEYSTONE_DBPASS';
exit
!
```
