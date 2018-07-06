# yum 工具

***
# yum简介
```
Yum（全称为 Yellow dog Updater, Modified）是一个在Fedora和RedHat以及CentOS中的Shell前端软件包管理器。
基于RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，
并且一次安装所有依赖的软件包，无须繁琐地一次次下载、安装。
```

***
## 显示已经安装的软件包
* yum list installed

## 查找可以安装的软件包
* yum list tomcat

## 安装软件包
* yum install tomcat
`Install a package or packages on your system`

## 卸载软件包
* yum remove tomcat

## 列出软件包的依赖
* yum deplist tomcat
`List a package's dependencies`

## -y 自动应答yes
* yum -y installed tomcat
`answer yes for all questions`

## info 显示软件包的描述信息和概要信息
* yum info tomcat
`Display details about a package or group of packages`
```linux
[harrdy@client-A-132 ~]$ yum info tomcat
Loaded plugins(已加载插件): fastestmirror, langpacks
Loading mirror speeds from cached hostfile
 * base: mirrors.njupt.edu.cn
 * extras: mirrors.njupt.edu.cn
 * updates: mirrors.njupt.edu.cn
Installed Packages
Name(名称)   : tomcat
Arch(架构)   : noarch
Version(版本): 7.0.76
Release(发布): 6.el7
Size(大小)   : 303 k
Repo        : installed
From repo   : base
Summary(简介)     : Apache Servlet/JSP Engine, RI for Servlet 3.0/JSP 2.2 API
URL(网址)         : http://tomcat.apache.org/
License(协议)     : ASL 2.0
Description(描述) : Tomcat is the servlet container that is used in the official Reference
            : Implementation for the Java Servlet and JavaServer Pages technologies.
            : The Java Servlet and JavaServer Pages specifications are developed by
            : Sun under the Java Community Process.
            : 
            : Tomcat is developed in an open and participatory environment and
            : released under the Apache Software License version 2.0. Tomcat is intended
            : to be a collaboration of the best-of-breed developers from around the world.

[harrdy@client-A-132 ~]$ 
```

## 升级软件包
* 升级所有的软件包 yum update
`Update a package or packages on your system`
* 升级某一个软件包 yum update tomcat
* 检查可更新的程序 yum check-update
`Check for available package updates`

## Yum 可视化图形界面 Yumex
* yum Extender (简称 yumex ) , 是 yum 的图形化操作界面。
* 可以通过 yumex 方便的查看软件包，安装、卸载软件包。对于对命令行不熟的人简直就是神奇，管理软件包很方便。
* yumex 安装  yum install yumex
* 打开 yumex
