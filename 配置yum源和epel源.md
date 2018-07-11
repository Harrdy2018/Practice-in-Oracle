# CentOS 7 系统配置国内 yum 源和 epel 源
***
## 第一步 首先进入 `/etc/yum.repos.d/` 目录下，新建一个 `repo_bak` 目录，用于保存系统中原来的 `repo` 文件
```
[harrdy@client-B-133 ~]$ cd /etc/yum.repos.d/
[harrdy@client-B-133 yum.repos.d]$ ls
CentOS-Base.repo  CentOS-CR.repo  CentOS-Debuginfo.repo  CentOS-fasttrack.repo  CentOS-Media.repo  CentOS-Sources.repo  CentOS-Vault.repo
[harrdy@client-B-133 yum.repos.d]$ sudo mkdir repo_bak
[sudo] password for harrdy: 
[harrdy@client-B-133 yum.repos.d]$ ls
CentOS-Base.repo  CentOS-Debuginfo.repo  CentOS-Media.repo    CentOS-Vault.repo
CentOS-CR.repo    CentOS-fasttrack.repo  CentOS-Sources.repo  repo_bak
[harrdy@client-B-133 yum.repos.d]$ sudo mv *.repo repo_bak/
[harrdy@client-B-133 yum.repos.d]$ ls
repo_bak

我们看一下 repo_bak 目录下的文件
[harrdy@client-B-133 yum.repos.d]$ cd ./repo_bak/
[harrdy@client-B-133 repo_bak]$ ls
CentOS-Base.repo  CentOS-CR.repo  CentOS-Debuginfo.repo  CentOS-fasttrack.repo  CentOS-Media.repo  CentOS-Sources.repo  CentOS-Vault.repo

第一步操作成功
```
***
## 第二步 切换到 `yum.repos.d` 目录下，到网易和阿里开源镜像站点下载系统对应版本的 `repo` 文件
```
下载阿里的 repo 文件
[harrdy@client-B-133 yum.repos.d]$ pwd
/etc/yum.repos.d
[harrdy@client-B-133 yum.repos.d]$ sudo wget http://mirrors.aliyun.com/repo/Centos-7.repo
[sudo] password for harrdy: 
--2018-07-12 04:29:32--  http://mirrors.aliyun.com/repo/Centos-7.repo
Resolving mirrors.aliyun.com (mirrors.aliyun.com)... 180.101.203.225, 180.101.203.224, 180.101.203.226, ...
Connecting to mirrors.aliyun.com (mirrors.aliyun.com)|180.101.203.225|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2523 (2.5K) [application/octet-stream]
Saving to: ‘Centos-7.repo’

100%[==================================================================================================>] 2,523       --.-K/s   in 0s      

2018-07-12 04:29:32 (423 MB/s) - ‘Centos-7.repo’ saved [2523/2523]

[harrdy@client-B-133 yum.repos.d]$ ls
Centos-7.repo  repo_bak

下载网易的 repo 文件
[harrdy@client-B-133 yum.repos.d]$ sudo wget http://mirrors.163.com/.help/CentOS7-Base-163.repo
--2018-07-12 04:31:40--  http://mirrors.163.com/.help/CentOS7-Base-163.repo
Resolving mirrors.163.com (mirrors.163.com)... 59.111.0.251
Connecting to mirrors.163.com (mirrors.163.com)|59.111.0.251|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1572 (1.5K) [application/octet-stream]
Saving to: ‘CentOS7-Base-163.repo’

100%[==================================================================================================>] 1,572       --.-K/s   in 0s      

2018-07-12 04:31:40 (259 MB/s) - ‘CentOS7-Base-163.repo’ saved [1572/1572]

[harrdy@client-B-133 yum.repos.d]$ ls
CentOS7-Base-163.repo  Centos-7.repo  repo_bak
```
***
## 第三步 清除系统 `yum` 缓存并生成新的 `yum` 缓存
```
[harrdy@client-B-133 yum.repos.d]$ ls                                    # 列出/etc/yum.repos.d/目录下的文件
CentOS7-Base-163.repo  Centos-7.repo  repo_bak
[harrdy@client-B-133 yum.repos.d]$ yum clean all                         # 清除系统所有的yum缓存
Loaded plugins: fastestmirror, langpacks
Repository base is listed more than once in the configuration
Repository updates is listed more than once in the configuration
Repository extras is listed more than once in the configuration
Repository centosplus is listed more than once in the configuration
Cleaning repos: base extras updates
Cleaning up everything
Maybe you want: rm -rf /var/tmp/yum-harrdy-CmO1bX, to also free up space taken by orphaned data from disabled or removed repos
[harrdy@client-B-133 yum.repos.d]$ yum makecache                        # 生成yum缓存
Loaded plugins: fastestmirror, langpacks
Repository base is listed more than once in the configuration
Repository updates is listed more than once in the configuration
Repository extras is listed more than once in the configuration
Repository centosplus is listed more than once in the configuration
Determining fastest mirrors
base                                                                                                                 | 3.6 kB  00:00:00     
extras                                                                                                               | 3.4 kB  00:00:00     
updates                                                                                                              | 3.4 kB  00:00:00     
(1/7): extras/7/x86_64/prestodelta                                                                                   |  49 kB  00:00:00     
(2/7): extras/7/x86_64/other_db                                                                                      |  97 kB  00:00:00     
(3/7): updates/7/x86_64/other_db                                                                                     | 336 kB  00:00:00     
(4/7): extras/7/x86_64/filelists_db                                                                                  | 524 kB  00:00:00     
(5/7): updates/7/x86_64/filelists_db                                                                                 | 2.1 MB  00:00:00     
(6/7): base/7/x86_64/other_db                                                                                        | 2.5 MB  00:00:01     
(7/7): base/7/x86_64/filelists_db                                                                                    | 6.9 MB  00:00:01     
Metadata Cache Created
```
***
## 第四步 安装 `epel` 源
```
[harrdy@client-B-133 yum.repos.d]$ yum list | grep epel-release                       #在 yum 源里搜索 epel-release 包
Repository base is listed more than once in the configuration
Repository updates is listed more than once in the configuration
Repository extras is listed more than once in the configuration
Repository centosplus is listed more than once in the configuration
epel-release.noarch                         7-11                       extras   
[harrdy@client-B-133 yum.repos.d]$ sudo yum install -y epel-release                   #应答模式安装
[sudo] password for harrdy: 
Loaded plugins: fastestmirror, langpacks
Repository base is listed more than once in the configuration
Repository updates is listed more than once in the configuration
Repository extras is listed more than once in the configuration
Repository centosplus is listed more than once in the configuration
Loading mirror speeds from cached hostfile
base                                                                                                                 | 3.6 kB  00:00:00     
extras                                                                                                               | 3.4 kB  00:00:00     
updates                                                                                                              | 3.4 kB  00:00:00     
Resolving Dependencies
--> Running transaction check
---> Package epel-release.noarch 0:7-11 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

============================================================================================================================================
 Package                               Arch                            Version                        Repository                       Size
============================================================================================================================================
Installing:
 epel-release                          noarch                          7-11                           extras                           15 k

Transaction Summary
============================================================================================================================================
Install  1 Package

Total download size: 15 k
Installed size: 24 k
Downloading packages:
epel-release-7-11.noarch.rpm                                                                                         |  15 kB  00:00:00     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : epel-release-7-11.noarch                                                                                                 1/1 
  Verifying  : epel-release-7-11.noarch                                                                                                 1/1 

Installed:
  epel-release.noarch 0:7-11                                                                                                                

Complete!

# epel 源安装成功，比原来多了一个 epel.repo 和 epel-testing.repo 文件
[harrdy@client-B-133 yum.repos.d]$ ls
CentOS7-Base-163.repo  Centos-7.repo  epel.repo  epel-testing.repo  repo_bak
```
***
## 第五步 使用阿里开源镜像提供的 `epel` 源
```
[harrdy@client-B-133 yum.repos.d]$ ls
CentOS7-Base-163.repo  Centos-7.repo  epel.repo  epel-testing.repo  repo_bak
[harrdy@client-B-133 yum.repos.d]$ sudo wget http://mirrors.aliyun.com/repo/epel-7.repo       #下载阿里开源镜像的 epel 源文件
[sudo] password for harrdy: 
--2018-07-12 04:45:58--  http://mirrors.aliyun.com/repo/epel-7.repo
Resolving mirrors.aliyun.com (mirrors.aliyun.com)... 180.101.203.226, 180.101.203.224, 180.101.203.223, ...
Connecting to mirrors.aliyun.com (mirrors.aliyun.com)|180.101.203.226|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 664 [application/octet-stream]
Saving to: ‘epel-7.repo’

100%[==================================================================================================>] 664         --.-K/s   in 0s      

2018-07-12 04:45:58 (101 MB/s) - ‘epel-7.repo’ saved [664/664]

[harrdy@client-B-133 yum.repos.d]$ ls
CentOS7-Base-163.repo  Centos-7.repo  epel-7.repo  epel.repo  epel-testing.repo  repo_bak
```
***
## 第六步 再次清除系统 `yum` 缓存，并重新生成新的 `yum` 缓存
* `yum clean all`
* `yum makecache`

