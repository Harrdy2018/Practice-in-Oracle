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
* 安装之前，首先安装两个python依赖的包
`[root@yuioplvlinux-130 python-3.7]# yum -y install zlib* libffi-devel`
