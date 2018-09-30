# Practice-in-Oracle
南京甲骨文实习经历

***
* [新建虚拟机](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/VM%E6%96%B0%E5%BB%BA%E8%99%9A%E6%8B%9F%E6%9C%BA.md)
* [安装系统](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/%E5%AE%89%E8%A3%85CentOS%207.md)
* [CentOS 7命令行](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Linux%E5%91%BD%E4%BB%A4.md)
* [同一个物理机下的两个虚拟机通信](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/%E5%AE%9E%E7%8E%B0%E9%80%9A%E4%BF%A1.md)
* [Ansible运维工具](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Ansible%20Tool.md)
***
* [CentOS 7 初体验之 Yum](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/yum%20tool.md)
* [CentOS 7 初体验之 软件包的一些事](./%E8%BD%AF%E4%BB%B6%E5%8C%85%E7%9A%84%E4%B8%80%E4%BA%9B%E4%BA%8B.md)
* [CentOS 7 初体验之 tomcat](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/tomcat.md)
* [CentOS 7 初体验之 Vim](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Vim%20Tool.md)
* [CentOS 7 初体验之 gcc](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/gcc.md)
* [CentOS 7 初体验之 EPEL源](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/EPEL%E6%BA%90.md)
* [CentOS 7 初体验之 配置MariaDB](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/%E9%85%8D%E7%BD%AE%20MariaDB.md)
* [CentOS 7 初体验之 搭建 ntp server](./%E6%90%AD%E5%BB%BA%20ntp%20server.md)
* [CentOS 7 初体验之 Shell 变量](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Shell%20%E5%8F%98%E9%87%8F.md)
* [CentOS 7 初体验之 Shell 编程](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Shell%E7%BC%96%E7%A8%8B.md)
***
* [CentOS 7 系统配置国内 yum 源和 epel 源](./%E9%85%8D%E7%BD%AEyum%E6%BA%90%E5%92%8Cepel%E6%BA%90.md)
***
* [Linux基础 Chapter 4 Linux常用命令](./Chapter%204.md)
* [Linux基础 Chapter 7 用户和用户组管理](./Chapter%207.md)
***
* [wireshark工具](./Network%20Tools/wireshark.md)
***
* 我的工作
  * [Ansible 部署 openstack 相关脚本](./ansible-openstack)
