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
