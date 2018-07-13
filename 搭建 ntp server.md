# 搭建 ntp 服务器

***
## Install
* 首先检查服务器上是否已安装ntp服务
```
[harrdy@client-A-132 ~]$ rpm -qa | grep ntp
ntp-4.2.6p5-28.el7.centos.x86_64               # 表明已安装 ntp 服务
python-ntplib-0.3.2-1.el7.noarch
fontpackages-filesystem-1.44-8.el7.noarch
ntpdate-4.2.6p5-28.el7.centos.x86_64           # 表明已安装 ntp 服务
[harrdy@client-A-132 ~]$ 
```
* 安装  yum install ntpd
* 查看安装包信息
```
```

# 基于 `chrony` 的 `NTP` 服务器的构建
***
* 操作环境 CentOS Linux release 7.5.1804 (Core) 

***
## 配置过程
* 首先检查服务器上是否已安装 chrony 包
```
[harrdy@client-A-132 ~]$ rpm -qa | grep chrony
chrony-3.2-2.el7.x86_64
[harrdy@client-A-132 ~]$ 
```
* 安装   yum install chrony
* 查看安装包信息
```
[harrdy@client-A-132 ~]$ yum info chrony
Loaded plugins: fastestmirror, langpacks
Repository base is listed more than once in the configuration
Repository updates is listed more than once in the configuration
Repository extras is listed more than once in the configuration
Repository centosplus is listed more than once in the configuration
Repository epel is listed more than once in the configuration
Repository epel-debuginfo is listed more than once in the configuration
Repository epel-source is listed more than once in the configuration
Loading mirror speeds from cached hostfile
Installed Packages
Name        : chrony
Arch        : x86_64
Version     : 3.2
Release     : 2.el7
Size        : 476 k
Repo        : installed
From repo   : anaconda
Summary     : An NTP client/server
URL         : https://chrony.tuxfamily.org
License     : GPLv2
Description : A client/server for the Network Time Protocol, this program keeps your
            : computer's clock accurate. It was specially designed to support
            : systems with intermittent internet connections, but it also works well
            : in permanently connected environments. It can use also hardware reference
            : clocks, system real-time clock or manual input as time references.

[harrdy@client-A-132 ~]$ 
```