***
## 第七步 查看系统可用的 `yum` 源和所有的 `yum` 源
* `yum repolist enabled`
* `yum repolist all`
```
# yum repolist 这是可以看到系统中 epel 源仓库已加载成功。

[harrdy@client-B-133 yum.repos.d]$ yum repolist 
Loaded plugins: fastestmirror, langpacks
Repository base is listed more than once in the configuration
Repository updates is listed more than once in the configuration
Repository extras is listed more than once in the configuration
Repository centosplus is listed more than once in the configuration
Repository epel is listed more than once in the configuration
Repository epel-debuginfo is listed more than once in the configuration
Repository epel-source is listed more than once in the configuration
Loading mirror speeds from cached hostfile
repo id                                             repo name                                                                         status
base/7/x86_64                                       CentOS-7 - Base - 163.com                                                          9,911
epel/x86_64                                         Extra Packages for Enterprise Linux 7 - x86_64                                    12,605
extras/7/x86_64                                     CentOS-7 - Extras - 163.com                                                          314
updates/7/x86_64                                    CentOS-7 - Updates - 163.com                                                         946
repolist: 23,776
```
***
## `repo` 文件详解
```
[harrdy@client-B-133 yum.repos.d]$ ls
CentOS7-Base-163.repo  Centos-7.repo  epel-7.repo  epel.repo  epel-testing.repo  repo_bak
其中 CentOS7-Base-163.repo  Centos-7.repo 文件中，默认只有第一个 CentOS7-Base-163.repo 文件的 YUM 源连接时启动的，其他三个文件默认不启动。

repo文件是CentOS、RedHat和Fedora操作系统中yum源（软件仓库）的配置文件，通常一个repo文件定义了一个或者多个软件源。
我们以 CentOS7-Base-163.repo 仓库基础配置文件为例
一个标准的centos的repo文件内容如下：
[base]
name=CentOS-$releasever - Base - 163.com
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os
baseurl=http://mirrors.163.com/centos/$releasever/os/$basearch/
gpgcheck=1
gpgkey=http://mirrors.163.com/centos/RPM-GPG-KEY-CentOS-7
各个选项说明如下：
[base]：代表仓库的名字，中括号一定要存在，里面的名称可以随意，但是不能有两个相同的容器名称。
name:说明一下仓库的意义。
mirrorlist：这个是仓库的镜像站点列表。一般情况下默认是使用此选项。
baseurl:这个最重要，因为后面接的就是仓库的实际地址。mirrorlist是由yum程序自行去找镜像站点，baseurl则是指定固定的一个仓库网址。一个repo文件可以定义多个软件源。
enable=1：就是让这个容器启动，如果不想启动可以使用enable=0.
gpgcheck=1：指定是否需要查阅RPM文件内的数字证书。
gpgkey：就是数字证书的公钥文件所在的位置。

在Centos-Base.repo中还定义的其它的名称的仓库，如：[updates]、[extras]、[centosplus]等等，这些仓库都为YUM服务器额外附加或者是升级是用到的软件仓库，分别指向不同的路径软件仓库。
```
