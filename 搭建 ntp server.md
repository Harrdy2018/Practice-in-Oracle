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
* 设置服务的开机启动     systemctl enable chronyd
* 启动服务              systemctl start chronyd
* 查看服务启动状态      systemctl status chronyd
```
[harrdy@client-A-132 ~]$ systemctl status chronyd
● chronyd.service - NTP client/server
   Loaded: loaded (/usr/lib/systemd/system/chronyd.service; enabled; vendor preset: enabled)
   Active: active (running) since Sat 2018-07-14 14:48:57 CST; 3s ago          # chronyd 服务已经启动
     Docs: man:chronyd(8)
           man:chrony.conf(5)
  Process: 3320 ExecStartPost=/usr/libexec/chrony-helper update-daemon (code=exited, status=0/SUCCESS)
  Process: 3313 ExecStart=/usr/sbin/chronyd $OPTIONS (code=exited, status=0/SUCCESS)
 Main PID: 3318 (chronyd)
    Tasks: 1
   CGroup: /system.slice/chronyd.service
           └─3318 /usr/sbin/chronyd

Jul 14 14:48:57 client-A-132 systemd[1]: Starting NTP client/server...
Jul 14 14:48:57 client-A-132 chronyd[3318]: chronyd version 3.2 starting (+CMDMON +NTP +REFCLOCK +RTC +PRIVDROP +SCFILTER +SECHASH...+DEBUG)
Jul 14 14:48:57 client-A-132 chronyd[3318]: Frequency -21.077 +/- 0.415 ppm read from /var/lib/chrony/drift
Jul 14 14:48:57 client-A-132 systemd[1]: Started NTP client/server.
Hint: Some lines were ellipsized, use -l to show in full.
[harrdy@client-A-132 ~]$ 
```
* 配置防火墙
```
Usage: firewall-cmd [OPTIONS...]

Status Options
  --state              Return and print firewalld state                     #返回打印防火墙的状态
  --reload             Reload firewall and keep state information           #加载防火墙保持状态信息
  
Permanent Options
  --permanent          Set an option permanently                            #设置一个参数永久的
                       Usable for options marked with [P]
  
Service Options
  --new-service=<service>
                       Add a new service [P only]                         
  --delete-service=<service>
                       Delete an existing service [P only]
  --info-service=<service>
                       Print information about a service
  --path-service=<service>
                       Print file path of a service [P only]

按照上诉进行如下设置：
firewall-cmd --permanent --new-service=ntp
firewall-cmd --reload
```
