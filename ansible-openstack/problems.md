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
* command模块执行脚本文件
```
[root@controller ansible]# echo $OS_USERNAME

[root@controller ansible]# ansible all -m command -a 'sh /root/admin-rc'
10.182.173.89 | SUCCESS | rc=0 >>


[root@controller ansible]# echo $OS_USERNAME

[root@controller ansible]# ansible all -m command -a '. /root/admin-rc'
10.182.173.89 | FAILED | rc=13 >>
[Errno 13] Permission denied

[root@controller ansible]# ansible all -m command -a 'source /root/admin-rc'
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
* 尝试用shell模块执行脚本文件,执行成功，环境变量导不进去
```
[root@controller ~]# pwd
/root
[root@controller ~]# cat admin-rc 
export OS_USERNAME=admin
export OS_PASSWORD=ADMIN_PASS
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://controller:35357/v3
export OS_IDENTITY_API_VERSION=3

[root@controller ansible]# echo $OS_USERNAME

[root@controller ansible]# ansible all -m shell -a 'sh /root/admin-rc'
10.182.173.89 | SUCCESS | rc=0 >>


[root@controller ansible]# echo $OS_USERNAME


```
* 使用script模块
```
[root@controller ansible]# echo $OS_USERNAME

[root@controller ansible]# ansible all -m script -a '/root/admin-rc'
10.182.173.89 | SUCCESS => {
    "changed": true, 
    "rc": 0, 
    "stderr": "Shared connection to 10.182.173.89 closed.\r\n", 
    "stderr_lines": [
        "Shared connection to 10.182.173.89 closed."
    ], 
    "stdout": "", 
    "stdout_lines": []
}
[root@controller ansible]# echo $OS_USERNAME

```
* 不使用ansible直接导入,以shell执行脚本文件不能导入
```
[root@controller ~]# cat admin-rc 
export OS_USERNAME=admin
#export OS_PASSWORD=ADMIN_PASS
#export OS_PROJECT_NAME=admin
#export OS_USER_DOMAIN_NAME=Default
#export OS_PROJECT_DOMAIN_NAME=Default
#export OS_AUTH_URL=http://controller:35357/v3
#export OS_IDENTITY_API_VERSION=3
[root@controller ~]# echo $OS_USERNAME

[root@controller ~]# sh /root/admin-rc 
[root@controller ~]# echo $OS_USERNAME

[root@controller ~]# . /root/admin-rc 
[root@controller ~]# echo $OS_USERNAME
admin
[root@controller ~]# unset OS_USERNAME
[root@controller ~]# echo $OS_USERNAME

[root@controller ~]# source /root/admin-rc 
[root@controller ~]# echo $OS_USERNAME
admin
[root@controller ~]# unset OS_USERNAME
[root@controller ~]# 
```

## 创建实例的时候出现问题，前面一切正确，放在ansible里执行就不行，出现错误。
```
[root@controller ~]# ansible all -m command -a 'openstack project create --domain default --description "Demo Project" demo'
10.182.173.89 | FAILED | rc=1 >>
Missing value auth-url required for auth plugin passwordnon-zero return code

[root@controller ~]# openstack project create --domain default --description "Demo Project" demo
Conflict occurred attempting to store project - it is not permitted to have two projects with the same name in the same domain : demo. (HTTP 409) (Request-ID: req-a9dcd256-81b9-406e-b23b-839a8c8bb07d)
[root@controller ~]# ansible all -m command -a 'openstack role create user'10.182.173.89 | FAILED | rc=1 >>
Missing value auth-url required for auth plugin passwordnon-zero return code

[root@controller ~]# openstack role create user
+-----------+----------------------------------+
| Field     | Value                            |
+-----------+----------------------------------+
| domain_id | None                             |
| id        | dc62afcd9b96404d8a22a8415074564d |
| name      | user                             |
+-----------+----------------------------------+
[root@controller ~]# 

```
