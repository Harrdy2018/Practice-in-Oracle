# 网络抓包工具 wireshark

***
## 安装配置
```linux
[harrdy@HJX ~]$ yum search wireshark
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
 * base: mirrors.shu.edu.cn
 * extras: ftp.sjtu.edu.cn
 * nux-dextop: li.nux.ro
 * updates: mirrors.njupt.edu.cn
 * webtatic: uk.repo.webtatic.com
epel                                                                                                                            12687/12687
========================================================== N/S matched: wireshark ==========================================================
wireshark-devel.i686 : Development headers and libraries for wireshark
wireshark-devel.x86_64 : Development headers and libraries for wireshark
wireshark-gnome.x86_64 : Gnome desktop integration for wireshark
wireshark.i686 : Network traffic analyzer
wireshark.x86_64 : Network traffic analyzer

  Name and summary matches only, use "search all" for everything.
[harrdy@HJX ~]$ 
```
* 安装命令 sudo yum install wireshark wireshark-gnome
```linux
Dependencies Resolved

============================================================================================================================================
 Package                               Arch                         Version                                Repository                  Size
============================================================================================================================================
Installing:
 wireshark                             x86_64                       1.10.14-14.el7                         base                        13 M
 wireshark-gnome                       x86_64                       1.10.14-14.el7                         base                       910 k
Installing for dependencies:
 libsmi                                x86_64                       0.4.8-13.el7                           base                       2.3 M

Transaction Summary
============================================================================================================================================
Install  2 Packages (+1 Dependent package)
```

***
## 使用
```linux
[harrdy@HJX ~]$ which wireshark
/usr/sbin/wireshark
[harrdy@HJX ~]$ wireshark -v
[harrdy@HJX ~]$ wireshark -h
[harrdy@HJX ~]$ wireshark           不加任何参数表示打开图形化界面
```
