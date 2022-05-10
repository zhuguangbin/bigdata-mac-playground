#!/usr/bin/env bash

# 以下数据库部分的参数可以保持默认
export MYSQL_HOST=localhost        #启动的数据库的hostname或者IP
export MYSQL_PORT=3306	           #启动的数据库的服务端口
export MYSQL_ROOT_PASSWORD=root   #创建的root用户的密码
export MYSQL_USER=admin	   #访问MySQL数据库的用户
export MYSQL_PASSWORD=admin   #访问MySQL数据库的密码
export MYSQL_DATABASE=hive2_meta #创建的database
export MYSQL_DATABASE_INITSCRIPT=""
