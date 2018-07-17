# Shell 变量
***
## 第4.1节 Bash变量-用户自定义变量
**环境变量名建议大写，便于区分**
* 用户自定义变量、环境变量、位置参数变量、预定义变量
```sh
本地变量就是用户自定义变量

变量的定义以及调用
[harrdy@controller ~]$ name="harrdy"
[harrdy@controller ~]$ echo $name
harrdy

变量叠加
[harrdy@controller ~]$ aa=123
[harrdy@controller ~]$ aa="$aa"456
[harrdy@controller ~]$ echo $aa
123456
[harrdy@controller ~]$ aa=${aa}789
[harrdy@controller ~]$ echo $aa
123456789

变量查看 set  查看系统当中所有的变量

变量删除 unset aa
[harrdy@controller ~]$ echo $aa
123456789
[harrdy@controller ~]$ unset aa
[harrdy@controller ~]$ echo $aa

[harrdy@controller ~]$ 
```
