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
* 压缩解压命令： tar
```
命令名称：tar
命令所在路径
[harrdy@HJX ~]$ which tar
/usr/bin/tar

语法：tar -zcvf
-c 打包
-v 显示详细信息
-f 指定压缩之后的文件名
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

解压缩 
语法：tar -xvfz
-x 解包
-v 显示详细信息
-f 指定解压文件
-z 解压缩

[harrdy@HJX ~]$ tar -zxvf fname.tar.gz 
./testA/
[harrdy@HJX ~]$ ls
core.10858  Desktop    Downloads     Music          mySoftware  Public     testA
core.2788   Documents  fname.tar.gz  myDevelopment  Pictures    Templates  Videos
[harrdy@HJX ~]$ 
```
* 压缩解压命令 zip
```
[harrdy@HJX ~]$ which zip
/usr/bin/zip

压缩文件 
[harrdy@HJX ~]$ zip fname ./aaa
  adding: aaa (stored 0%)
[harrdy@HJX ~]$ ls
aaa         core.2788  Documents  fname.zip  myDevelopment  Pictures  Templates  Videos
core.10858  Desktop    Downloads  Music      mySoftware     Public    testA
[harrdy@HJX ~]$ 

zip也可以直接压缩目录，我现在还不知道 -r 参数有什么用！
-r   recurse into directories

解压缩
[harrdy@HJX ~]$ ls
aaa  core.10858  core.2788  Desktop  Documents  Downloads  fname.zip  Music  myDevelopment  mySoftware  Pictures  Public  Templates  Videos
[harrdy@HJX ~]$ unzip ./fname.zip 
Archive:  ./fname.zip
   creating: testA/
[harrdy@HJX ~]$ ls
aaa         core.2788  Documents  fname.zip  myDevelopment  Pictures  Templates  Videos
core.10858  Desktop    Downloads  Music      mySoftware     Public    testA
[harrdy@HJX ~]$ 
```
* 解压缩命令 bzip2   -k --keep           keep (don't delete) input files
```
压缩比惊人
[harrdy@HJX ~]$ which bzip2
/usr/bin/bzip2

压缩文件并保留源文件
[harrdy@HJX ~]$ ls
aaa  core.10858  core.2788  Desktop  Documents  Downloads  Music  myDevelopment  mySoftware  Pictures  Public  Templates  testA  Videos
[harrdy@HJX ~]$ bzip2 -k aaa 
[harrdy@HJX ~]$ ls
aaa      core.10858  Desktop    Downloads  myDevelopment  Pictures  Templates  Videos
aaa.bz2  core.2788   Documents  Music      mySoftware     Public    testA
[harrdy@HJX ~]$ 

[harrdy@HJX ~]$ ls
aaa  core.10858  core.2788  Desktop  Documents  Downloads  Music  myDevelopment  mySoftware  Pictures  Public  Templates  testA  Videos
[harrdy@HJX ~]$ tar -jcvf fname.tar.bz2 ./aaa   可以使用参数 -j 代替
./aaa
[harrdy@HJX ~]$ ls
aaa         core.2788  Documents  fname.tar.bz2  myDevelopment  Pictures  Templates  Videos
core.10858  Desktop    Downloads  Music          mySoftware     Public    testA
[harrdy@HJX ~]$ 

解压缩
bunzip2 -k aaa.bz2
tar -jxvf fname.tar.bz2
```
