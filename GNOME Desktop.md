# GNOME Desktop

***
## 查看Linux系统版本的命令
* 查看内核版本命令，以下三个命令任选
```
[harrdy@HJX ~]$ cat /proc/version 
Linux version 3.10.0-862.11.6.el7.x86_64 (builder@kbuilder.dev.centos.org) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-28) (GCC) ) #1 SMP Tue Aug 14 21:49:04 UTC 2018
[harrdy@HJX ~]$ uname -a
Linux HJX 3.10.0-862.11.6.el7.x86_64 #1 SMP Tue Aug 14 21:49:04 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
[harrdy@HJX ~]$ uname -r
3.10.0-862.11.6.el7.x86_64
```
* 查看linux版本
```
[harrdy@HJX ~]$ cat /etc/redhat-release 
CentOS Linux release 7.5.1804 (Core) 
```

***
## 理解`/etc/inittab`文件
```linux
[harrdy@HJX ~]$ cat /etc/inittab
# inittab is no longer used when using systemd.
#
# ADDING CONFIGURATION HERE WILL HAVE NO EFFECT ON YOUR SYSTEM.
#
# Ctrl-Alt-Delete is handled by /usr/lib/systemd/system/ctrl-alt-del.target
#
# systemd uses 'targets' instead of runlevels. By default, there are two main targets:
#
# multi-user.target: analogous to runlevel 3
# graphical.target: analogous to runlevel 5
#
# To view current default target, run:
# systemctl get-default
#
# To set a default target, run:
# systemctl set-default TARGET.target
#
```
```linux
理解：
在CentOS7.x之前的版本都是通过修改/etc/inittab文件来设置启动顺序，但是此种方法并不适应于CentOS7.x版本
该文件中已经详细说明了，不再使用inittab文件而是使用systemd代替
multi-user.target: analogous to runlevel 3   multi-user相当于运行级别是3
graphical.target: analogous to runlevel 5    graphical相当于运行级别是5

查看当前默认目标
systemctl get-default
[harrdy@HJX ~]$ systemctl get-default
graphical.target

设置默认目标，是图形界面模式还是命令行模式
systemctl set-default graphical.target由命令行模式更改为图形界面模式
systemctl set-default multi-user.target由图形界面模式更改为命令行模式

[harrdy@HJX ~]$ systemctl set-default multi-user.target
Removed symlink /etc/systemd/system/default.target.
Created symlink from /etc/systemd/system/default.target to /usr/lib/systemd/system/multi-user.target.
[harrdy@HJX ~]$ systemctl set-default graphical.target
Removed symlink /etc/systemd/system/default.target.
Created symlink from /etc/systemd/system/default.target to /usr/lib/systemd/system/graphical.target.

以上两条命令相当于创建了软链接，我们可以查看一下：
[harrdy@HJX ~]$ ll /etc/systemd/system/default.target 
lrwxrwxrwx. 1 root root 40 Oct  1 12:21 /etc/systemd/system/default.target -> /usr/lib/systemd/system/graphical.target

我们查看一下 /usr/lib/systemd/system/目录下两种目标文件的内容

graphical.target文件：
[harrdy@HJX ~]$ cat /usr/lib/systemd/system/graphical.target
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

[Unit]
Description=Graphical Interface
Documentation=man:systemd.special(7)
Requires=multi-user.target
Wants=display-manager.service
Conflicts=rescue.service rescue.target
After=multi-user.target rescue.service rescue.target display-manager.service
AllowIsolate=yes

multi-user.target文件：
[harrdy@HJX ~]$ cat /usr/lib/systemd/system/multi-user.target.
cat: /usr/lib/systemd/system/multi-user.target.: No such file or directory
[harrdy@HJX ~]$ cat /usr/lib/systemd/system/multi-user.target
#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or modify it
#  under the terms of the GNU Lesser General Public License as published by
#  the Free Software Foundation; either version 2.1 of the License, or
#  (at your option) any later version.

[Unit]
Description=Multi-User System
Documentation=man:systemd.special(7)
Requires=basic.target
Conflicts=rescue.service rescue.target
After=basic.target rescue.service rescue.target
AllowIsolate=yes
```

