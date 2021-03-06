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
```
