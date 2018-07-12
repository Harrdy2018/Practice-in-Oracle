# How to Install MariaDB on CentOS 7

***
## Introduce
```
MariaDB is a fork of the popular cross-platform MySQL database management system and is considered a full drop-in replacement for MySQL. 
MariaDB是流行的跨平台MySQL数据库管理系统的分支，被认为是MySQL 的完全替代品。

MariaDB was created by one of MySQL’s original developers in 2009 after MySQL was acquired by Oracle during the Sun Microsystems merger. 
MariaDB是由Sun在Sun Microsystems合并期间被Oracle收购后，于2009年由MySQL的一位原始开发人员创建的。

Today MariaDB is maintained and developed by the MariaDB Foundation and community contributors with the intention of it remaining GNU GPL software.
今天，MariaDB由MariaDB Foundation和社区贡献者维护和开发，目的是保留GNU GPL软件。

MariaDB replaced MySQL as the default database system in the CentOS 7 repositories. 
在 CentOS 7 仓库中，MariaDB 替代 MySQL 作为默认数据库系统。

Though installing MySQL into CentOS 7 is not difficult (see our MySQL CentOS 7 guide for instructions), 
虽然将MySQL安装到CentOS 7并不困难（请参阅我们的MySQL CentOS 7指南）

if you simply need a database MariaDB is recommended for official support and a minimal chance of incompatibilities with other repository software.
如果您只需要一个数据库，建议使用MariaDB进行官方支持，并且与其他存储库软件不兼容的可能性很小。
```
***
## Before You Begin
* To check your hostname run:
```
命令 hostname -f, --fqdn, --long     long host name (FQDN)

[harrdy@client-A-132 ~]$ hostname
client-A-132
[harrdy@client-A-132 ~]$ hostname -f
client-A-132
第一个命令应显示您的短主机名，第二个命令应显示您的完全限定域名（FQDN）
FQDN-->>fully qualified domain name
```
* Update your system
```
sudo yum update  升级所有的软件包
```
***
## Install and Start MariaDB
* sudo yum install mariadb-server
* sudo systemctl enable mariadb  开机自启
* sudo systemctl start mariadb   启动服务
* sudo systemctl status mariadb  查看启动状态
```
默认情况下，MariaDB将绑定到localhost（127.0.0.1）
```

***
## Harden(使坚固) MariaDB Server
* 运行 `mysql_secure_installation` 脚本以解决默认 `MariaDB` 安装中的几个安全问题
```
[harrdy@client-A-132 ~]$  mysql_secure_installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none): 
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.

Set root password? [Y/n] Y
New password:                                                            # 密码   MariaDB
Re-enter new password: 
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous(匿名的) user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing(这仅仅是为测试准备的), and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] n
 ... skipping.

Normally(通常地), root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] n
 ... skipping.

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] n
 ... skipping.

Reloading the privilege(特权) tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
```

***
## Using MariaDB
* 与 `MariaDB` 交互的标准工具是 `mariadb` 客户端，它随 `mariadb-server` 包一起安装。 `MariaDB` 客户端通过终端使用。

***
## Root Login
* 命令 `mysql -u root -p`  `To log in to MariaDB as the root user`
```
解释
mysql -u, --user=name     User for login if not current user.
mysql -p, --password[=name] Password to use when connecting to server. If password is not given it's asked from the tty.
```
* When prompted, enter the root password you assigned when the `mysql_secure_installation` script was run.
* You’ll then be presented with a welcome header and the MariaDB prompt as shown below :
```
[harrdy@client-A-132 ~]$ mysql -u root -p
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 5.5.56-MariaDB MariaDB Server

Copyright (c) 2000, 2017, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> 


```
* To generate a list of commands for the MariaDB prompt, enter `\h`. You’ll then see:
```
MariaDB [(none)]> help

General information about MariaDB can be found at
http://mariadb.org

List of all MySQL commands:
Note that all text commands must be first on line and end with ';'
?         (\?) Synonym for `help'.
clear     (\c) Clear the current input statement.
connect   (\r) Reconnect to the server. Optional arguments are db and host.
delimiter (\d) Set statement delimiter.
edit      (\e) Edit command with $EDITOR.
ego       (\G) Send command to mysql server, display result vertically.
exit      (\q) Exit mysql. Same as quit.
go        (\g) Send command to mysql server.
help      (\h) Display this help.
nopager   (\n) Disable pager, print to stdout.
notee     (\t) Don't write into outfile.
pager     (\P) Set PAGER [to_pager]. Print the query results via PAGER.
print     (\p) Print current command.
prompt    (\R) Change your mysql prompt.
quit      (\q) Quit mysql.
rehash    (\#) Rebuild completion hash.
source    (\.) Execute an SQL script file. Takes a file name as an argument.
status    (\s) Get status information from the server.
system    (\!) Execute a system shell command.
tee       (\T) Set outfile [to_outfile]. Append everything into given outfile.
use       (\u) Use another database. Takes database name as argument.
charset   (\C) Switch to another charset. Might be needed for processing binlog with multi-byte charsets.
warnings  (\W) Show warnings after every statement.
nowarning (\w) Don't show warnings after every statement.

For server side help, type 'help contents'

MariaDB [(none)]> 
```
***
## Create a New MariaDB User and Database
* In the example below, `testdb` is the name of the database, `testuser` is the user, and `password` is the user’s password:
```
```
