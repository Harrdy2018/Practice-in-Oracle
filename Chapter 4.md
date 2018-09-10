# 第4章 常用命令

***
## 第6节 压缩解压命令
* 压缩命令： gzip
```
命令名称：gzip
命令英文原意: GNU zip

命令所在路径
[harrdy@HJX ~]$ which gzip
/usr/bin/gzip

语法：gzip file
描述：压缩文件
压缩后文件格式: .gz

[harrdy@HJX ~]$ touch aaa
[harrdy@HJX ~]$ gzip aaa
[harrdy@HJX ~]$ ls
aaa.gz 
```
* 解压命令： gunzip
```
命令名称：gunzip
命令英文原意: GNU unzip

命令所在路径
[harrdy@HJX ~]$ which gunzip
/usr/bin/gunzip

语法：gunzip 压缩文件

[harrdy@HJX ~]$ gunzip aaa.gz 
[harrdy@HJX ~]$ ls
aaa  
```
