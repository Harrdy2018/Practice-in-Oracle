#!/bin/sh 
# init the MariaDB
# set the default passwd "MariaDB"
# step 1>>>yum remove mariadb-server
# step 2>>>rm -rf /var/lib/mysql/
# step 3>>>yum install mariadb-server
passwd="MariaDB" 
mysql_secure_installation <<!
\n
$passwd
Y
$passwd
$passwd
n
n
n
Y
!
