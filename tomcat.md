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
