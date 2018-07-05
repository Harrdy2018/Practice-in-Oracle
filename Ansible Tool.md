# Ansible运维

***
## 2018/07/05
***
### 假设：客户端 10.182.173.70  服务器 10.182.173.155

* 在客户端远程登录到服务器并执行命令  ssh -l harrdy 10.182.173.155 'df'
```
注意：可以用df   也可以用'df'    执行命令后回到了客户端
```

* 实现服务器无密码登录
```
在客户端生成秘钥  ssh-keygen  默认目录/home/harrdy/.ssh  里面包括生成的公钥和私钥
客户端把公钥给服务器 ssh-copy-id -i /home/harrdy/.ssh/id_rsa.pub 10.182.173.155
```

* 删除认证
```
在客户端找到秘钥的目录 /home/harrdy/.shh
删除私钥和公钥即可  rm file
```

* 服务器很多，如何实现自动化
```
脚本语言：
在命令行下做如下测试
seq 128 131
如何实现IP地址生成
for i in `seq 128 131`;do echo 192.108.111.$i;done
追加到文本文件
for i in `seq 128 131`;do echo 192.108.111.$i >>list.txt;done
执行命令
for i in `cat list.txt`;do echo $i;done
批量在服务器执行命令
for i in `cat list.txt`;do ssh -l harrdy 10.182.173.155 'df';done
for i in `cat list.txt`;do echo "The server $i follows results";ssh -l harrdy 10.182.173.155 'df';done
给前面加一个颜色
for i in `cat list.txt`;
do echo "\033[32m The server $i follows results \033[0m";ssh -l harrdy 10.182.173.155 'df';
done
```

* 获取Ansible版本号  ansible --version
* Ansible配置文件目录  /etc/ansible/
```
两个主要配置文件 ansible.cfg hosts
```
***
