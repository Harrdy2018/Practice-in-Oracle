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
## 第三步 清除系统 yum 缓存并生成新的 yum 缓存
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
