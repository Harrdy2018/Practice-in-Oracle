# Shell 编程

***
## 第2.1节 字符串截取命令-cut命令
```
cut [选项] 文件名
-f            列号，提取第几列
-d           分隔符，按照指定分隔符分割列

[root@controller harrdy]# cat stu.txt 
ID	Name	gender	Mark
1	Liming	M	86
2	Sc	M	90
3	Gao	M	83
[root@controller harrdy]# cut -f2 stu.txt 
Name
Liming
Sc
Gao
[root@controller harrdy]# cut -f2,4 stu.txt 
Name	Mark
Liming	86
Sc	90
Gao	83
[root@controller harrdy]# 

[harrdy@controller ~]$ cat lk.txt
1:2:3:4
A:B:C:D
[harrdy@controller ~]$ cut -d ':' -f 2,4 lk.txt 
2:4
B:D
[harrdy@controller ~]$ 
```

***
## 第2.2节 格式化的控制下格式化和打印字符串-printf命令
```
格式化输出同C printf
输出格式:
\a                            输出警告声音
\b                            输出退格键，Backspace
\f                            清除屏幕
\n                            换行
\r                            回车，Enter
\t                            水平输出退格键，Tab
\v                           垂直输出退格键，Tab
```
* 例子
```sh
# %ns代表的意思是，只输出一个字符串，但是原始的字符比如1,2,3每个要占n个空格
Harrdy@DESKTOP-T94UKG2 MINGW64 ~/Desktop
$ printf "%s" 1 2 3
123
Harrdy@DESKTOP-T94UKG2 MINGW64 ~/Desktop
$ printf "%2s" 1 2 3
 1 2 3
Harrdy@DESKTOP-T94UKG2 MINGW64 ~/Desktop
$ printf "%3s" 1 2 3
  1  2  3
  
# %m.nf代表的意思是，只输出一个字符串，但是原始的字符比如1,2,3每个要有n个小数位，并且每个字符占m个空格
Harrdy@DESKTOP-T94UKG2 MINGW64 ~/Desktop
$ printf "%.2f" 1 2 3
1.002.003.00
Harrdy@DESKTOP-T94UKG2 MINGW64 ~/Desktop
$ printf "%5.2f" 1 2 3
 1.00 2.00 3.00

# 有几个%s打印几个字符，字符与字符之间用空格隔开
Harrdy@DESKTOP-T94UKG2 MINGW64 ~/Desktop
$ printf "%s" 1 2 3
123
Harrdy@DESKTOP-T94UKG2 MINGW64 ~/Desktop
$ printf "%s %s" 1 2 3
1 23
Harrdy@DESKTOP-T94UKG2 MINGW64 ~/Desktop
$ printf "%s %s %s" 1 2 3
1 2 3

# 每三个字符打印一个空格，每3个字符打印一个kk,如果不够3个，可以想象成补空字符
$ printf "%s %s %s\n" 1 2 3 4 5
1 2 3
4 5

Harrdy@DESKTOP-T94UKG2 MINGW64 ~/Desktop
$ printf "%s %s %skk" 1 2 3 4 5
1 2 3kk4 5 kk

# -v var把输出分配给shell变量，而不是直接输出
Harrdy@DESKTOP-T94UKG2 MINGW64 ~/Desktop
$ printf -v myVal "%s" 1 2 3

Harrdy@DESKTOP-T94UKG2 MINGW64 ~/Desktop
$ echo $myVal
123

```
***
## 第2.3节 字符串截取命令-awk命令
```
awk '条件一{动作1}条件2{动作2}...' 文件名

条件(Pattern),一般使用关系表达式作为条件
x>10     判断变量x是否大于10
x>=10    大于等于
x<=10    小于等于

动作(Action)
格式化输出
流程控制语句
```
```
[harrdy@controller ~]$ cat student.txt 
ID       Name       PHP       Linux        MySQL          Average
1        Liming     82        95           86             87.66
2        Sc         99        96           87             85.66
3        Gao        99        83           93             91.66
[harrdy@controller ~]$ awk '{printf $2"\t"$6"\n"}' student.txt 
Name	Average
Liming	87.66
Sc	85.66
Gao	91.66


[harrdy@controller ~]$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda3        54G  5.7G   49G  11% /
devtmpfs        896M     0  896M   0% /dev
tmpfs           911M     0  911M   0% /dev/shm
tmpfs           911M   11M  901M   2% /run
tmpfs           911M     0  911M   0% /sys/fs/cgroup
/dev/sda2       2.0G   33M  2.0G   2% /data
tmpfs           183M   40K  183M   1% /run/user/1000
/dev/sr0        4.2G  4.2G     0 100% /run/media/harrdy/CentOS 7 x86_64
[harrdy@controller ~]$ df -h | awk '{printf $1"\t"$5"\n"}' 
Filesystem	Use%
/dev/sda3	11%
devtmpfs	0%
tmpfs	0%
tmpfs	2%
tmpfs	0%
/dev/sda2	2%
tmpfs	1%
/dev/sr0	100%

Linux系统里面是没有print的，但是awk里面有，print命令默认后面有换行符!!!!!
[harrdy@controller ~]$ df -h | awk '{print $1"\t"$5}' 
Filesystem	Use%
/dev/sda3	11%
devtmpfs	0%
tmpfs	0%
tmpfs	2%
tmpfs	0%
/dev/sda2	2%
tmpfs	1%
/dev/sr0	100%
```
```
怎么样提取数字11
[harrdy@controller ~]$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda3        54G  5.7G   49G  11% /
devtmpfs        896M     0  896M   0% /dev
tmpfs           911M     0  911M   0% /dev/shm
tmpfs           911M   11M  901M   2% /run
tmpfs           911M     0  911M   0% /sys/fs/cgroup
/dev/sda2       2.0G   33M  2.0G   2% /data
tmpfs           183M   40K  183M   1% /run/user/1000
/dev/sr0        4.2G  4.2G     0 100% /run/media/harrdy/CentOS 7 x86_64
[harrdy@controller ~]$ df -h | grep sda3
/dev/sda3        54G  5.7G   49G  11% /
[harrdy@controller ~]$ df -h | grep sda3 | awk '{printf $5"\n"}'
11%
[harrdy@controller ~]$ df -h | grep sda3 | awk '{printf $5"\n"}' | cut -d "%" -f1
11
```
```
在进行数据提取之前，先执行 BEGIN
[harrdy@controller ~]$ awk 'BEGIN {printf "This is a transcript \n"} \
> {printf $2 "\t" $6 "\n"}' student.txt
This is a transcript 
Name	Average
Liming	87.66
Sc	85.66
Gao	91.66
```
```sh
[harrdy@controller ~]$ awk 'END {printf "End\n"} \
> {printf $2"\t"$6"\n"}' student.txt
Name	Average
Liming	87.66
Sc	85.66
Gao	91.66
End
```
```sh
内置变量 FS 指定分割符号
[harrdy@controller ~]$ cat /etc/passwd | grep "/bin/bash"
root:x:0:0:root:/root:/bin/bash
harrdy:x:1000:1000:harrdy:/home/harrdy:/bin/bash
[harrdy@controller ~]$ cat /etc/passwd | grep "/bin/bash" | \
> awk 'BEGIN {FS=":"} {printf $1"\t"$3"\n"}'
root	0
harrdy	1000

awk命令默认先读入第一行数据，所以才会出现下面的结果，所以需要在前面强制加上 BEGIN
[harrdy@controller ~]$ cat /etc/passwd | grep "/bin/bash" | awk '{FS=":"} {printf $1"\t"$3"\n"}'
root:x:0:0:root:/root:/bin/bash	
harrdy	1000
```
```sh
grep -v Name 反选，选择不包括 Name 的这一行
[harrdy@controller ~]$ cat student.txt 
ID       Name       PHP       Linux        MySQL          Average
1        Liming     82        95           86             87.66
2        Sc         99        96           87             85.66
3        Gao        99        83           93             91.66
[harrdy@controller ~]$ cat student.txt | grep -v Name | \
> awk '$6 >= 87 {printf $2"\n"}'
Liming
Gao
```
***
## 第2.4节 字符串截取命令-sed命令
**sed 主要是用来将数据进行选取、替换、删除、新增的命令**
```
sed [option 选项] '[动作]' 文件名
-n, --quiet, --silent
                 suppress automatic printing of pattern space
                 一般sed命令会把所有的数据都输出到屏幕，如果加入此选择，则
                 只会把经过sed命令处理的行输出到屏幕
-e script, --expression=script
                 add the script to the commands to be executed
                 允许对输入数据应用多条sed命令编辑
              
-i               用sed的修改结果直接修改读取数据的文件，而不是由屏幕输出

动作:
a\             追加，在当前行后添加一行或多行
c\             行替换，用c后面的字符串替换原数据行
i\             插入，在当前行前添加一行或多行
d              删除，删除指定的行
p              打印，输出指定的行
s              子串替换，用一个字符串替换另外一个字符串。
               格式：  行范围s/旧子串/新子串/g
```
* 查看文件的第二行
```
[root@controller harrdy]# cat student.txt 
ID       Name       PHP       Linux        MySQL          Average
1        Liming     82        95           86             87.66
2        Sc         74        96           87             85.66
3        Gao        99        83           93             91.66
[root@controller harrdy]# sed -n '2p' student.txt 
1        Liming     82        95           86             87.66
[root@controller harrdy]# 
```
* 接收管道符号
```
[root@controller harrdy]# df
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/sda3       56594436 5965412  50629024  11% /
devtmpfs          916596       0    916596   0% /dev
tmpfs             932648       0    932648   0% /dev/shm
tmpfs             932648   10636    922012   2% /run
tmpfs             932648       0    932648   0% /sys/fs/cgroup
/dev/sda2        2086912   32944   2053968   2% /data
tmpfs             186532       4    186528   1% /run/user/42
tmpfs             186532      40    186492   1% /run/user/1000
/dev/sr0         4364408 4364408         0 100% /run/media/harrdy/CentOS 7 x86_64
[root@controller harrdy]# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda3        54G  5.7G   49G  11% /
devtmpfs        896M     0  896M   0% /dev
tmpfs           911M     0  911M   0% /dev/shm
tmpfs           911M   11M  901M   2% /run
tmpfs           911M     0  911M   0% /sys/fs/cgroup
/dev/sda2       2.0G   33M  2.0G   2% /data
tmpfs           183M  4.0K  183M   1% /run/user/42
tmpfs           183M   40K  183M   1% /run/user/1000
/dev/sr0        4.2G  4.2G     0 100% /run/media/harrdy/CentOS 7 x86_64
[root@controller harrdy]# df -h | sed -n '2p'
/dev/sda3        54G  5.7G   49G  11% /
[root@controller harrdy]# 
```
* 删除第二行到第4行的数据，但是不改变文件本身
```
[root@controller harrdy]# sed '2,4d' student.txt 
ID       Name       PHP       Linux        MySQL          Average
[root@controller harrdy]# cat student.txt 
ID       Name       PHP       Linux        MySQL          Average
1        Liming     82        95           86             87.66
2        Sc         74        96           87             85.66
3        Gao        99        83           93             91.66
[root@controller harrdy]# 
```
* 在第二行后追加hello  也不改变文件本身
```
[root@controller harrdy]# sed '2a hello' student.txt 
ID       Name       PHP       Linux        MySQL          Average
1        Liming     82        95           86             87.66
hello
2        Sc         74        96           87             85.66
3        Gao        99        83           93             91.66
[root@controller harrdy]# cat student.txt 
ID       Name       PHP       Linux        MySQL          Average
1        Liming     82        95           86             87.66
2        Sc         74        96           87             85.66
3        Gao        99        83           93             91.66
[root@controller harrdy]# 
```
* 在第二行前插入数据
```
[root@controller harrdy]# sed '2i hello world' student.txt 
ID       Name       PHP       Linux        MySQL          Average
hello world
1        Liming     82        95           86             87.66
2        Sc         74        96           87             85.66
3        Gao        99        83           93             91.66
[root@controller harrdy]# 

[root@controller harrdy]# sed '2i hello \
> world!!!' student.txt
ID       Name       PHP       Linux        MySQL          Average
hello 
world!!!
1        Liming     82        95           86             87.66
2        Sc         74        96           87             85.66
3        Gao        99        83           93             91.66
[root@controller harrdy]# 
```
* 数据行替换
```
[root@controller harrdy]# sed '2c No such person' student.txt 
ID       Name       PHP       Linux        MySQL          Average
No such person
2        Sc         74        96           87             85.66
3        Gao        99        83           93             91.66
[root@controller harrdy]# 
```
* 字符串替换
```
sed 's/旧子串/新子串/g' 文件名

在第3行中，把74换成99
[root@controller harrdy]# sed '3s/74/99/g' student.txt 
ID       Name       PHP       Linux        MySQL          Average
1        Liming     82        95           86             87.66
2        Sc         99        96           87             85.66
3        Gao        99        83           93             91.66
[root@controller harrdy]# 

运维工作人员修改配置文件常用的方法！！！！
[root@controller harrdy]# sed -i '3s/74/99/g' student.txt 
[root@controller harrdy]# cat student.txt 
ID       Name       PHP       Linux        MySQL          Average
1        Liming     82        95           86             87.66
2        Sc         99        96           87             85.66
3        Gao        99        83           93             91.66
[root@controller harrdy]# 

同时把Liming和Gao替换为空
[root@controller harrdy]# sed -e 's/Liming//g ; s/Gao//g' student.txt 
ID       Name       PHP       Linux        MySQL          Average
1             82        95           86             87.66
2        Sc         99        96           87             85.66
3                99        83           93             91.66
[root@controller harrdy]# 
```
