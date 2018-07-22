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
***
## 第1.2节 用户配置文件-组信息文件
* 1、组信息文件 /etc/group
```
第一字段：组名
第二字段：组密码标志
第三字段：GID
第四字段：组中附加用户
```
* 2、组密码文件 /etc/gshadow
```
第一字段：组名
第二字段：组密码
第三字段：组管理员用户名
第四字段：组中附加用户
```
***
## 第2节 用户管理相关文件
* 1、用户的家目录
```
普通用户： /home/用户名/,所有者和所属组都是此用户，权限是700
[harrdy@client-A-132 ~]$ ll /home/
total 4
drwx------. 18 harrdy harrdy 4096 Jul 22 09:15 harrdy

超级用户： /root/，所有者和所属组都是root用户，权限是550
[root@client-A-132 ~]# ll -d /root/
dr-xr-x---. 6 root root 282 Jul 22 09:59 /root/
[root@client-A-132 ~]# 
```
* 2、用户的邮箱     `/var/spool/mail/用户名/`
* 3、用户模板目录   `/etc/skel/`
***
## 第3.1节 用户管理命令 useradd
* 1、useradd命令格式
```
Usage: useradd [options] LOGIN
       useradd -D
       useradd -D [options]

Options:
  -c, --comment COMMENT         GECOS field of the new account
  -d, --home-dir HOME_DIR       home directory of the new account
  -D, --defaults                print or change default useradd configuration
  -g, --gid GROUP               name or ID of the primary group of the new
                                account
  -G, --groups GROUPS           list of supplementary groups of the new
  -s, --shell SHELL             login shell of the new account
  -u, --uid UID                 user ID of the new account
```
* 2、添加默认用户   useradd lukang
```
实际上系统默认执行了如下几步>>>
[root@client-A-132 ~]# grep lukang /etc/passwd
lukang:x:1001:1001::/home/lukang:/bin/bash
[root@client-A-132 ~]# grep lukang /etc/shadow
lukang:$6$O3Cmu/x.$jgQ5ER/ZH90k.nt.9eb8LE3uf95Ks2xC7zaOJuCPK3GVVmBTkYj3562LJ4NabHqUYxxP3zSRQl0nC2cbfZnRh/:17734:0:99999:7:::
[root@client-A-132 ~]# grep lukang /etc/group
lukang:x:1001:
[root@client-A-132 ~]# grep lukang /etc/gshadow
lukang:!::
[root@client-A-132 ~]# ll -d /home/lukang/
drwx------. 3 lukang lukang 78 Jul 22 10:16 /home/lukang/
[root@client-A-132 ~]# ls /var/spool/mail/
harrdy  lukang  root  rpc
```
***
* 3、用户默认值文件
```
[root@client-A-132 ~]# cat /etc/default/useradd 
# useradd defaults file
GROUP=100                #用户默认组
HOME=/home               #用户家目录
INACTIVE=-1              #密码过期宽限时间（shadow文件7字段）
EXPIRE=                  #密码失效时间（8）
SHELL=/bin/bash          #默认shell
SKEL=/etc/skel           #模板目录
CREATE_MAIL_SPOOL=yes    #是否建立邮箱

[root@client-A-132 ~]# 
```
```
[root@client-A-132 ~]# cat /etc/login.defs 
#
# Please note that the parameters in this configuration file control the
# behavior of the tools from the shadow-utils component. None of these
# tools uses the PAM mechanism, and the utilities that use PAM (such as the
# passwd command) should therefore be configured elsewhere. Refer to
# /etc/pam.d/system-auth for more information.
#

# *REQUIRED*
#   Directory where mailboxes reside, _or_ name of file, relative to the
#   home directory.  If you _do_ define both, MAIL_DIR takes precedence.
#   QMAIL_DIR is for Qmail
#
#QMAIL_DIR	Maildir
MAIL_DIR	/var/spool/mail
#MAIL_FILE	.mail

# Password aging controls:
#
#	PASS_MAX_DAYS	Maximum number of days a password may be used.
#	PASS_MIN_DAYS	Minimum number of days allowed between password changes.
#	PASS_MIN_LEN	Minimum acceptable password length.
#	PASS_WARN_AGE	Number of days warning given before a password expires.
#
PASS_MAX_DAYS	99999                         #密码有效期（5）
PASS_MIN_DAYS	0                             #密码修改间隔（4）
PASS_MIN_LEN	5                             #密码最小5位（PAM）
PASS_WARN_AGE	7                             #密码到期警告（6）

#
# Min/max values for automatic uid selection in useradd
#
UID_MIN                  1000                 #最小和最大UID范围
UID_MAX                 60000
# System accounts
SYS_UID_MIN               201
SYS_UID_MAX               999

#
# Min/max values for automatic gid selection in groupadd
#
GID_MIN                  1000
GID_MAX                 60000
# System accounts
SYS_GID_MIN               201
SYS_GID_MAX               999

#
# If defined, this command is run when removing a user.
# It should remove any at/cron/print jobs etc. owned by
# the user to be removed (passed as the first argument).
#
#USERDEL_CMD	/usr/sbin/userdel_local

#
# If useradd should create home directories for users by default
# On RH systems, we do. This option is overridden with the -m flag on
# useradd command line.
#
CREATE_HOME	yes

# The permission mask is initialized to this value. If not specified, 
# the permission mask will be initialized to 022.
UMASK           077

# This enables userdel to remove user groups if no members exist.
#
USERGROUPS_ENAB yes

# Use SHA512 to encrypt password.
ENCRYPT_METHOD SHA512                             #加密模式

[root@client-A-132 ~]# 
```
***
## 第3.2节 用户管理命令 passwd
* 1、passwd命令格式
```
Usage: passwd [OPTION...] <accountName>
  -k, --keep-tokens       keep non-expired authentication tokens
  -d, --delete            delete the password for the named account (root only)
  -l, --lock              lock the password for the named account (root only)        #用的多
  -u, --unlock            unlock the password for the named account (root only)      #用的多
  -e, --expire            expire the password for the named account (root only)
  -f, --force             force operation
  -x, --maximum=DAYS      maximum password lifetime (root only)
  -n, --minimum=DAYS      minimum password lifetime (root only)
  -w, --warning=DAYS      number of days warning users receives before password expiration (root only)
  -i, --inactive=DAYS     number of days after password expiration when an account becomes disabled (root only)
  -S, --status            report password status on the named account (root only)     #用的多
  --stdin                 read new tokens from stdin (root only)                      #用的多

Help options:
  -?, --help              Show this help message
  --usage                 Display brief usage message
```
