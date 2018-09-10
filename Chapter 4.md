# 第4章 常用命令

***
## 第6节 压缩解压命令
* 压缩命令： gzip    只能压缩文件，不能压缩目录，不保留源文件
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
* 解压命令： gunzip   不保留源文件
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
* 压缩命令： tar
```
命令名称：tar
命令所在路径
[harrdy@HJX ~]$ which tar
/usr/bin/tar

语法：tar -cvf
-c 打包
-v 显示详细信息
-f 指定文件名
-z 打包同时压缩

只是纯粹的打包
[harrdy@HJX ~]$ mkdir testA
[harrdy@HJX ~]$ tar -cvf fname ./testA/
./testA/
[harrdy@HJX ~]$ ls
core.10858  core.2788  Desktop  Documents  Downloads  fname  Music  myDevelopment  mySoftware  Pictures  Public  Templates  testA  Videos
[harrdy@HJX ~]$ 

打包的同时压缩
[harrdy@HJX ~]$ mkdir testA
[harrdy@HJX ~]$ tar -zcvf fname.tar.gz ./testA/
./testA/
[harrdy@HJX ~]$ ls
core.10858  Desktop    Downloads     Music          mySoftware  Public     testA
core.2788   Documents  fname.tar.gz  myDevelopment  Pictures    Templates  Videos
[harrdy@HJX ~]$ 
```
