# tomocat

***
## 查看tomcat服务状态
* systemctl status tomcat.service   
* systemctl status tomcat
```
[harrdy@client-A-132 ~]$ systemctl status tomcat
● tomcat.service - Apache Tomcat Web Application Container
   Loaded: loaded (/usr/lib/systemd/system/tomcat.service; disabled; vendor preset: disabled)
   Active: inactive (dead)
[harrdy@client-A-132 ~]$ systemctl status tomcat.service
● tomcat.service - Apache Tomcat Web Application Container
   Loaded: loaded (/usr/lib/systemd/system/tomcat.service; disabled; vendor preset: disabled)
   Active: inactive (dead)
```
* **tomcat 现在处于 dead(死亡) 状态，服务还没有跑起来**

***
## 安装
* yum install tomcat
* yum -y install tomcat
* 默认安装目录`/usr/share/tomcat`  里面文件如下
```
[harrdy@client-A-132 tomcat]$ ls
bin  conf  lib  logs  temp  webapps  work
```

***
## 启动
* systemctl start tomcat.service
* systemctl start tomcat
* 查看运行状态
```linux
[harrdy@client-A-132 tomcat]$ systemctl start tomcat
[harrdy@client-A-132 tomcat]$ systemctl status tomcat
● tomcat.service - Apache Tomcat Web Application Container
   Loaded: loaded (/usr/lib/systemd/system/tomcat.service; disabled; vendor preset: disabled)
   Active: active (running) since Sat 2018-07-07 05:48:02 CST; 14s ago
 Main PID: 51794 (java)
    Tasks: 41
   CGroup: /system.slice/tomcat.service
           └─51794 /usr/lib/jvm/jre/bin/java -classpath /usr/share/tomcat/bin/bootstrap.jar:/usr/share/tomcat/bin/tomcat-juli.jar:/usr/sh...

Jul 07 05:48:03 client-A-132 server[51794]: Jul 07, 2018 5:48:03 AM org.apache.catalina.core.StandardService startInternal
Jul 07 05:48:03 client-A-132 server[51794]: INFO: Starting service Catalina
Jul 07 05:48:03 client-A-132 server[51794]: Jul 07, 2018 5:48:03 AM org.apache.catalina.core.StandardEngine startInternal
Jul 07 05:48:03 client-A-132 server[51794]: INFO: Starting Servlet Engine: Apache Tomcat/7.0.76
Jul 07 05:48:03 client-A-132 server[51794]: Jul 07, 2018 5:48:03 AM org.apache.coyote.AbstractProtocol start
Jul 07 05:48:03 client-A-132 server[51794]: INFO: Starting ProtocolHandler ["http-bio-8080"]
Jul 07 05:48:03 client-A-132 server[51794]: Jul 07, 2018 5:48:03 AM org.apache.coyote.AbstractProtocol start
Jul 07 05:48:03 client-A-132 server[51794]: INFO: Starting ProtocolHandler ["ajp-bio-8009"]
Jul 07 05:48:03 client-A-132 server[51794]: Jul 07, 2018 5:48:03 AM org.apache.catalina.startup.Catalina start
Jul 07 05:48:03 client-A-132 server[51794]: INFO: Server startup in 40 ms
```
* **可以看到状态是 `running` 此时已经代表`tomcat`已经正常的跑起来了。此时我们在浏览器中运行 `http://localhost:8080` 发现是不能访问的**

***
## 服务器配置
* **因为前面安装的是 tomcat 的基础服务，并没有安装浏览器管理界面**
*  安装管理界面 首先我们进入到 tomcat 的 webapps 目录，查看目录 ,发现目录是空的，用下面命令安装默认浏览器管理界面
*  `yum install tomcat-webapps tomcat-admin-webapps`
```
[harrdy@client-A-132 webapps]$ ls
examples  host-manager  manager  ROOT  sample
```
* **发现`webapps`目录已经多出了几个目录。此时再用浏览器访问 `http://localhost:8080`就可以看到如下界面**
***
![tomcat测试界面](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/tomcatA.png)
***

```
点击 Manager App 需要我们输入用户和密码，下面我们来设置一个用户。
回到 tomcat 安装目录，进入 conf 目录，打开 tomcat-users.xml 文件，在 <tomcat-users> 标签下，添加如下配置：
<role rolename="manager-gui"/>
<user username="root" password="root" roles="manager-gui"/>
上面我们设置了一个用户，用户名：root , 密码：root 。 
添加完成后，保存退出，然后刷新浏览器，点击 Manager App ， 输入我们设置的用户名和密码，就可以正常登陆了
```
* **在我的机器测试的时候需要重启机器，启动服务才能登陆，结果如下所示**
***
![成功登陆界面](https://github.com/Harrdy2018/Practice-in-Oracle/blob/master/Pictures/tomcatB.jpg)
***

## 其他重要命令
```
停止 tomcat 服务
systemctl stop tomcat.service
systemctl stop tomcat

重启 tomcat 服务
systemctl restart tomcat.service
systemctl restart tomcat

开机启动 tomcat
systemctl enable tomcat
```