## Linux 杂记
* Fedora Linux
```
Fedora Linux是较具知名度的Linux发行包之一，
由Fedora项目社群开发、红帽公司赞助，目标是创建一套新颖、多功能并且自由（开放源代码）的操作系统。
```
* yum rpm包 
```
Yum（全称为 Yellow dog Updater, Modified）是一个在Fedora和RedHat以及SUSE中的Shell前端软件包管理器。
基於RPM包管理，能够从指定的服务器自动下载RPM包并且安装，可以自动处理依赖性关系，并且一次安装所有依赖的软体包，无须繁琐地一次次下载、安装。
rpm是由红帽公司开发的软件包管理方式，使用rpm我们可以方便的进行软件的安装、查询、卸载、升级等工作。
但是rpm软件包之间的依赖性问题往往会很繁琐,尤其是软件由多个rpm包组成时。

rpm 是linux的一种软件包名称，
rpm包的安装有一个很大的缺点就是文件的关联性太大，有时候装一个软件要安装很多其他的软件包，很麻烦，
所以为此RedHat小红帽开发了yum安装方法，他可以彻底解决这个关联性的问题，很方便.

yum则属于Redhat、Centos包管理工具
```
* Debian deb包
```
Debian 是完全由自由软件组成的类UNIX操作系统，其包含的多数软件使用GNU通用公共许可协议授权，
并由Debian计划的参与者组成团队对其进行打包、开发与维护。

deb是Debian软件包格式，文件扩展名为.deb，跟Debian的命名一样，
处理这些包的经典程序是dpkg，经常是通过apt来运作。
通过Alien工具，可以将deb包转换成其他形式的软件包。
```
* CentOS 7 安装低级中文输入法
```
su  使用管理员权限
yum install  ibus-libpinyin
选择 Region & Language--->Input Sources--->添加 Chinese（Intelligent Pinyin）
选择 Devices--->Keyboard--->Typing--->根据提示设置快捷键 Switch to next input source
```
* 安装 ping 命令
* 首先可以用 yum provides 命令来搜索哪个软件包里包含了 ping 命令
```
[harrdy@controller ~]$ yum provides */ping
Loaded plugins: fastestmirror, langpacks
Repository base is listed more than once in the configuration
Repository updates is listed more than once in the configuration
Repository extras is listed more than once in the configuration
Repository centosplus is listed more than once in the configuration
Repository epel is listed more than once in the configuration
Repository epel-debuginfo is listed more than once in the configuration
Repository epel-source is listed more than once in the configuration
Loading mirror speeds from cached hostfile
epel/x86_64/filelists                                                                                                |  10 MB  00:00:02     
1:bash-completion-2.1-6.el7.noarch : Programmable completion for Bash
Repo        : base
Matched from:
Filename    : /usr/share/bash-completion/completions/ping



cjdns-tools-19.1-4.el7.noarch : Nodejs tools for cjdns
Repo        : epel
Matched from:
Filename    : /usr/libexec/cjdns/tools/ping



grass-6.4.4-8.el7.x86_64 : GRASS - Geographic Resources Analysis Support System
Repo        : epel
Matched from:
Filename    : /usr/lib64/grass-6.4.4/etc/symbol/extra/ping



iputils-20160308-10.el7.x86_64 : Network monitoring tools including ping
Repo        : base
Matched from:
Filename    : /bin/ping
Filename    : /usr/bin/ping



irssi-0.8.15-16.el7.x86_64 : Modular text mode IRC client with Perl scripting
Repo        : base
Matched from:
Filename    : /usr/share/irssi/help/ping



pacemaker-cli-1.1.18-11.el7.x86_64 : Command line tools for controlling Pacemaker clusters
Repo        : base
Matched from:
Filename    : /usr/lib/ocf/resource.d/pacemaker/ping



pacemaker-cli-1.1.18-11.el7_5.2.x86_64 : Command line tools for controlling Pacemaker clusters
Repo        : updates
Matched from:
Filename    : /usr/lib/ocf/resource.d/pacemaker/ping



pacemaker-cli-1.1.18-11.el7_5.3.x86_64 : Command line tools for controlling Pacemaker clusters
Repo        : updates
Matched from:
Filename    : /usr/lib/ocf/resource.d/pacemaker/ping



1:qt-examples-4.8.7-2.el7.x86_64 : Programming examples for qt
Repo        : base
Matched from:
Filename    : /usr/lib64/qt4/examples/dbus/pingpong/ping



qt5-qtbase-examples-5.9.2-3.el7.x86_64 : Programming examples for qt5-qtbase
Repo        : base
Matched from:
Filename    : /usr/lib64/qt5/examples/dbus/pingpong/ping



rubygem-net-ping-1.7.7-3.el7.noarch : A ping interface for Ruby
Repo        : epel
Matched from:
Filename    : /usr/share/gems/gems/net-ping-1.7.7/lib/net/ping



uwsgi-devel-2.0.16-1.el7.x86_64 : uWSGI - Development header files and libraries
Repo        : epel
Matched from:
Filename    : /usr/src/uwsgi/2.0.16/plugins/ping



1:bash-completion-2.1-6.el7.noarch : Programmable completion for Bash
Repo        : @anaconda
Matched from:
Filename    : /usr/share/bash-completion/completions/ping



iputils-20160308-10.el7.x86_64 : Network monitoring tools including ping   # 可以看到此包包含了 ping 命令
Repo        : @anaconda
Matched from:
Filename    : /bin/ping
Filename    : /usr/bin/ping



[harrdy@controller ~]$ 
```
