#   EPEL

***
## EPEL 介绍
```
EPEL 是 yum 的一个软件源,里面包含了许多基本源里没有的软件了，但在我们在使用epel时是需要安装它才可以了，
EPEL，即 Extra Packages for Enterprise Linux 的简称，是为企业级Linux提供的一组高质量的额外软件包
```

***
## 安装
* 命令安装 yum -y install epel-release
* 手动安装
```
rpm -vih
-v, --verbose                    provide more detailed output
-i, --install                    install package(s)
-h, --hash                       print hash marks as package installs (good with -v)

第一种 rpm -vih https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm 

第二种 cd ~ && wget https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm 

第三种 rpm -vih epel-release-7-11.noarch.rpm 
```

***
## 查看
```
[harrdy@client-A-132 yum.repos.d]$ pwd
/etc/yum.repos.d
[harrdy@client-A-132 yum.repos.d]$ ls
CentOS-Base.repo  CentOS-Debuginfo.repo  CentOS-Media.repo    CentOS-Vault.repo  epel-testing.repo
CentOS-CR.repo    CentOS-fasttrack.repo  CentOS-Sources.repo  epel.repo
```

* 更新源 `yum clean all && yum makecache`
```
yum--->>>
clean          Remove cached data
makecache      Generate the metadata cache
```
