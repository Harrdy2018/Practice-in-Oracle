# GNOME Desktop

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
