# Shell 编程


## 字符串截取命令-sed命令
**sed 主要是用来将数据进行选取、替换、删除、新增的命令**
```
sed [option 选项] '[动作]' 文件名
-n, --quiet, --silent
                 suppress automatic printing of pattern space
                 一般sed命令会把所有的数据都输出到屏幕，如果加入此选择，则
                 只会把经过sed命令处理的行输出到屏幕
-e script, --expression=script
                 add the script to the commands to be executed
                 允许对输入数据应用多条sed命令编辑
              
-i               用sed的修改结果直接修改读取数据的文件，而不是由屏幕输出

动作:
a\             追加，在当前行后添加一行或多行
c\             行替换，用c后面的字符串替换原数据行
i\             插入，在当前行前添加一行或多行
d              删除，删除指定的行
p              打印，输出指定的行
s              子串替换，用一个字符串替换另外一个字符串。
               格式：  行范围s/旧子串/新子串/g
```
