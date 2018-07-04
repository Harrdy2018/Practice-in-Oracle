# CentOS 7命令行学习

***
## IP命令
```
win7下--->>>ipconfig      Ubuntu下--->>>ifconfig    CentOS 7下---->>>ip addr

```

***
## uname
```
uanme -a 打印所有信息
uanme -s 打印内核的名字
uanme -r 打印内核的发行
uanme -v 打印内核的版本
uname --help
```

***
## yum upgrade 和 yum update
```
yum update 升级所有包同时 也升级软件和系统内核
yum upgrade 只升级所有包，不升级软件和系统内核
```

***
## `su - root` 相当于一个新的用户登录系统
## 查看计算机名字 `echo $HOSTNAME`
## 修改计算机名字 `/etc/hostname`

***
## 代理设置
```
全局代理设置 /etc/profile 也可以直接在命令行写入export http_proxy=...
yum代理设置 /etc/yum.conf 文件尾部加入proxy=...
wget代理设置 /etc/wgetrc
```

***
## 重启网卡 `service network restart`
