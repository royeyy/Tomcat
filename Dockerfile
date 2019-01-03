#=========Dockerfile begin=========
FROM ubuntu:14.04 

# 刷新包缓存 并且 安装wget工具
RUN apt-get update && apt-get install -y wget
# 设置工作目录
WORKDIR /home
# 安装jdk
RUN wget --no-cookies --no-check-certificate --header "Cookie:gpw_e24=http%3a%2f%2fwww.oracle.com%2ftechnetwork%2fjava%2fjavase%2fdownloads%2fjdk7-downloads-1880260.html;oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz
RUN tar -zxf jdk-8u191-linux-x64.tar.gz

# 配置环境变量
ENV JAVA_HOME /home/jdk1.7.0_79
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin

# 安装 tomcat8
#RUN apt-get update
RUN wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz
RUN tar xvf apache-tomcat-8.5.35.tar.gz

# 配置tomcat的环境变量
ENV CATALINA_HOME /home/apache-tomcat-8.5.35

# 容器需要开放Tomcat 8080端口
EXPOSE 8080

#设置tomcat 自启动
CMD [ "/home/apache-tomcat-8.5.35/bin/catalina.sh", "run" ]
#===================Dockerfile end=============
