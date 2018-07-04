# 在虚拟环境上安装CentOS 7

***
## 操作上下键，选择 Install CentOS 7，回车
## 选择英文，点击Continue
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/23.png)

***
## 设置`Date & Time`
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/24.png)

***
## 设置`Software Selection` 选择`Gnome Desktop`
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/25.png)

***
## 设置`Installation Destination` 选择 `I will configure partitioning`
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/26.png)

***
## 设置`Manual Partitioning` 选择`Standard Partiton`
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/27.png)

***
## 设置` Manual Patitioning`
```
添加分区
挂载点分别为swap(容量一般为内存的两倍)，
/data(容量根据个人需求)，
/（容量不填写默认剩余空间的大小）
点击Done
```
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/28.png)

***
## 点击`Accept Changes`
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/29.png)

***
## 配置`Network & Hostname`  把`OFF`改为`ON`即可
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/30.png)

***
## 回到`Installation Summary`界面，基本配置已经完成，点击`Begin Installation`
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/31.png)

***
## 安装中
```
在安装过程中，会出现配置Root Password的选项，点进去即可，密码设置为centos,由于密码比较弱，需要点击两次Done才可以完成这项工作。
```
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/32.png)

***
```
同上，安装过程会现Create User选项，密码为centos,配置如下所示
```
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/33.png)
```
设置完成后，基本上系统还在安装中，等安装完成之后，点击右下角的reboot即可，重启的意思
在重启的过程中会出现license的问题，点击Accept即可
```
***
## CentOS 7 桌面
![](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/34.png)
