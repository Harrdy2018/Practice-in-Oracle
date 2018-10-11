## 在CentOS7中安装python3.7.0

***
### 下载及解压
```linux
[root@yuioplvlinux-130 ~]# cd /usr/local/src/
[root@yuioplvlinux-130 src]# wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz
[root@yuioplvlinux-130 src]# tar xvJf Python-3.7.0.tar.xz
[root@yuioplvlinux-130 src]# mv Python-3.7.0 /usr/local/python-3.7
[root@yuioplvlinux-130 src]# cd /usr/local/python-3.7/
```

***
### 安装
```linux
安装之前，首先安装两个python依赖的包；

[root@yuioplvlinux-130 python-3.7]# yum -y install zlib* libffi-devel
配置编辑参数；

[root@yuioplvlinux-130 python-3.7]# ./configure --prefix=/usr/local/sbin/python-3.7
然后编译和安装：“make”、“make install”；

安装完成后，若出现以下两行，说明安装成功；

Installing collected packages: setuptools, pip
Successfully installed pip-10.0.1 setuptools-39.0.1
也可以用“echo $?”查看，结果为0说明安装成功；

然后就可以使用python3了
```

***
### 软连接
```linux
可以看到，虽然成功安装了python3.7，但是执行起来命令特别长，可以把python命令指向到到python3。

首先查看python命令的绝对路径，可以看到它是通过软链接执行到python2.7的。

[root@yuioplvlinux-130 ~]# python -V   #查看python的默认版本
Python 2.7.5
[root@yuioplvlinux-130 ~]# which python   #查看python命令的绝对路径
/usr/bin/python
[root@yuioplvlinux-130 ~]# ll /usr/bin/ |grep python
lrwxrwxrwx. 1 root root         7 7月  15 19:58 python -> python2
lrwxrwxrwx. 1 root root         9 7月  15 19:58 python2 -> python2.7
-rwxr-xr-x. 1 root root      7136 8月   4 2017 python2.7
那我们也可以做一个软链接指向到python3命令。

[root@yuioplvlinux-130 ~]# rm -rf /usr/bin/python   #删除原有的软链接文件
[root@yuioplvlinux-130 ~]# ln -s /usr/local/sbin/python-3.7/bin/python3 /usr/bin/python
[root@yuioplvlinux-130 ~]# ll /usr/bin/ |grep python
lrwxrwxrwx. 1 root root        38 7月  21 14:18 python -> /usr/local/sbin/python-3.7/bin/python3
lrwxrwxrwx. 1 root root         9 7月  15 19:58 python2 -> python2.7
-rwxr-xr-x. 1 root root      7136 8月   4 2017 python2.7
现在python的默认版本就是python 3.7.0了。

[root@yuioplvlinux-130 ~]# python -V
Python 3.7.0
[root@yuioplvlinux-130 ~]# python
Python 3.7.0 (default, Jul 21 2018, 13:45:48) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-28)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> 
 

修改完python的默认版本后，会存在一个问题，无法执行yum命令，修改yum命令文件，将头文件改为python2.7即可。

[root@yuioplvlinux-130 ~]# vim /usr/bin/yum
#!/usr/bin/python2.7   #将头文件改为python2.7
同样的，将pip也指向到python3.7。

[root@yuioplvlinux-130 ~]# ln -s /usr/local/sbin/python-3.7/bin/pip3 /usr/bin/pip
[root@yuioplvlinux-130 ~]# pip --version
pip 10.0.1 from /usr/local/sbin/python-3.7/lib/python3.7/site-packages/pip (python 3.7)
```
