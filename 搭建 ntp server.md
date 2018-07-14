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
***
## 测试
* 本次测试使用的客户端IP为 192.168.112.132
*              服务器    192.168.112.134  
* 客户端和服务器都安装    chrony软件
***
* 将客户端chronyd的配置文件中  /etc/chrony.conf 以下几行注释了，并在后面新增一行
```
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (http://www.pool.ntp.org/join.html).
#server 0.centos.pool.ntp.org iburst
#server 1.centos.pool.ntp.org iburst
#server 2.centos.pool.ntp.org iburst
#server 3.centos.pool.ntp.org iburst
server 192.168.112.134 iburst
```
* 将客户时间修改为错误时间
```
[root@client-A-132 harrdy]# date -s 20180714
Sat Jul 14 00:00:00 CST 2018
[root@client-A-132 harrdy]# date
Sat Jul 14 00:00:06 CST 2018
[root@client-A-132 harrdy]# date -s 15:59:00
Sat Jul 14 15:59:00 CST 2018
[root@client-A-132 harrdy]# date
Sat Jul 14 15:59:02 CST 2018
```
***
## 高级设置
* chrony是ntp协议的另外一种实现，关于chrony与ntp的对比我们可以参考文末参考资料。一般情况下，建议使用chrony代替ntp。
```
查看时间同步源。在命令行中输入chronyc进入交互模式。

[root@client-A-132 harrdy]# chronyc
chrony version 3.2
Copyright (C) 1997-2003, 2007, 2009-2017 Richard P. Curnow and others
chrony comes with ABSOLUTELY NO WARRANTY.  This is free software, and
you are welcome to redistribute it under certain conditions.  See the
GNU General Public License version 2 for details.

chronyc> sources
210 Number of sources = 1
MS Name/IP address         Stratum Poll Reach LastRx Last sample               
===============================================================================
^? 192.168.112.134               0   6     0     -     +0ns[   +0ns] +/-    0ns
chronyc> sources -v
210 Number of sources = 1

  .-- Source mode  '^' = server, '=' = peer, '#' = local clock.
 / .- Source state '*' = current synced, '+' = combined , '-' = not combined,
| /   '?' = unreachable, 'x' = time may be in error, '~' = time too variable.
||                                                 .- xxxx [ yyyy ] +/- zzzz
||      Reachability register (octal) -.           |  xxxx = adjusted offset,
||      Log2(Polling interval) --.      |          |  yyyy = measured offset,
||                                \     |          |  zzzz = estimated error.
||                                 |    |           \
MS Name/IP address         Stratum Poll Reach LastRx Last sample               
===============================================================================
^? 192.168.112.134               0   6     0     -     +0ns[   +0ns] +/-    0ns
```
* 查看时间同步状态
```
chronyc> sourcestats -v
210 Number of sources = 1
                             .- Number of sample points in measurement set.
                            /    .- Number of residual runs with same sign.
                           |    /    .- Length of measurement set (time).
                           |   |    /      .- Est. clock freq error (ppm).
                           |   |   |      /           .- Est. error in freq.
                           |   |   |     |           /         .- Est. offset.
                           |   |   |     |          |          |   On the -.
                           |   |   |     |          |          |   samples. \
                           |   |   |     |          |          |             |
Name/IP Address            NP  NR  Span  Frequency  Freq Skew  Offset  Std Dev
==============================================================================
192.168.112.134             0   0     0     +0.000   2000.000     +0ns  4000ms
```
* 查看文档
* man  chrony.conf
* man  chronyd
* man  chronyc
