# 使用ansible写keystone脚本部分存在的问题
## 环境变量的导入
* command模块下，出现错误
```
[root@controller ansible]# echo $OS_USERNAME

[root@controller ansible]# ansible all -m command -a 'export OS_USERNAME=admin'
10.182.173.89 | FAILED | rc=2 >>
[Errno 2] No such file or directory

[root@controller ansible]# echo $OS_USERNAME


```
* shell模块执行语句的时候成功，但是环境变量导不进去
```
[root@controller ansible]# echo $OS_USERNAME

[root@controller ansible]# ansible all -m shell -a 'export OS_USERNAME=admin'
10.182.173.89 | SUCCESS | rc=0 >>


[root@controller ansible]# echo $OS_USERNAME

[root@controller ansible]# 

```
* 尝试用shell模块执行脚本文件
```
```
