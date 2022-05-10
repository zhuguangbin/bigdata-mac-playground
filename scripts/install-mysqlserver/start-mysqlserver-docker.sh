#!/usr/bin/env bash
#set -e
echo "====准备安装MySQL数据库===="
if [[ $EUID -ne 0 ]]; then
   echo "请使用root用户执行该安装脚本!"
   exit 1
fi

echo "  1. 请检查数据库配置..."
echo "------------------------------------"
cat ./mysql-env.sh
echo "------------------------------------"
read -r -p "请确认以上配置正确，确认安装? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
 echo "  2. 正在安装中..."
 source mysql-env.sh
 docker pull mysql:5
  if [ $? -eq 0 ];then
   echo "  服务安装正确."
 else
   echo "  安装失败，请检查后重新安装"
   exit 1
 fi
 echo "  服务启动中..."
 containerId=`docker ps -a -q -f "name=mysqlserver"`
 if [[ ! -z "$containerId" ]]; then
   echo "  清理旧服务..."
   docker rm -f $containerId
   echo "  清理完毕."
 fi

 docker run -d --name mysqlserver \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} \
    -e MYSQL_USER=${MYSQL_USER}  \
    -e MYSQL_PASSWORD=${MYSQL_PASSWORD} \
    -e MYSQL_DATABASE=${MYSQL_DATABASE} \
    mysql:5 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
 if [ $? -eq 0 ];then
   echo "  数据库服务启动成功，服务运行中..."
   docker logs mysqlserver
 else
   echo "  启动失败，请检查后重新安装"
   exit 1
 fi

 if [[ ! "$MYSQL_DATABASE_INITSCRIPT"="" ]]; then

   echo "  3. 初始化数据..."
   sleep 10
   docker exec -i mysqlserver mysql -h localhost -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < ./${MYSQL_DATABASE_INITSCRIPT}
   if [ $? -eq 0 ];then
     echo "  数据库初始化成功."
     docker logs mysqlserver
   else
     echo "  安装失败，请检查后重新安装"
     exit 1
   fi

 else
   echo "  no init script"
 fi

 echo "====数据库安装配置完毕, enjoy======"
 ;;

    [nN][oO]|[nN])
 echo "    退出安装."
 exit 1
       ;;

    *)
 echo "输入错误, 请重新运行..."
 exit 1
 ;;
esac


