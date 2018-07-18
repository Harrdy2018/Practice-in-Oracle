# Shell 变量
***
## 第4.1节 Bash变量-用户自定义变量
**环境变量名建议大写，便于区分**
* 用户自定义变量、环境变量、位置参数变量、预定义变量
```sh
本地变量就是用户自定义变量

变量的定义以及调用
[harrdy@controller ~]$ name="harrdy"
[harrdy@controller ~]$ echo $name
harrdy

变量叠加
[harrdy@controller ~]$ aa=123
[harrdy@controller ~]$ aa="$aa"456
[harrdy@controller ~]$ echo $aa
123456
[harrdy@controller ~]$ aa=${aa}789
[harrdy@controller ~]$ echo $aa
123456789

变量查看 set  查看系统当中所有的变量

变量删除 unset aa
[harrdy@controller ~]$ echo $aa
123456789
[harrdy@controller ~]$ unset aa
[harrdy@controller ~]$ echo $aa

[harrdy@controller ~]$ 
```
***
## 第4.2节 Bash变量-环境变量
* 设置环境变量
```sh
声明变量     export 变量名=变量值
查询变量     env
删除变量     unset 变量名

[harrdy@client-A-132 ~]$ name='Harrdy'                #本地变量
[harrdy@client-A-132 ~]$ export age=23                #环境变量
[harrdy@client-A-132 ~]$ sex=female
[harrdy@client-A-132 ~]$ export sex                   #环境变量

用 set 可以查看   所有的变量都可以查到
用 env 只可以查到环境变量
[harrdy@client-A-132 ~]$ env | grep age
age=23
[harrdy@client-A-132 ~]$ env | grep sex
sex=female
[harrdy@client-A-132 ~]$ env | grep name
[harrdy@client-A-132 ~]$ 
```
* 系统常见环境变量
```sh
PATH: 系统查找命令的路径
[harrdy@client-A-132 ~]$ echo $PATH
/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/harrdy/.local/bin:/home/harrdy/bin



PATH变量叠加  PATH="$PATH":/root/sh

[root@client-A-132 ~]# pwd
/root
[root@client-A-132 ~]# echo $PATH
/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/harrdy/.local/bin:/home/harrdy/bin
[root@client-A-132 ~]# vim 2018test.sh
[root@client-A-132 ~]# cat 2018test.sh 
#!/bin/sh

echo "Hello World!!"
[root@client-A-132 ~]# ./2018test.sh
bash: ./2018test.sh: Permission denied
[root@client-A-132 ~]# chmod 744 2018test.sh 
[root@client-A-132 ~]# ./2018test.sh
Hello World!!
[root@client-A-132 ~]# PATH="$PATH":/root
[root@client-A-132 ~]# 2018test.sh
Hello World!!
[root@client-A-132 ~]# echo $PATH
/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/home/harrdy/.local/bin:/home/harrdy/bin:/root
[root@client-A-132 ~]# 
```
***
```sh
PS1     定义系统提示符的变量
\d       日期
\h       主机名
\t       显示24小时制时间
\T       显示12小时制时间
\A       显示24小时制时间
\u       显示当前用户名
\w       显示当前所在目录的完整名称
\W      显示当前所在目录的最后一个目录
\#      执行的第几个命令
\$      提示符。如果是root用户会显示提示符为#
               如果是普通用户会显示提示符为$
```
***
```sh
[root@client-A-132 ~]# echo $PS1
[\u@\h \W]\$
[root@client-A-132 ~]# 
解释：  \u--->>>root   \h--->>>client-A-132  \W--->>>~      \$--->>>#
```

***
## 第4.3节 Bash变量-位置参数变量
* 位置参数变量
```
$n           n为数字,$0代表命令本身,$1~$9代表第一
             到第九个参数，十以上的参数需要用大括号
             包含，如${10}
$*           这个变量代表命令行中所有的参数，把所有
             的参数看成一个整体
$@           这个变量代表命令行中所有的参数，不过
             $@把每个参数区分对待
$#          这个变量代表命令行中所有的参数的个数
```
***
```
[root@client-A-132 ~]# ls
2018test.sh  anaconda-ks.cfg  canshu1.sh  initial-setup-ks.cfg
[root@client-A-132 ~]# cat canshu1.sh 
#!/bin/bash
echo $0
echo $1
echo $2
echo $3
echo $4
echo $5
[root@client-A-132 ~]# canshu1.sh
/root/canshu1.sh





[root@client-A-132 ~]# canshu1.sh A B C D E
/root/canshu1.sh
A
B
C
D
E
[root@client-A-132 ~]# 
```
***
* 加法器
```
[root@client-A-132 ~]# cat add.sh 
#!/bin/bash
numA=$1
numB=$2
sum=$(($numA+$numB))
echo $sum
[root@client-A-132 ~]# sh add.sh 1 2
3
[root@client-A-132 ~]# 
```
