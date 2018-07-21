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