***
## X Window与命令行模式
```
文本界面的登陆环境，也称为命令行界面（Command Line Interface,CLI）或终端界面（Terminal或Console）
图形用户界面（Graphical User Interface,GUI）的登陆环境，X Window系统（也称为X或X11）是图形用户界面的一种
Linux默认的情况下会提供6个Terminal来让用户登陆，切换的方式是[Ctrl] + [Alt] + [F1]~[F6]的组合按钮
在centos7下
[Ctrl] + [Alt] + [F2] ~ [F6] ：命令行模式登入 tty1 ~ tty6 终端机
[Ctrl] + [Alt] + [F1] ：图形界面桌面
(上面这几个组合按键都需要在命令行下输入)

X Window下进入命令行模式和命令行模式进入X Window模式
在纯文本环境下执行如下命令即可： 
startx 

切换Run level(执行等级)实现模式的切换
Linux提供了7种执行等级，下面介绍四种，以后做补充： 
run level 0：关机 
run level 3：命令行模式 
run level 5：图形界面模式 
run level 6：关机

在各种模式间切换需要init这个命令，例如： 
init 0  : 关机 
init 3  : 进入命令行模式 
```

***
## 安装Gnome 桌面
* 需要使用 yum group install "GNOME Desktop"
```
[harrdy@HJX ~]$ yum groups
Loaded plugins: fastestmirror, langpacks
Repository base is listed more than once in the configuration
Repository updates is listed more than once in the configuration
Repository extras is listed more than once in the configuration
Repository centosplus is listed more than once in the configuration
Repository base is listed more than once in the configuration
Repository updates is listed more than once in the configuration
Repository extras is listed more than once in the configuration
Repository centosplus is listed more than once in the configuration
Repository epel is listed more than once in the configuration
Repository epel-debuginfo is listed more than once in the configuration
Repository epel-source is listed more than once in the configuration
Loading mirror speeds from cached hostfile
 * base: mirrors.nju.edu.cn
 * extras: mirrors.shu.edu.cn
 * nux-dextop: li.nux.ro
 * updates: mirrors.nju.edu.cn
 * webtatic: uk.repo.webtatic.com
Installed Environment Groups: 1
Available Environment Groups: 11
Available Groups: 20
Done
[harrdy@HJX ~]$ yum group list
Loaded plugins: fastestmirror, langpacks
Repository base is listed more than once in the configuration
Repository updates is listed more than once in the configuration
Repository extras is listed more than once in the configuration
Repository centosplus is listed more than once in the configuration
Repository base is listed more than once in the configuration
Repository updates is listed more than once in the configuration
Repository extras is listed more than once in the configuration
Repository centosplus is listed more than once in the configuration
Repository epel is listed more than once in the configuration
Repository epel-debuginfo is listed more than once in the configuration
Repository epel-source is listed more than once in the configuration
Loading mirror speeds from cached hostfile
 * base: mirrors.nju.edu.cn
 * extras: mirrors.shu.edu.cn
 * nux-dextop: li.nux.ro
 * updates: mirrors.nju.edu.cn
 * webtatic: uk.repo.webtatic.com
Installed Environment Groups:
   GNOME Desktop
Available Environment Groups:
   Minimal Install
   Compute Node
   Infrastructure Server
   File and Print Server
   Cinnamon Desktop
   MATE Desktop
   Basic Web Server
   Virtualization Host
   Server with GUI
   KDE Plasma Workspaces
   Development and Creative Workstation
Available Groups:
   Cinnamon
   Compatibility Libraries
   Console Internet Tools
   Development Tools
   Educational Software
   Electronic Lab
   Fedora Packager
   General Purpose Desktop
   Graphical Administration Tools
   Haskell
   Legacy UNIX Compatibility
   MATE
   Milkymist
   Scientific Support
   Security Tools
   Smart Card Support
   System Administration Tools
   System Management
   TurboGears application framework
   Xfce
Done
```
