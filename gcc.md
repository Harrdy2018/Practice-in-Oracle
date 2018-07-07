# gcc 相关

***
## gcc 工作流程
* 预处理    --E
   * 宏替换
   * 头文件展开
   * 注释去掉
   * xxx.c -> xxx.l  C文件
* 编译      --S
   * xxx.i -> xxx.s  汇编文件
* 汇编      -c
   * xxx.s -> xxx.o  二进制文件
* 链接
   * xxx.o -> xxx  可执行的文件

***
* 安装 yum install gcc
```
方便测试  创建一个 hello.c 文件
[harrdy@client-A-132 Desktop]$ cat hello.c
#include <stdio.h>
int main()
{
  printf("hello,world!!");
}`

gcc hello.c 这个命令会程序生成默认的文件名 a.out
[harrdy@client-A-132 Desktop]$ ls
hello.c
[harrdy@client-A-132 Desktop]$ gcc hello.c
[harrdy@client-A-132 Desktop]$ ls
a.out  hello.c

gcc hello.c -o lk 指定生成的文件名
[harrdy@client-A-132 Desktop]$ gcc hello.c -o lk
[harrdy@client-A-132 Desktop]$ ls
a.out  hello.c  lk

执行程序
[harrdy@client-A-132 Desktop]$ ls
a.out  hello.c  lk
[harrdy@client-A-132 Desktop]$ ./lk
hello,world!!
```

***
## gcc 常用参数
* -v/--version
* -I 编译的时候指定头文件的路劲
* -c 将汇编文件生成二进制文件
```
[harrdy@client-A-132 Desktop]$ ls
hello.c
[harrdy@client-A-132 Desktop]$ gcc hello.c -c
[harrdy@client-A-132 Desktop]$ ls
hello.c  hello.o
[harrdy@client-A-132 Desktop]$ file hello.o
hello.o: ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped
```
* -o 指定生产的文件的名字
* -g gdb 调试的时候需要加
* -D 在编译的时候指定一个宏
* -Wall 编译的时候添加警告信息，提示
* -On 优化代码，n 是优化级别： 1,2,3
