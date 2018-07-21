# 第七章 用户和用户组管理
***
## 第1.1节 用户配置文件-用户信息文件
* 1、用户管理简介
```
所以越是对服务器安全性要求高的服务器，越需要建立合理的用户权限等级制度和服务器操作规范
在Linux中主要是通过用户配置文件来查看和修改用户信息
```
* 2、`/etc/passwd`
```
root:x:0:0:root:/root:/bin/bash
第1字段： 用户名称
第2字段: 密码标志
第3字段： UID（用户ID）
0:         超级用户
1-499:     系统用户（伪用户）
500-65535:  普通用户
第4字段： GID（用户初始组ID）
第5字段: 用户说明
第6字段： 家目录
        普通用户： /home/用户名/
        超级用户： /root/
第7字段：登陆之后的Shell        

查看解释配置文件的信息，用 man 5 后面直接加文件名
[root@client-A-132 ~]# man 5 passwd

详细解释如下：
 Each line of the file describes a single user, and contains seven colon-separated fields:

              name:password:UID:GID:GECOS:directory:shell

       The field are as follows:

       name        This is the user's login name.  It should not contain capital letters.

       password    This is either the encrypted user password, an asterisk (*), or the letter 'x'.  (See pwconv(8) for an explanation of
                   'x'.)

       UID         The privileged root login account (superuser) has the user ID 0.

       GID         This is the numeric primary group ID for this user.  (Additional groups for the user are defined in the system  group
                   file; see group(5)).
       GECOS       This  field (sometimes called the "comment field") is optional and used only for informational purposes.  Usually, it
                   contains the full username.  Some programs (for example, finger(1)) display information from this field.

                   GECOS stands for "General Electric Comprehensive Operating System", which was renamed to GCOS when GE's large systems
                   division  was sold to Honeywell.  Dennis Ritchie has reported: "Sometimes we sent printer output or batch jobs to the
                   GCOS machine.  The gcos field in the password file was a place to stash the information for the $IDENTcard.  Not ele‐
                   gant."

       directory   This  is  the  user's  home directory: the initial directory where the user is placed after logging in.  The value in
                   this field is used to set the HOME environment variable.

       shell       This is the program to run at login (if empty, use /bin/sh).  If set to a nonexistent executable, the  user  will  be
                   unable to login through login(1).  The value in this field is used to set the SHELL environment variable.

```
* 组：相同类型用户的集合就可以称为一个组
* 3、初始组和附加组
```
初始组：就是指用户一登陆就立刻拥有这个用户组的相关权限，
       每个用户的初始组只能有一个，一般就是和这个用户的用户名相同的组名作为这个用户的初始组
附加组: 指用户可以加入多个其他的用户组，
       并拥有这些组的权限，附加组可以有多个。
```
* 4、Shell是什么
```
Shell就是Linux的命令解释器
在/etc/passwd当中，除了标准Shell是/bin/bash之外，还可以写如/sbin/nologin
```
***
## 第1.2节 用户配置文件-影子文件
* /etc/passwd 权限644
* /etc/shadow 权限000
```
第1字段： 用户名
第2字段： 加密密码
         加密算法升级为SHA512散列加密算法
         如果密码位是 ！！ 或 * 代表没有密码，不能登陆
第3字段： 密码最后一次修改日期
         使用1970年1月1日作为标准时间，每过一天时间戳加 1
第4字段： 两次密码的修改间隔时间（和第3字段相比）
第5字段： 密码有效期（和第3字段相比）
第6字段： 密码修改到期前的警告天数（和第5字段相比）
第7字段： 密码过期后的宽限时间（和第5字段相比）
         0：代表密码过期后立即失效
         -1：代表密码永远不会失效
第8字段： 账号失效时间
         要用时间戳表示
第9字段： 保留
```
* 时间戳换算
```
把时间戳换算为日期  
[root@client-A-132 ~]# date -d "1970-01-01 16066 days" 
Fri Dec 27 00:00:00 CST 2013
把日期换算为时间戳
[root@client-A-132 ~]# echo $(($(date --date="2014/01/06" +%s)/86400+1))
16076
```
